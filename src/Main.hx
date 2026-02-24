package;

import vscode.ConfigurationTarget;
import vscode.ExtensionContext;
import Vscode;

class Main
{
	@:expose('activate')
	static function activate(context:ExtensionContext)
	{
		final config = Vscode.workspace.getConfiguration('Lua');

		final libs:Array<String> = cast (config.get('workspace.library', []));

		final libPath = context.extensionPath + '/lua_definitions';

		if (!libs.contains(libPath))
		{
			libs.push(libPath);

			config.update('workspace.library', libs, ConfigurationTarget.Global);
		}
	}
}