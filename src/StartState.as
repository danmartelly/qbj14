package
{
	import org.flixel.*;
	
	public class StartState extends FlxState
	{
		override public function create():void
		{
			add(new FlxText(0,0,100,"Press any key to start.")); //adds a 100px wide text field at position 0,0 (top left)
		}
		
		override public function update():void {
			if (FlxG.keys.any()) {
				FlxG.switchState(new SlotState());
				//FlxG.switchState(new PeopleState());
			}
		}
	}
}