package
{
	import org.flixel.*;
	
	public class SlotState extends FlxState
	{
		[Embed(source="../assets/slotcover.png")] public static var slotCoverImg:Class;
		[Embed(source="../assets/slotHandle.png")] public static var slotHandleImg:Class;
		[Embed(source="../assets/slotHandle_alert.png")] public static var slotHandleAlert:Class;
		
		public var _slots:Array = [];
		public var foreground:FlxSprite;
		public var handle:FlxSprite;
		public var isSpinning:Boolean=false;
		
		override public function create():void
		{
			FlxG.mouse.show();
			FlxG.bgColor = 0xffffffff;
			
			
			for (var i:Number = 0; i < 3; i++) {
				var s:SlotSprite = new SlotSprite(i);
				add(s);
				//s.start();
				_slots.push(s);
			}
			
			// foreground has to be added last
			foreground = new FlxSprite(0, 0, slotCoverImg);
			add(foreground);
			handle = new FlxSprite(545, 40, slotHandleAlert);
			add(handle);
		}
		
		override public function update():void {
			// mouse listener equivalent
			var mousePos:FlxPoint = FlxG.mouse.getWorldPosition();
			if (handle.pixelsOverlapPoint(mousePos) && FlxG.mouse.justPressed()) {
				handle.loadGraphic(slotHandleImg);
				for (var i:Number = 0; i < 3; i++) {
					_slots[i].start();
				}
				isSpinning=true;
			}
			if (isSpinning){
				//show the arrow
			}
			super.update();
			var currentIndex:Number = 0;
			for (var i:Number = 0; i < 3; i++) {
				var s:SlotSprite = _slots[i];
				if (s.slotStopped) {
					currentIndex = i + 1;
					break;
				}
			}
			if (currentIndex > 3) currentIndex = 0;
			
			_slots[currentIndex].makeClickable(true);
		}
	}
}