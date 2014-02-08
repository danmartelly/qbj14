package
{
	import org.flixel.*;
	
	public class PeopleState extends FlxState
	{
		public var randos:FlxGroup;
		public var activeRando:RandoSprite;
		public var player:PlayerSprite;
		public var dialog:FlxText;
		public var dialogActive:Boolean = false;
		public var successfulDialogs:Number = 0;
		public var currentDialogIndex:Number = 0;
		public var nextButton:FlxButton;
		
		override public function create():void
		{
			FlxG.bgColor = 0x88888888;
			
			// add other players
			randos = new FlxGroup();
			for (var i:Number = 0; i < 5; i++) {
				var r:RandoSprite = new RandoSprite(i, this);
				randos.add(r);
			}
			add(randos);
			
			player = new PlayerSprite();
			add(player);
			
			//add text
			dialog = new FlxText(30, 440, 400, 'test');
			add(dialog);
			
			// add an objective text
			add(new FlxText(30, 30, 400, "Objective: Talk to the two queer people in the room"));
			
			// add button but hide it from view
			nextButton = new FlxButton(400, 500, "Next", nextThing);
			add(nextButton);
			//nextButton.visible = false;
			//nextButton.active = false;
		}
		
		public function nextThing():void {
			FlxG.switchState(new EndState());
		}
		
		override public function update():void {
			super.update();
			
			if (successfulDialogs >= 4) {
				dialog.text = "YOU TALKED TO ALL THE QUEER PEOPLE IN THE ROOM. YOU WIN!";
				nextButton.visible = true;
				nextButton.active = true;
				return;
			}
			
			//dialog stuff
			if (dialogActive) {
				// just go through the dialog
				if (currentDialogIndex < activeRando.dialogArray.length) {
					dialog.text = activeRando.dialogArray[currentDialogIndex];
				} else {
					dialogActive = false;
					currentDialogIndex = 0;
					activeRando.active = true;
					player.active = true;
					activeRando.alreadyTalkedTo = true;
					successfulDialogs += 1;
				}
				if (FlxG.keys.justPressed("E") || FlxG.keys.justPressed("SPACE")) {
					currentDialogIndex += 1;
				}
				return;
			}
			
			// possibility for dialog to start
			if (FlxG.overlap(randos, player, initializeDialog)) {
				if (activeRando.alreadyTalkedTo) {
					dialog.text = "You have talked to this person today already.";
				} else {
					dialog.text = "Press SPACE to talk to this person.";
					if (FlxG.keys.justPressed("E") || FlxG.keys.justPressed("SPACE")) {
						activeRando.active = false; // freeze the rando in place
						player.active = false; // and the player
						dialogActive = true;
					}
				}
			} else {
				dialog.text = "";
			}
		}
		
		public function initializeDialog(rand:RandoSprite, something:PlayerSprite):void {
			activeRando = rand;
		}
	}
}