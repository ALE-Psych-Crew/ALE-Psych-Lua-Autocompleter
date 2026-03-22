package extension.auto;

typedef HaxeDocRoot = {
	var haxe_version:Null<String>;
	var types:Array<HaxeType>;
}

typedef HaxeType = {
	var kind:String;
}

typedef ClassType = {
	> HaxeType,
	var path:String;
	var params:Null<String>;
	var doc:Null<String>;
	var meta:Null<Array<MetaEntry>>;
	var superclass:Null<String>;
	var interfaces:Array<String>;
	var fields:Array<FieldEntry>;
	var statics:Array<FieldEntry>;
}

typedef EnumType = {
	> HaxeType,
	var path:String;
	var doc:Null<String>;
	var meta:Null<Array<MetaEntry>>;
	var constructors:Array<EnumConstructor>;
}

typedef TypedefType = {
	> HaxeType,
	var path:String;
	var doc:Null<String>;
	var meta:Null<Array<MetaEntry>>;
	var type:Null<TypeRef>;
}

typedef AbstractType = {
	> HaxeType,
	var path:String;
	var doc:Null<String>;
	var meta:Null<Array<MetaEntry>>;
	var over:Null<String>;
	var from:Array<Null<TypeRef>>;
	var to:Array<Null<TypeRef>>;
	var fields:Array<FieldEntry>;
	var statics:Array<FieldEntry>;
}

typedef RawType = {
	> HaxeType,
	var raw:String;
}

typedef FieldEntry = {
	var name:String;
	var access:Array<FieldAccess>;
	var doc:Null<String>;
	var meta:Null<Array<MetaEntry>>;
	var type:Null<TypeRef>;
}

typedef TypeRef = Dynamic;

typedef TypeRefNamed = {
	var kind:String;
	var path:String;
	var params:Array<TypeRef>;
}

typedef TypeRefFunction = {
	var kind:String;
	var args:Array<FuncArg>;
	@:optional var ret:Null<TypeRef>;
}

typedef FuncArg = {
	name:String,
	optional:Bool,
	type:TypeRef
}

typedef TypeRefAnon = {
	var kind:String;
	var fields:haxe.DynamicAccess<TypeRef>;
}

typedef TypeRefDynamic = {
	var kind:String;
	var fields:haxe.DynamicAccess<TypeRef>;
}

typedef TypeRefEnum = {
	var kind:String;
	var path:String;
}

typedef TypeRefRaw = {
	var kind:String;
	var raw:String;
}

typedef EnumConstructor = {
	var name:String;
	var doc:Null<String>;
	var args:Array<TypeRef>;
}

typedef MetaEntry = {
	var name:String;
	var params:Array<String>;
}

enum abstract FieldAccess(String) from String to String {
	var PUBLIC = "public";
	var PRIVATE = "private";
	var STATIC = "static";
}
