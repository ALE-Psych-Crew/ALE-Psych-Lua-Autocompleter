package;

import extension.LuaAutoCompletition;
import vscode.ExtensionContext;

class Main
{
	@:expose('activate')
	static function activate(context:ExtensionContext)
	{
		new LuaAutoCompletition(context);
	}
}