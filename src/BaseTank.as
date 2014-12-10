package
{
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author Nathan Nieuwenhuizen
	 */
	public class BaseTank extends MovieClip
	{
		protected var myTankBody:TankBodyArt;
		protected var myTankTurret:TankTurretArt;
		public var turretRotation:Number;
		
		public function BaseTank()
		{
			//groote van de tank
			this.scaleX = this.scaleY = 0.3;
			
			
			//art van de basetank
			//heeft nu dezelfde art bij enemy als bij player!!!!
			myTankBody = new TankBodyArt();
			this.addChild(myTankBody);
			
			myTankTurret = new TankTurretArt();
			this.addChild(myTankTurret);
			//tot hier
		
		}
		
		public function update():void
		{
			rotateBody();
			rotateTurret();
		
		}
		
		private function rotateBody():void
		{
			this.rotation += Main.input.x * 5;
		}
		
		private function rotateTurret():void
		{
			//Math.atan(y,x) => Radian => Degrees
			//mouseX = positie van muis maar in dit geval (Tank class) positie van tank op x-as.
			var dx:Number = mouseX;
			var dy:Number = mouseY;
			var r:Number = Math.atan2(dy, dx);
			var degrees:Number = r * 180 / Math.PI;
			myTankTurret.rotation = degrees;
			turretRotation = degrees;
		}
		
		
	
	}

}