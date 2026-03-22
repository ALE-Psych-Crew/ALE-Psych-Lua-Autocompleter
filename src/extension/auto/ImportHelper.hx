package extension.auto;

import js.lib.Error;
import vscode.CompletionList;
import vscode.CompletionItem;
import haxe.extern.EitherType;
import vscode.ProviderResult;
import vscode.CompletionContext;
import vscode.CancellationToken;
import vscode.Position;
import vscode.TextDocument;
import extension.auto.HaxeDocRoot;
import js.node.Fs;
import js.node.Os;
import haxe.Json;
import vscode.ExtensionContext;
import vscode.ConfigurationTarget;

using StringTools;

class ImportHelper {
	static final WHITELIST:Array<String> = ["flixel", "openfl", "haxe"];
	static final TYPES_FILE:String = '/types/types.json';
	static final IMPORT_PATTERN:EReg = ~/\bimport\s*\(\s*["']([^"')]+)["']\s*\)/g;

	var modules:Map<String, Array<String>> = new Map<String, Array<String>>();
	var cachedItems:Null<Array<CompletionItem>> = null;
	var context:ExtensionContext;
	var fileImports:Map<String, Array<String>> = new Map<String, Array<String>>();
	var baseLibPath:String;

	public function new(ctx:ExtensionContext, basePath:String):Void {
		context = ctx;
		baseLibPath = basePath;

		Fs.readFile(ctx.extensionPath + TYPES_FILE, (e:Error, b:js.node.Buffer) -> {
			final root:HaxeDocRoot = (Json.parse(b.toString()) : HaxeDocRoot);

			for (t in root.types) {
				if (t.kind != "class")
					continue;

				final clazz:ClassType = (cast t : ClassType);

				var isValid:Bool = false;
				for (pack in WHITELIST) {
					if (clazz.path.contains(pack) && !clazz.path.contains("_")) {
						isValid = true;
						break;
					}
				}

				if (!isValid)
					continue;

				Generator.register(clazz.path, clazz);
			}

			for (t in root.types) {
				if (t.kind != "class")
					continue;

				final clazz:ClassType = (cast t : ClassType);

				var isValid:Bool = false;
				for (pack in WHITELIST) {
					if (clazz.path.contains(pack) && !clazz.path.contains("_")) {
						isValid = true;
						break;
					}
				}

				if (!isValid)
					continue;

				final path:Array<String> = clazz.path.split(".");
				final name:String = path.pop();
				final module:String = path.join(".");

				if (!modules.exists(module))
					modules.set(module, new Array<String>());

				modules.get(module).push(name);
				Generator.generateClass(path, name, clazz);
			}

			Vscode.languages.registerCompletionItemProvider({language: "lua"}, {
				provideCompletionItems: provideItems
			}, '(', '"', "'");

			Vscode.window.onDidChangeActiveTextEditor((editor:Null<vscode.TextEditor>) -> {
				if (editor != null && editor.document.languageId == "lua")
					syncImports(editor.document, true);
				else if (editor != null)
					resetLibrary();
			});

			Vscode.workspace.onDidChangeTextDocument((event:vscode.TextDocumentChangeEvent) -> {
				final doc:TextDocument = event.document;
				if (doc.languageId != "lua")
					return;

				for (change in event.contentChanges) {
					final lineText:String = doc.lineAt(change.range.start.line).text;
					if (lineText.contains("import(") || change.text.contains("\n")) {
						syncImports(doc, false);
						break;
					}
				}
			});

			final active:Null<vscode.TextEditor> = Vscode.window.activeTextEditor;
			if (active != null && active.document.languageId == "lua")
				syncImports(active.document, true);
		});
	}

	function syncImports(document:TextDocument, force:Bool):Void {
		final uri:String = document.uri.toString();
		final imports:Array<String> = extractImports(document.getText());
		final prev:Null<Array<String>> = fileImports.get(uri);

		if (!force && prev != null && arraysEqual(prev, imports))
			return;

		fileImports.set(uri, imports);
		updateLibrary(imports);
	}

	function updateLibrary(imports:Array<String>):Void {
		final config:vscode.WorkspaceConfiguration = Vscode.workspace.getConfiguration('Lua');
		final tmpBase:String = '${Os.tmpdir()}/ale-autocompletition';
		final libs:Array<String> = [baseLibPath];

		for (imp in imports) {
			final dir:String = '$tmpBase/$imp';
			if ((js.Syntax.code("require('fs').existsSync({0})", dir) : Bool))
				libs.push(dir);
		}

		config.update('workspace.library', libs, ConfigurationTarget.Workspace);
	}

	function resetLibrary():Void {
		updateLibrary([]);
	}

	static function extractImports(source:String):Array<String> {
		final found:Array<String> = new Array<String>();
		IMPORT_PATTERN.match("");
		var rest:String = source;
		while (IMPORT_PATTERN.match(rest)) {
			found.push(IMPORT_PATTERN.matched(1));
			rest = IMPORT_PATTERN.matchedRight();
		}
		return found;
	}

	static function arraysEqual(a:Array<String>, b:Array<String>):Bool {
		if (a.length != b.length)
			return false;
		for (i in 0...a.length)
			if (a[i] != b[i])
				return false;
		return true;
	}

	function provideItems(document:TextDocument, position:Position, _:CancellationToken,
			_:CompletionContext):ProviderResult<EitherType<Array<CompletionItem>, CompletionList<CompletionItem>>> {
		if (!isInsideImportArgs(document.lineAt(position).text, position.character))
			return [];
		if (cachedItems != null)
			return cachedItems;
		cachedItems = buildItems();
		return cachedItems;
	}

	function buildItems():Array<CompletionItem> {
		final items:Array<CompletionItem> = new Array<CompletionItem>();
		for (modName => classList in modules) {
			for (sn in classList) {
				final full:String = '$modName.$sn';
				final item:CompletionItem = new CompletionItem(full, vscode.CompletionItemKind.Module);
				item.detail = modName;
				item.insertText = full;
				item.filterText = full;
				item.sortText = full.toLowerCase();
				items.push(item);
			}
		}
		return items;
	}

	static function isInsideImportArgs(line:String, cursor:Int):Bool
		return ~/\bimport\s*\([^)]*$/.match(line.substring(0, cursor));
}
