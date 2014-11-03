package nl.jessestam.Slider.utils.draw {
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Button extends Sprite 
	{
		private var _art:Squar;
		private var _text:TextField;
		
		public function Button($Height:Number, $Width:Number, $x:Number, $y:Number, $colour:uint, $text:String="",$fontsize:Number=12) 
		{
			this.x = $x;
			this.y = $y;
			
			_text = new TextField();
			
			var textfor:TextFormat = new TextFormat(null, $fontsize);
			_text.selectable = false;
			_text.defaultTextFormat = textfor;
			
			_text.text = $text;
			_art = new Squar(0, 0, $Height, $Width, $colour);
			addChild(_art);
			addChild(_text);
		}
		
		public function set text(value:TextField):void 
		{
			_text = value;
		}
		
	}

}