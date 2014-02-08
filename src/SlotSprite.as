package
{
	import org.flixel.*;
	
	public class SlotSprite extends FlxSprite
	{
		[Embed(source="../assets/slots1.png")] public static var slot1Img:Class;
		[Embed(source="../assets/slots2.png")] public static var slot2Img:Class;
		[Embed(source="../assets/slots3.png")] public static var slot3Img:Class;
		
		private const minYPos:Number = -800;
		private const maxYPos:Number = 190; 
		private const individualHeight:Number = 110;
		private const heightOffset:Number = 60;
		private const minStoppingVelocity:Number = 10;
		
		private var images:Array = [slot1Img, slot2Img, slot3Img]; // use index
		private var xOffset:Array = [75, 200, 330];
		private var initialYOffset:Array = [-10, -300, -700];
		private var isStopping:Boolean = false;
		public var slotStopped:Boolean = false;
		private var isClickable:Boolean = false;
		
		public var slotNum:Number;
		
		public function SlotSprite(slotNumber:Number)
		{
			super(xOffset[slotNumber], initialYOffset[slotNumber], images[slotNumber]);
			slotNum=slotNumber;
		}
		
		public function start():void {
			this.maxVelocity.y = 400;
			this.acceleration.y = 300;
		}
		
		public function stop():void {
			isStopping = true;
			this.acceleration.y = -350;
		}
		
		public function makeClickable(b:Boolean):void {
			isClickable = b;
		}
		
		override public function update():void {
			if (isStopping) {
				// When minStoppingVelocity hit, snap to place
				if (this.velocity.y < minStoppingVelocity) {
					this.acceleration.y = 0;
					this.velocity.y = 0;
					var landedSlot=this.y-individualHeight/2;
					this.y = landedSlot - (landedSlot % individualHeight) + heightOffset;
					isStopping=false;
					slotStopped = true;
				}
			}
			
			// make the slot sprite cycle back
			if (this.y > maxYPos) {
				this.y = minYPos;
			}
			
			// mouse listener equivalent
			var mousePos:FlxPoint = FlxG.mouse.getWorldPosition();
			if (isClickable && this.pixelsOverlapPoint(mousePos) && FlxG.mouse.justPressed()) {
				this.stop();
			}
			
			super.update();
		}
	}
}