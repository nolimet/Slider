package nl.jessestam.Slider
{
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.utils.Timer;
	import nl.jessestam.Slider.Parts.Image;
	import nl.jessestam.Slider.utils.draw.Button;
	import nl.jessestam.Slider.utils.loaders.XML_Loader;
	
	/**
	 * ...
	 * @author Jesse Stam
	 */
		
	 
	public class Main extends Sprite 
	{
		private var _loader:URLLoader;
		public var xml:XML;
		private var images:Vector.<Image> = new Vector.<Image>();
		
		private var moveTimer:Timer;
		private var WaitTimer:Timer;
		private var step:Number;
		
		
		private var index:int = 0;
		private var newIndex:int = 0;
		private var maxIndex:int = 0;
		
		private var buttonForward:Button;
		private var buttonBackward:Button;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			XML_Loader("xml/slider.xml"); //setToxml Location
		}
		
		private function Wait(e:TimerEvent):void 
		{
			MoveImg(30, 1024, 100);
		}
		
		private function moveTimerComplete(e:TimerEvent):void 
		{
			index = newIndex;
			
			images[index].x = 0;
			newIndex++;
			if (newIndex >= maxIndex) {
				newIndex = 0;
			}
			
			WaitTimer = new Timer(5000, 1);
			WaitTimer.addEventListener(TimerEvent.TIMER, Wait, false, 0, true);
			WaitTimer.start();
		}
		
		private function automove(e:TimerEvent):void 
		{
			images[index].x += step;
			images[newIndex].x += step;
			
		}
		
		//XmlLoading
		private function XML_Loader($url:String):void
		{
			try{
			_loader = new URLLoader (new URLRequest($url));
			_loader.addEventListener(Event.COMPLETE, onXMLLoad, false, 0, true);
			}
			catch(error:Error){
				trace("Could not get XML");
			}
		}
		
		private function onXMLLoad(e:Event):void 
		{
			xml = XML(e.target.data);
			
			loadImages();
		}
		
		//xml Processing
		private function loadImages():void
		{
			var l:Number = xml.game.length();
			var img : Image;
			for (var i:int = 0; i < l; i++) 
			{
				img = new Image(xml.game[i].img, xml.game[i].text);
				addChild(img);
				img.x = 1024 * i;
				images.push(img);
			}
			maxIndex = l;
			trace(l);
			trace(images);
			
			newIndex = 1;
			WaitTimer = new Timer(5000, 1);
			WaitTimer.addEventListener(TimerEvent.TIMER, Wait, false, 0, true);
			
			WaitTimer.start();
			
			//buttonForward = new Button(70, 70, 1024 - 70, (384 / 2) - 35, 0x444444, ">>", 40);
			//buttonBackward = new Button(70, 70, 0 , (384 / 2) - 35, 0x444444, "<<", 40);
			
			//buttonBackward.addEventListener(MouseEvent.CLICK, backward, false, 0, true);
			//buttonForward.addEventListener(MouseEvent.CLICK, forward, false, 0, true);
			
			//addChild(buttonForward);
			//addChild(buttonBackward);
		}
		
		private function backward(e:MouseEvent):void 
		{
			index = newIndex;
			
			newIndex--;
			if (newIndex <= 0) {
				newIndex = maxIndex-1;
			}
			
			WaitTimer.stop();
			
			MoveImg(30, -1024, 100);
		}
		
		private function forward(e:MouseEvent):void 
		{
			WaitTimer.stop();
			
			index = newIndex;
			
			newIndex++;
			if (newIndex >= maxIndex) {
				newIndex = 0;
			}
			MoveImg(30, 1024, 100);
		}
		
		
		private function MoveImg(steps:int, dist:int, time:Number):void {
			step = dist / steps;
			moveTimer = new Timer(time / steps, steps);
			images[newIndex].x = -dist;
			
			
			moveTimer.addEventListener(TimerEvent.TIMER, automove, false, 0, true);
			moveTimer.addEventListener(TimerEvent.TIMER_COMPLETE, moveTimerComplete, false, 0, true); 
			moveTimer.start();
		}
	}
	
}