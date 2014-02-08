package  
{
	import org.flixel.*;

	public class EndState extends FlxState
	{
		[Embed(source="../assets/AYearWithoutRain.ttf", fontName="RAIN", embedAsCFF="false")] protected var fontCookies:Class;
		private var endText:FlxText=new FlxText(100,200,400,"Who needs labels?");
		
		
		override public function create():void {
			var text:FlxText=new FlxText(100,75,400,"Hope you enjoyed our game! Play again? (press 'y')"); //adds a 100px wide text field at position 0,0 (top left)
			text.setFormat("RAIN",15);
			add(text);
			endText.setFormat("RAIN",30);
			add(endText);
		}
		
		override public function update():void {
			if (FlxG.keys.Y) {
				FlxG.switchState(new StartState());
			}
		}
	}

}