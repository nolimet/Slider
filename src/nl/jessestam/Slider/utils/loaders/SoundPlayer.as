package nl.jessestam.Slider.utils.loaders {
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.net.URLRequest;
	/**
	 * ...
	 * @author Jesse Stam
	 */
	public class SoundPlayer extends Sound
	{
		private var sound:Sound = new Sound();
		private var channel:SoundChannel = new SoundChannel();
		
		public function SoundPlayer(url:String)
		{
			sound.load(new URLRequest(url));
			channel = sound.play(0,9001,null);
		}
		
		public function stop():void
		{
			channel.stop();
		}
	}

}