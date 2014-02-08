package  
{
	import org.flixel.*;
	
	public class PlayerSprite extends FlxSprite
	{
		[Embed(source="../assets/player.png")] public static var playerImg:Class;
		
		
		
		public function PlayerSprite() 
		{
			super(0,0,playerImg);
			maxVelocity.x = 200;
			maxVelocity.y = 200;
			drag.x = maxVelocity.x * 4;
			drag.y = maxVelocity.y * 4;
		}
		
		override public function update():void {
			if (x < 0){
				x = 0;
			}
			if ( x > (FlxG.worldBounds.width - this.frameWidth)) {
				x = FlxG.worldBounds.width - this.frameWidth;
			}
			if (y < 0){
				y = 0;
			}
			if ( y > (FlxG.worldBounds.height - (this.frameHeight+75))) { //75 is lower bar
				y = (FlxG.worldBounds.height - (this.frameHeight+75));
			}
			
			acceleration.x = 0;
			acceleration.y = 0;
			if(FlxG.keys.LEFT || FlxG.keys.A)
				acceleration.x = -maxVelocity.x*4;
			if(FlxG.keys.RIGHT || FlxG.keys.D)
				acceleration.x = maxVelocity.x*4;
			if (FlxG.keys.UP || FlxG.keys.W)
				acceleration.y = -maxVelocity.y * 4;
			if (FlxG.keys.DOWN || FlxG.keys.S)
				acceleration.y = maxVelocity.y * 4;
			
			super.update();
		}
	}

}