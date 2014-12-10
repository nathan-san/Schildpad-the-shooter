package  
{
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Nathan Nieuwenhuizen
	 */
	public class Bullet extends MovieClip
	{
		private var xMove:Number;
		private var yMove:Number;
		public function Bullet(xpos:Number, ypos:Number, rot:Number) 
		{
			
			this.rotation = rot;
			addChild(new BulletArt());
			
			var r:Number = this.rotation * Math.PI / 180;
			//voor bewegen naar rotatie gebruik je sinus en cosinus
			//radian = degrees * PI /180
			//degrees = radian *180/ PI
			
			
			xMove= Math.cos(r);
			yMove = Math.sin(r);
			
			this.x = xpos +(xMove *300)* 0.2;
			this.y = ypos +(yMove *300) *0.2;
		}
		public function update():void 
		{
			this.x += xMove * 9;
			this.y += yMove * 9;
		}
		
	}

}