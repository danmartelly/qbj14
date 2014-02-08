package
{
	import org.flixel.*; //Allows you to refer to flixel objects in your code
	[SWF(width="640", height="480", backgroundColor="#999999")] //Set the size and color of the Flash file
	
	public class qbj14 extends FlxGame
	{
		public function qbj14()
		{
			
			super(640, 480, StartState, 1); //Create a new FlxGame object at 320x240 with 2x pixels, then load PlayState
		}
	}
}