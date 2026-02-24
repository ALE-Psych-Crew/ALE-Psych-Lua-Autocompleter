import haxe.Json;
import js.node.Fs;
import haxe.io.Path;
import vscode.*;

class Main {
	@:expose("activate")
	static function activate(context:ExtensionContext) {
		context.subscriptions.push(Vscode.commands.registerCommand("alepsychlua.enable", function() {
			enable(context);
		}));

		context.subscriptions.push(Vscode.commands.registerCommand("alepsychlua.disable", function() {
			disable(context);
		}));
	}

	static function enable(c:ExtensionContext) {
		final config:WorkspaceConfiguration = Vscode.workspace.getConfiguration("Lua");
		final libs:Array<String> = config.get('workspace.library') ?? [];

		final libPath:String = c.extensionPath + '/lua_definitions';

		if (!libs.contains(libPath)) {
			libs.push(libPath);
			config.update('workspace.library', libs, ConfigurationTarget.Workspace);
		}
	}

	static function disable(c:ExtensionContext) {
		final config:WorkspaceConfiguration = Vscode.workspace.getConfiguration("Lua");
		final libs:Array<String> = config.get('workspace.library') ?? [];

		final libPath:String = c.extensionPath + '/lua_definitions';

		if (libs.contains(libPath)) {
			libs.remove(libPath);
			config.update('workspace.library', libs, ConfigurationTarget.Workspace);
		}
	}
}
