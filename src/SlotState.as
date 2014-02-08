package
{
	import org.flixel.*;
	
	public class SlotState extends FlxState
	{
		
		
		public var _slot1:SlotSprite;
		
		public function SlotState()
		{
			_slot1 = new SlotSprite(1);
			add(_slot1);
			_slot1.start();
		}
		
		override public function update():void {
			super.update();
		}
	}
}