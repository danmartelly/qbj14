package  
{
	import flash.geom.Point;
	
	import org.flixel.*;
	
	public class RandoSprite extends FlxSprite
	{
		[Embed(source="../assets/rando.png")] public static var randoImg:Class;
		private const randoReactDistance:Number = 300;
		private const playerReactDistance:Number = 60;
		private const ambleSpeed:Number = 20;
		private const changeWalkDirectionRate = 4;
		private const allDialogs:Array = [
			["hi", "how are you today?", "I'm doing well too. I just watched that new Lego movie. It was awesome. Have you seen it?", "You should see it. It's great! Anyways see ya around."]
			, ["What's up?", "I have a humidifier at home that has some mold on it. I use it anyways.", "Maybe I should take it apart or something but I keep forgetting.", "Haha. That was random. I'm thirsty so I was thinking of water and then I thought of my humidifer.", "Well, I won't keep you. Bye."]
			, ["hi", "I like your shirt today."]
			, ["hey", "Yesterday I was walking to class and this random bearded guy stopped to talk to me.", "His name was Steve and he invited me to his bible discussion on Tuesday", "I told him I wasn't interested since I'm atheist", "Then we had a conversation for 15 minutes.", "Nice guy. Maybe I'll go to his bible thing."]
			, ["hey", "...", "Sorry. I'm a little tired. Let's talk some other time."]
		];
		
		public var alreadyTalkedTo:Boolean = false;
		
		private var _timer:Number = 0;
		private var state:PeopleState;
		public var dialogArray:Array;
		
		public function RandoSprite(id:Number, state:PeopleState) 
		{
			super(50 + FlxG.random()*100, 50+ FlxG.random()*100,randoImg);
			this.state = state;
			dialogArray = allDialogs[id];
		}
		
		override public function update():void {
			_timer += FlxG.elapsed;
			
			//clipping
			if (x < 0){
				x = 0;
			}
			if ( x > (FlxG.worldBounds.width - this.frameWidth)) {
				x = FlxG.worldBounds.width - this.frameWidth;
			}
			if (y < 0){
				y = 0;
			}
			if ( y > (FlxG.worldBounds.height - (this.frameHeight+75))) { //75 is lower bar
				y = (FlxG.worldBounds.height - (this.frameHeight+75));
			}
			
			var selfPoint:Point = new Point();
			this.getMidpoint().copyToFlash(selfPoint);
			// try to be as far away from all enemies that are close by
			var velocityVector:Point = new Point();
			for each (var otherRando:RandoSprite in state.randos.members) {
				if (this == otherRando || otherRando == null) {continue;}
				var otherPoint:Point = new Point();
				otherRando.getMidpoint().copyToFlash(otherPoint);
				var vectorFromOther:Point = selfPoint.subtract(otherPoint);
				var otherDistance:Number = vectorFromOther.length;
				if (otherDistance < randoReactDistance) {
					//react more to things close by using Coulomb's law
					var normalize:Number = 1./(otherDistance*otherDistance);
					vectorFromOther.normalize(normalize);
					velocityVector = velocityVector.add(vectorFromOther);
				}
			}
			// if velocityVector != 0 then we can apply it
			if (velocityVector.x != 0 || velocityVector.y != 0) {
				velocityVector.normalize(ambleSpeed);
				velocity.copyFromFlash(velocityVector);
				return;
			}
			
			//random behavior when nothing of interest is close by
			if (_timer > changeWalkDirectionRate) {
				_timer = 0;
				velocity.y = FlxG.random()*2*ambleSpeed - ambleSpeed;
				velocity.x = FlxG.random()*2*ambleSpeed - ambleSpeed;
			}
		}
	}

}