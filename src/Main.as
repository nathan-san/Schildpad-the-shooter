package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Nathan Nieuwenhuizen
	 */
	public class Main extends Sprite 
	{
		
		
		private var myTank:Tank;
		public static var input:Point = new Point();
		private var enemies: Vector.<EnemyTank>		
		private var bullets:Array;
		
		public function Main():void 
		{
			if (stage) 
				init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			bullets = new Array();
			
			myTank = new Tank();
			addChild(myTank);
			myTank.x = stage.stageWidth * 0.5;
			myTank.y = stage.stageHeight * 0.5;
			myTank.addEventListener("SHOOT", createBullet);
			
			//enemy
			enemies = new Vector.<EnemyTank>();
			for (var i:int = 0; i < 30; i++)
			{
				var enemy:EnemyTank = new EnemyTank();
				enemies.push(enemy);
				addChild(enemy);
				enemy.x = stage.stageWidth * Math.random();
				enemy.y = stage.stageHeight * Math.random();
				
			}
			
			stage.addEventListener( KeyboardEvent.KEY_DOWN, onKeyDown);
			stage.addEventListener( KeyboardEvent.KEY_UP, onKeyUp);
			addEventListener(Event.ENTER_FRAME, loop);
		}
		
		private function createBullet(e:Event):void 
		{
			var bullet:Bullet = new Bullet(myTank.x, myTank.y, myTank.rotation+myTank.turretRotation);
			bullets.push(bullet);
			addChild(bullet);
			bullet.scaleX = bullet.scaleY = myTank.scaleY;
			
			//bullets.push(new Bullet());
			//addChild(bullets[bullets.length-1]);
			//code om altijd het laatste voorwrp uit je array te halen.
		}
		
		private function loop(e:Event):void 
		{
			myTank.update();
			
			var length:int = enemies.length;
			for (var j:int = 0; j < length; j++)
			{
				enemies[j].update();
			}
			for (var i:int = 0; i < bullets.length; i++)
			{
				bullets[i].update();
			}
		}
		
		private function onKeyUp (e:KeyboardEvent):void 
		{
			if (e.keyCode == Keyboard.D || e.keyCode == Keyboard.A)
			{
				input.x = 0;
			}
			if (e.keyCode == Keyboard.S || e.keyCode == Keyboard.W)
			{
				input.y= 0;
			}
		}
		
		private function onKeyDown (e:KeyboardEvent):void 
		{
			
			
			if (e.keyCode == Keyboard.D)
			{
				input.x = 1;
			}
			if (e.keyCode == Keyboard.A)
			{
				input.x = -1;
			}
			if (e.keyCode == Keyboard.S)
			{
				input.y = -1;
			}
			if (e.keyCode == Keyboard.W)
			{
				input.y = 1;
			}
		
		}
		
	}
	
}