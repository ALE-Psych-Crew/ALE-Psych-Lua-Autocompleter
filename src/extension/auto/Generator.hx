package extension.auto;

import js.node.Fs;
import extension.auto.HaxeDocRoot.FieldAccess;
import extension.auto.HaxeDocRoot.FieldEntry;
import extension.auto.HaxeDocRoot.FuncArg;
import extension.auto.HaxeDocRoot.TypeRefFunction;
import extension.auto.HaxeDocRoot.TypeRefRaw;
import extension.auto.HaxeDocRoot.ClassType;
import js.node.Os;

using StringTools;

class Generator {
	static var typeRegistry:Map<String, ClassType> = new Map<String, ClassType>();

	public static function register(path:String, clazz:ClassType):Void {
		typeRegistry.set(path, clazz);
	}

	public static function generateClass(module:Array<String>, name:String, clazz:ClassType):Void {
		final dirPath:String = '${Os.tmpdir()}/ale-autocompletition/${module.join(".")}.$name';
		final filePath:String = '$dirPath/module.lua';

		js.Syntax.code("require('fs').mkdirSync({0}, {{ recursive: true }})", dirPath);

		if (Fs.existsSync(filePath))
			return;

		final buf:StringBuf = new StringBuf();

		if (clazz.superclass != null) {
			final superName:String = clazz.superclass.split(".").pop();
			buf.add('---@class $name : $superName\n');
		} else {
			buf.add('---@class $name\n');
		}

		if (clazz.doc != null)
			emitDoc(buf, clazz.doc);

		buf.add('$name = {}\n\n');

		for (f in collectFields(clazz, true)) {
			if (!f.access.contains(FieldAccess.PUBLIC))
				continue;
			emitField(buf, name, f, true);
		}

		for (f in collectFields(clazz, false)) {
			if (!f.access.contains(FieldAccess.PUBLIC))
				continue;
			emitField(buf, name, f, false);
		}

		js.Syntax.code("require('fs').writeFileSync({0}, {1})", filePath, buf.toString());
	}

	static function collectFields(clazz:ClassType, statics:Bool):Array<FieldEntry> {
		final result:Array<FieldEntry> = new Array<FieldEntry>();
		final seen:Map<String, Bool> = new Map<String, Bool>();
		var current:Null<ClassType> = clazz;

		while (current != null) {
			final fields:Array<FieldEntry> = statics ? current.statics : current.fields;
			for (f in fields) {
				if (!seen.exists(f.name)) {
					seen.set(f.name, true);
					result.push(f);
				}
			}
			current = current.superclass != null ? typeRegistry.get(current.superclass) : null;
		}

		return result;
	}

	static function emitField(buf:StringBuf, name:String, f:FieldEntry, isStatic:Bool):Void {
		if (f.type == null)
			return;

		final kind:String = (cast f.type : {kind: String}).kind;

		if (f.doc != null)
			emitDoc(buf, f.doc);

		if (kind == "function") {
			final func:TypeRefFunction = (cast f.type : TypeRefFunction);

			for (arg in func.args) {
				final postfix:String = arg.optional ? "?" : "";
				final argType:String = resolveType(arg);
				buf.add('---@param ${arg.name.replace("?", "")} $argType$postfix\n');
			}

			if (f.name == "new") {
				buf.add('---@return ${name}\n');
			} else {
				buf.add('---@return ${resolveType(func)}\n');
			}

			buf.add(isStatic ? 'function $name.${f.name}(' : 'function $name:${f.name}(');

			for (i => arg in func.args) {
				buf.add(arg.name.replace("?", ""));
				if (i != func.args.length - 1)
					buf.add(", ");
			}

			buf.add(")");
			if (f.name == "new")
				buf.add(' return $name ');
			buf.add(' end\n\n');
		} else if (kind == "c") {
			final c:TypeRefRaw = (cast f.type : TypeRefRaw);
			final pathMatch:EReg = ~/<c path="([^"]+)"/;

			if (pathMatch.match(c.raw)) {
				final parts:Array<String> = pathMatch.matched(1).split(".");
				buf.add('---@type ${haxeTypeToLua(parts[parts.length - 1])}\n');
			} else {
				buf.add('---@type any\n');
			}
			buf.add('$name.${f.name} = nil\n\n');
		} else if (Std.isOfType(f.type, String)) {
			final type:String = (cast f.type : String);
			buf.add('---@type ${haxeTypeToLua(type)}\n');
			buf.add('$name.${f.name} = nil\n\n');
		}
	}

	static function resolveType(t:Dynamic) {
		var type:String = resolveTypeRef(t, "any");
		if (type == "T")
			return "any";
		return type;
	}

	static function resolveTypeRef(t:Dynamic, fallback:String):String {
		if (t == null)
			return fallback;

		if (Std.isOfType(t, String))
			return haxeTypeToLua(t);

		final k:String = t.kind;

		if (k == "type" || k == "named") {
			if (t.path != null)
				return haxeTypeToLua((t.path : String).split(".").pop());
		}

		if (k == "c" || k == "x") {
			final raw:String = t.raw != null ? (t.raw : String) : "";
			final m:EReg = ~/<[cx] path="([^"]+)"/;
			if (m.match(raw))
				return haxeTypeToLua(m.matched(1).split(".").pop());
		}

		if (k == "enum") {
			if (t.path != null)
				return haxeTypeToLua((t.path : String).split(".").pop());
		}

		if (k == "anon" || k == "dynamic")
			return "table";

		if (k == "function")
			return "function";

		return fallback;
	}

	static function emitDoc(buf:StringBuf, doc:String):Void {
		for (line in doc.split("\n")) {
			final trimmed:String = line.trim();
			if (trimmed.length > 0)
				buf.add('--- $trimmed\n');
		}
	}

	static function haxeTypeToLua(typeName:String):String {
		return switch (typeName) {
			case "Int", "Float": "number";
			case "String": "string";
			case "Bool": "boolean";
			case "Void": "nil";
			case "Dynamic", "Any": "any";
			case "Array": "table";
			case _: typeName;
		};
	}
}
