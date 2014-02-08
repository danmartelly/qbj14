package
{
	import org.flixel.*;
	
	public class StartState extends FlxState
	{
		override public function create():void
		{
			add(new FlxText(0,0,100,"Hello, World!")); //adds a 100px wide text field at position 0,0 (top left)
		}
	}
}