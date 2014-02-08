package
{
	import org.flixel.*;
	
	public class SlotSprite extends FlxSprite
	{
		[Embed(source="../assets/slots1.png")] public static var slot1Img:Class;
		[Embed(source="../assets/slots2.png")] public static var slot2Img:Class;
		[Embed(source="../assets/slots3.png")] public static var slot3Img:Class;
		
		private const minYPos:Number = -990;
		private const maxYPos:Number = 990; 
		private const individualHeight:Number = 110;
		private const heightOffset:Number = 20;
		private const minStoppingVelocity:Number = 40;
		
		private var images:Array = [slot1Img, slot2Img, slot3Img]; // use index
		private var xOffset:Array = [75, 190, 330];
		private var initialYOffset:Array = [-10, -300, -700];
		public var isStopping:Boolean = false;
		public var isClickable:Boolean = true;
		
		public function SlotSprite(slotNumber:Number)
		{
			super(xOffset[slotNumber], initialYOffset[slotNumber], images[slotNumber]);
		}
		
		public function start():void {
			this.maxVelocity.y = 200;
			this.acceleration.y = 150;
		}
		
		public function stop():void {
			isStopping = true;
			this.acceleration.y = -100;
		}
		
		override public function update():void {
			if (isStopping) {
				// When minStoppingVelocity hit, snap to place
				if (this.velocity.y < minStoppingVelocity) {
					this.acceleration.y = 0;
					this.velocity.y = 0;
					this.y = this.y - (this.y % individualHeight) + heightOffset;
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