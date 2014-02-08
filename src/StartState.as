package
{
	import org.flixel.*;
	
	public class StartState extends FlxState
	{
		[Embed(source="../assets/AYearWithoutRain.ttf", fontName="RAIN", embedAsCFF="false")] protected var fontCookies:Class;
		override public function create():void
		{
			var title:FlxText = new FlxText(30, 40, 500, "Mismatched Slots & Queerdar: two minigames");
			title.setFormat("RAIN",27);
			add(title);
			
			var Instr:FlxText = new FlxText(30, 80, 500, "Press any key to play!");
			Instr.setFormat("RAIN",20);
			add(Instr);
			
			var desc1:FlxText = new FlxText(30, 140, 600, "This game is about correctly labeling things around us." +
			"\nThis game was made for the QUILTBAG Jam 2014. From the website:" +
			"\n\n'QUILTBAG Jam is a game jam dedicated to supporting games with queer relevance and content'");
			desc1.setFormat("RAIN",20);
			add(desc1);

			var desc2:FlxText = new FlxText(20, 320, 500, "This game is about correctly labeling things around us." + 
			"\n\nMade by: Lili Sun, Daniel Martelly");
			desc2.setFormat("RAIN",20);
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