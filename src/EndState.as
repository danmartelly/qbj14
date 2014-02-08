package  
{
	import org.flixel.*;

	public class EndState extends FlxState
	{
		
		override public function create():void {
			add(new FlxText(0,0,100,"Hope you enjoyed our game! Play again? (press 'y')")); //adds a 100px wide text field at position 0,0 (top left)
		}
		
		override public function update():void {
			if (FlxG.keys.Y) {
				FlxG.switchState(new StartState());
			}
		}
	}

}