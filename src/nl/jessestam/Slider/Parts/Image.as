package nl.jessestam.Slider.Parts 
{
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.net.URLRequest;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import nl.jessestam.Slider.utils.draw.Squar;
	/**
	 * ...
	 * @author Jesse Stam
	 */
	public class Image extends Sprite
	{
		private var img:Loader;
		private var textF:TextField;
		private var textBack:Squar;
		public function Image($img:String, text:String) 
		{
			
			
			img = new Loader();
			img.load(new URLRequest("Images/Slider/" + $img + ".png"));
			addChild(img);
			
			textF = new TextField();
			textF.defaultTextFormat = new TextFormat(null, 20, null, null, null, null, null, null, "center");
			textF.width = 1024;
			textF.height = 40;
			textF.text = text;
			textF.y = 384 - textF.height;
			
			textBack = new Squar(0, textF.y, 40, 1024, 0xcccccc, 0.5);
			addChild(textBack);
			addChild(textF);
		}
		
	}

}