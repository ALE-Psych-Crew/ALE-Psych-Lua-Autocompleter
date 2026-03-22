package extension;

import extension.auto.ImportHelper;
import vscode.ConfigurationTarget;
import vscode.ExtensionContext;

class LuaAutoCompletition {
	public var context:ExtensionContext;
	public var importHelper:ImportHelper;

	public function new(c:ExtensionContext):Void {
		context = c;

		final libPath:String = context.extensionPath + '/lua_definitions';

		try {
			ensureBaseLibrary(libPath);
		} catch (e:Dynamic) {
			Vscode.window.showErrorMessage("Error on ALE-PSYCH Lua Extension: " + e);
		}

		importHelper = new ImportHelper(context, libPath);
	}

	function ensureBaseLibrary(libPath:String):Void {
		final config:vscode.WorkspaceConfiguration = Vscode.workspace.getConfiguration('Lua');
		final libs:Array<String> = config.get('workspace.library', []);

		if (!libs.contains(libPath)) {
			libs.push(libPath);
			config.update('workspace.library', libs, ConfigurationTarget.Global);
		}
	}
}
