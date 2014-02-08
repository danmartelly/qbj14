package
{
	import org.flixel.*;
	
	public class SlotState extends FlxState
	{
		[Embed(source="../assets/slotcover.png")] public static var slotCoverImg:Class;
		
		public var _slots:Array = [];
		public var foreground:FlxSprite;
		
		override public function create():void
		{
			FlxG.mouse.show();
			FlxG.bgColor = 0x0fffffff;
			
			
			for (var i:Number = 0; i < 3; i++) {
				var s:SlotSprite = new SlotSprite(i);
				add(s);
				s.start();
				_slots.push(s);
			}
			
			// foreground has to be added last
			foreground = new FlxSprite(0, 0, slotCoverImg);
			add(foreground);
		}
		
		override public function update():void {
			super.update();
		}
	}
}