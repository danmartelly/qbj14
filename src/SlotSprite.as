package
{
	import org.flixel.*;
	
	public class SlotSprite extends FlxSprite
	{
		[Embed(source="../assets/slotPlaceholder.png")] public static var slot1Img:Class;
		[Embed(source="../assets/slotPlaceholder.png")] public static var slot2Img:Class;
		[Embed(source="../assets/slotPlaceholder.png")] public static var slot3Img:Class;
		
		private const maxYPos:Number = 400; 
		private const individualHeight:Number = 40;
		private const minStoppingVelocity:Number = 40;
		
		private var images:Array = [slot1Img, slot2Img, slot3Img]; // use index
		private var xOffset:Array = [80, 120, 180];
		public var _isStopping:Boolean = false;
		
		public function SlotSprite(slotNumber:Number)
		{
			super(xOffset[slotNumber], 40, images[slotNumber]);
		}
		
		public function start():void {
			this.maxVelocity.y = 200;
			this.acceleration.y = 150;
		}
		
		public function stop():void {
			_isStopping = true;
			this.acceleration.y = -100;
		}
		
		override public function update():void {
			if (_isStopping) {
				// When minStoppingVelocity hit, snap to place
				if (this.velocity.y < minStoppingVelocity) {
					this.acceleration.y = 0;
					this.velocity.y = 0;
					this.y = this.y - (this.y % individualHeight);
				}
			}
			
			// make the slot sprite cycle back
			if (this.y > maxYPos) {
				this.y = 40;
			}
			
			// mouse listener equivalent
			var mousePos:FlxPoint = FlxG.mouse.getWorldPosition();
			if (this.pixelsOverlapPoint(mousePos) && FlxG.mouse.justPressed()) {
				this.stop();
			}
			
			super.update();
		}
	}
}