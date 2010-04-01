package
{
  import cmodule.lua_wrapper.CLibInit;
  import flash.utils.ByteArray;

  public class LuaAssets
  {
	[Embed(source="../assets/love.lua", mimeType="application/octet-stream")]
    private static var _loveLuaClass:Class;
    [Embed(source="../assets/main.lua", mimeType="application/octet-stream")]
    private static var _mainLuaClass:Class;
    private static var _embeddedLuaFiles:Array = [
      { path:"love.lua", asset:_loveLuaClass },
	  { path:"main.lua", asset:_mainLuaClass },
    ];

    public static function init():void
    {
      const libInitializer:CLibInit = new CLibInit();
      var luaFile:Object;
      for each (luaFile in _embeddedLuaFiles)
      {
        var luaAsset:ByteArray = new luaFile.asset() as ByteArray;
        libInitializer.supplyFile(luaFile.path, luaAsset);
      }
    }
  }
}
