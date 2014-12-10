package  
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;
	/**
	 * ...
	 * @author Nathan Nieuwenhuizen
	 */
	public class Tank extends BaseTank
	{
		public function Tank() 
		{			
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void 
		{
			stage.addEventListener(MouseEvent.CLICK, onClick);		
		}
		
		private function onClick(e:MouseEvent):void
		{
			dispatchEvent ( new Event("SHOOT"));
		}
		
		override public function update():void
		{
			moveTank();
			super.update();
		}
		
		private function moveTank():void
		{
			var r:Number = this.rotation * Math.PI / 180;
			//voor bewegen naar rotatie gebruik je sinus en cosinus
			//radian = degrees * PI /180
			//degrees = radian *180/ PI
			
			var xMove:Number = Math.cos(r);
			var yMove:Number = Math.sin(r);
			
			this.x += Main.input.y * xMove * 5;
			this.y += Main.input.y * yMove * 5;
		
		}
	}
}