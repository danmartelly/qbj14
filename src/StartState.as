package
{
	import org.flixel.*;
	
	public class StartState extends FlxState
	{
		override public function create():void
		{
			var title:FlxText = new FlxText(300, 40, 300, "Mismatched Slots and Queerdar: two minigames");
			add(title);
			
			var desc1:FlxText = new FlxText(30, 100, 600, "This game is about correctly labeling things around us." +
			"\nThis game was made for the QUILTBAG Jam 2014. From the website:" +
			"\n\n'QUILTBAG Jam is a game jam dedicated to supporting games with queer relevance and content'");
			add(desc1);

			var desc2:FlxText = new FlxText(20, 300, 500, "This game is about correctly labeling things around us." + 
			"\n\nMade by: Lili Sun, Daniel Martelly");
			add(desc2);
		}
		
		override public function update():void {
			if (FlxG.keys.any()) {
				FlxG.switchState(new SlotState());
				//FlxG.switchState(new PeopleState());
			}
		}
	}
}