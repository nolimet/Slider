package nl.jessestam.Slider.utils.loaders {
	import flash.display.Sprite;
	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	/**
	 * ...
	 * @author ...
	 */
	public class XML_Loader extends Sprite
	{
		public var loaded:XML;
		private var loader:URLLoader
		public function XML_Loader(url:String) 
		{
			loader = new URLLoader (new URLRequest(url));
			loader.addEventListener(Event.COMPLETE, onXMLLoad, false, 0, true);
		}
		
		private function onXMLLoad(e:Event):void 
		{
			loaded = XML(e.target.data);
			//trace(loaded.row[0].collum[0]);
		}
	}
}