package
{
  import mx.collections.ArrayCollection;
  import mx.core.ByteArrayAsset;

  public class LuaSampleCode
  {
    [Embed(source="../assets/hello.lua", mimeType="application/octet-stream")]
    private static var _helloLuaClass:Class;

    [Embed(source="../assets/image.lua", mimeType="application/octet-stream")]
    private static var _imageLuaClass:Class;

    [Embed(source="../assets/mouse.lua", mimeType="application/octet-stream")]
    private static var _mouseLuaClass:Class;

    [Embed(source="../assets/keyboard.lua", mimeType="application/octet-stream")]
    private static var _keyboardLuaClass:Class;

    [Embed(source="../assets/mousecallback.lua", mimeType="application/octet-stream")]
    private static var _mousecallbackClickLuaClass:Class;
    
    [Embed(source="../assets/love.lua", mimeType="application/octet-stream")]
    private static var _loveLuaClass:Class;

    private static var _embeddedLuaFiles:Array = [
        {label:"Hello World", asset:_helloLuaClass},
        {label:"Loading an Image and displaying it", asset:_imageLuaClass},
        {label:"Mouse", asset:_mouseLuaClass},
        {label:"Keyboard callbacks", asset:_keyboardLuaClass},
        {label:"Mouse callbacks", asset:_mousecallbackClickLuaClass},
        {label:"Love", asset:_loveLuaClass},
     //   {label:"Create AS Object", asset:_createASObjectLuaClass},
     //   {label:"Namespace Call setTimeout()", asset:_setTimeoutLuaClass},
        //{label:"Pause Count with FlYield", asset:_pauseCountLuaClass}, TODO as3.flyield() not working as expected
    ];

    [Bindable]
    public static var sampleCode:ArrayCollection = new ArrayCollection();

    public static function init():void
    {
        var luaFile:Object;
        sampleCode.removeAll();
        for each (luaFile in _embeddedLuaFiles)
        {
            var luaAsset:ByteArrayAsset = ByteArrayAsset(new luaFile.asset());
            var luaString:String = luaAsset.toString();
            sampleCode.addItem({label:luaFile.label, code:luaString});
       }
    }


  }
}
