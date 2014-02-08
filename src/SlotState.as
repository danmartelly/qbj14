package
{
	import org.flixel.*;
	
	public class SlotState extends FlxState
	{
		[Embed(source="../assets/slotcover.png")] public static var slotCoverImg:Class;
		[Embed(source="../assets/slotHandle.png")] public static var slotHandleImg:Class;
		[Embed(source="../assets/slotHandle_alert.png")] public static var slotHandleAlert:Class;
		[Embed(source="../assets/slotArrow.png")] public static var slotArrow:Class;
		
		public var _slots:Array = [];
		public var foreground:FlxSprite;
		public var handle:FlxSprite;
		public var arrow:FlxSprite;
		public var isSpinning:Boolean=false;
		public var isDone=false;
		
		private var initialXOffset:Number=75;
		private var indivCellWidth:Number = 130;
		
		public var nextButton:FlxButton;
		
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
			arrow = new FlxSprite(initialXOffset+40, 40, slotArrow);
			add(arrow);
			arrow.visible = false;
			
			// add button but hide it from view
			nextButton = new FlxButton(400, 400, "Next", nextThing);
			add(nextButton);
			nextButton.visible = false;
			nextButton.active = false;
		}
		
		public function nextThing():void {
			FlxG.switchState(new PeopleState());
		}
		
		override public function update():void {
			// mouse listener equivalent
			var mousePos:FlxPoint = FlxG.mouse.getWorldPosition();
			if (handle.pixelsOverlapPoint(mousePos) && FlxG.mouse.justPressed()) {
				handle.loadGraphic(slotHandleImg);
				arrow.visible = true;
				for (var i:Number = 0; i < 3; i++) {
					_slots[i].start();
				}
				isSpinning=true;
			}
			
			if (isSpinning){
				//show the arrow
			}
			
			var currentIndex:Number = 0;
			for (var i:Number = 0; i < 3; i++) {
				var s:SlotSprite = _slots[i];
				if (s.slotStopped) {
					_slots[currentIndex].makeClickable(false);
					currentIndex = i + 1;
				}
			}
			if (currentIndex >= 3) {
				currentIndex = 0;
				isDone=true;
			}
			
			if (!isDone){
				_slots[currentIndex].makeClickable(true);
				arrow.x=initialXOffset+40+currentIndex*indivCellWidth;
			}else{
				arrow.visible=false;
				nextButton.visible = true;
				nextButton.active = true;
				FlxG.mouse.show();
			}
			super.update();
		}
	}
}