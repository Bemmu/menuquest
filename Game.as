package {
	import flash.display.*;
	import flash.events.*;
	import flash.geom.*;
	import flash.utils.*;

	public class Game extends MovieClip {
		var frontbufferBitmapData;

		function refresh(evt) {
			controls();
		}

		private var menuTree = {
			"hope_happy" : {
				"text" : ( <![CDATA[
     I HOPE YOU ARE
     HAPPY NOW.

     0 NOT YET
     1 SEE IF I CARE
     2 OK SORRY

]]> ).toString(),
				"choices" : {
					0 : "hope_happy",
					1 : "hope_happy",
					2 : function () {
						gotoAndStop(1);
						return "start_game";
					}
				}
			},
			"start_game" : {
				"text" : ( <![CDATA[






     HOW MANY PLAYERS?

         0 ONE
         1 TWO

]]> ).toString(),
				"choices" : {
					0 : function () { 
						gotoAndPlay(3);
						return "one";
					},
					1 : "two"
				}
			},
			"spam_con_carne" : {
				"playSound" : ConCarne,
				"text" : ( <![CDATA[

    ROBOT WAITER APPEARS.

    "SPAM WITHOUT MEAT?"

    IT PAUSES TO CONSIDER
    YOUR REQUEST.

  KICK SPACE TO CONTINUE.







0
]]> ).toString(),
				"choices" : {
					0 : "spam_con_carne2"
				}
			},
			"spam_con_carne2" : {
				"playSound" : Equanimity,
				"text" : ( <![CDATA[

  
   "ILLOGICAL.
    OXYMORONICAL.
    EQUANIMI???"

  IT EXPLODES. CAUSING A
  HOLE IN THE WALL.
  SPACE DEVOURS YOU. 
  DEATH.



0
]]> ).toString(),
				"choices" : {
					0 : "first"
				}
			},
			"one" : {
				"eraseBackground" : true,
				"text" : ( <![CDATA[
   .          . .      .
 .       .      .    .  . 
   .  .   .    .  .    . 
 .        .   .        . . 
   .    .         .     .
   .          . .      .
 .       .      .    .  . 
   .  .   .    .  .    . 
 .        .   .        . . 
   .    .         .     .
   IN A GALAXY FAR AWAY
    .        .      .
 .       .      .    .  . 
   .  .   .    .  .    . 
 .        .   .        . . 
   .    .         .     .
 AN ASTRONAUT BATTLES WITH
     .     . .      .
 .       .      .    .  . 
   .  .   .    .  .    . 
 .        .   .        . . 
   .    .         .     .
 .   WHAT TO ORDER IN . .
   .  .   .    .  .    . 
 .        .   .        . . 
   .    .         .     .
  . A SPACE RESTAURANT .
     .     . .      .
 .       .      .    .  . 

        GRAND MENU
  +---------------------+
  |                     |
  | 0 TODAY'S SPECIAL   |
  | 1 SPAM              |
  | 2 SPAM CON CARNE    |
  |                     |
  +---------------------+


]]> ).toString(),
				"choices" : {
					0 : function (t) { 
						gotoAndStop(1); 
						return "today's_special"; 
					},
					1 : function () { gotoAndStop(1); return "spam"; },
					2 : function () { gotoAndStop(1); return "spam_con_carne"; }
				}
			},
			"start_game_angry" : {
				"text" : ( <![CDATA[






     HOW MANY PLAYERS?

        0 ONE  <-- 
        1 TWO

]]> ).toString(),
				"choices" : {
					0 : function () {
						gotoAndPlay(3);
						return "one";
					},
					1 : function () {
						gotoAndStop(2);
						return "hope_happy";
					}
				}
			},
			"today's_special" : {
				"eraseBackground" : true,
				"playSound" : Special,
				"text" : ( <![CDATA[

     ROBOT WAITER APPEARS

     YOU WANTED TO ORDER
     TODAY'S SPECIAL?

        0 YES
        1 NO
        2 WHAT IS IT?

]]> ).toString(),
				"choices" : {
					0 : "yes_death",
					1 : function () {
						gotoAndPlay(3);
						return "one";
					},
					2 : "what_special"
				}
			},
			"what_special" : {
				"playSound" : OrderDeath,
				"text" : ( <![CDATA[

  IT RESPONDS DRYLY

  TODAY'S SPECIAL IS 
  DEATH. WOULD YOU LIKE 
  TO ORDER IT?

        0 YES
        1 NO

]]> ).toString(),
				"choices" : {
					0 : "yes_death",
					1 : function () { 						
						gotoAndPlay(3);
						return "one";
					}
				}
			},
			"spam" : {
				"playSound" : WantSpam,
				"text" : ( <![CDATA[

  ROBOT WAITER APPEARS

  YOU WANT SPAM?

        0 YES
        1 NO
        2 JUST SPAM?

]]> ).toString(),
				"choices" : {
					0 : "yes_spam",
					1 : function () { 						
						gotoAndPlay(3);
						return "one";
					},
					2 : "just_spam"
				}
			},
			"just_spam" : {
				"playSound" : NoDeath,
				"text" : ( <![CDATA[

  IT RESPONDS

  NO DEATH IN IT.
  ONLY SPAM.
  I PROMISE.


  PUNCH SPACE TO CONTINUE.














0
]]> ).toString(),
				"choices" : {
					0 : function () {						
						return "spam";
					}
				}
			},
			"yes_death" : {
				"text" : ( <![CDATA[
  DEATH IS DELIVERED
  ON A SILVER PLATTER.
  YOU DIE.


    QUIT/REPLAY?

  0 NO, DON'T QUIT
  1 YES, PLAY AGAIN

]]> ).toString(),
				"choices" : {
					0 : "first",
					1 : "first"
				}
			},
			"yes_spam" : {
				"text" : ( <![CDATA[
  YOU EAT SPAM. 
  YOU GO HOME TO YOUR CAT.
  YOU BECOME HAPPY.
  YOU ARE A GOOD PLAYER.

    QUIT/REPLAY?

  0 NO, DON'T QUIT
  1 YES, PLAY AGAIN

]]> ).toString(),
				"choices" : {
					0 : "first",
					1 : "first"
				}
			},
			"two" : {
				"text" : ( <![CDATA[





THIS IS A SINGLE PLAYER GAME!

  0 OOPS
  1 PLEASE FORGIVE ME
  2 SORRY, I WILL TRY AGAIN

]]> ).toString(),
				"choices" : {
					0 : "apologetic",
					1 : "very_well",
					2 : "very_well"
				}
			},
			"apologetic" : {
				"text" : ( <![CDATA[






 ARE YOU EVEN TRULY SORRY?

  0 I'LL TRY TO BE SORRIER

]]> ).toString(),
				"choices" : {
					0 : "two"	
				}
			},
			"very_well" : {
				"text" : ( <![CDATA[





 VERY WELL. 
 BUT YOUR INFRACTION
 HAS BEEN NOTED.
 
  0 CONTINUE

]]> ).toString(),
				"choices" : {
					0 : "start_game_angry"	
				}
			},
			"credits" : {
				"playSound" : Turtle,
				"eraseBackground" : true,
				"text" : ( <![CDATA[










       YOU MUST BE 





      LIKE A TURTLE





     READY TO WITHDRAW 



      INTO YOUR SHELL  




  PRESS SPACE TO CONTINUE























0
]]> ).toString(),
				"choices" : {
					0 : function () {
						gotoAndStop(1);
						return "first";
					}
				}
			},
			"first" : {
				"eraseBackground" : true,
				"pic" : Logo,
				"playSound" : LogoSound,
				"text" : ( <![CDATA[





         0 OPTIONS
         1 CREDITS
         2 QUIT

  ©CAPCON KONANI CO.,LTD 
   LICENSED BY BEMTENDO
]]> ).toString(),
				"choices" : {
					0 : function () {
						gotoAndStop(1);
						return "options";
					},
					1 : function () {
						gotoAndPlay(3);
						return "credits";
					},
					2 : "quit"
				}
			},
			"first_with_start_enabled" : {
				"playSound" : LogoSound,
				"text" : ( <![CDATA[






         0 START GAME
         1 OPTIONS
         2 QUIT
]]> ).toString(),
				"choices" : {
					0 : "start_game",
					1 : "options",
					2 : "quit"
				}
			},
			"options" : {
				"text" : ( <![CDATA[






     OPTIONS

     0 ENABLE GAME START
     1 BACK
]]> ).toString(),
				"choices" : {
					0 : "first_with_start_enabled",
					1 : "first"
				}
			},
			"quit" : {
				"text" : ( <![CDATA[






        REALLY PROCEED?

    0 NO, DON'T QUIT GAME
    1 YES, CONTINUE GAME
]]> ).toString(),
				"choices" : {
					0 : "first",
					1 : "first"
				}
			}
		};

		var selectedMenuItem = 0;
		var currentMenu = null;

		function menuItemCount() {
			var text = menuTree[currentMenu]["text"];
			for (var i = 0; i < 10; i++) {
				if (text.indexOf("" + i) == -1) {
					return i;
				}
			}			
		}

		function renderMenu() {
			var text = menuTree[currentMenu]["text"];
			for (var i = 0; i < 10; i++) {
				text = text.replace("" + i, i == selectedMenuItem ? ">" : " ");
			}
			menu.txt.text = text;
		}

		function gotoMenu(key) {
			
			if (key == "very_well") {
				menuTree["spam_con_carne2"]["text"] = menuTree["spam_con_carne2"]["text"].replace("IT EXPLODES. CAUSING A", "IT REMEMBERS").replace("HOLE IN THE WALL", "YOUR INFRACTION, THEREFORE").replace("SPACE DEVOURS YOU.", "LOSING IS WINNING.").replace("DEATH.", "YOU WIN.");
			}

			if (menuTree[key]["visited"] && key == "one") {
				if (menuTree[key]["text"].indexOf("CONTINUED") == -1) {
					menuTree[key]["text"] = menuTree[key]["text"].replace("AN ASTRONAUT BATTLES WITH", "A CONTINUED BATTLE WITH");
				} else {
					menuTree[key]["text"] = menuTree[key]["text"].replace("A CONTINUED BATTLE WITH", "  AN EPIC BATTLE WITH");
				}
			}

			currentMenu = key;
			trace("Go to " + currentMenu);
			if (menuTree[currentMenu]["eraseBackground"]) {
				trace("-- erasing");
				frontbufferBitmapData.fillRect(new Rectangle(0, 0, 256, 240), 0);
			}
			if (menuTree[currentMenu]["pic"]) {
				trace("-- drawing pic");
				frontbufferBitmapData.draw(new menuTree[currentMenu]["pic"]());
			}
			if (menuTree[currentMenu]["playSound"]) {
				new menuTree[currentMenu]["playSound"]().play();
			}
			menuTree[key]["visited"] = true;
			renderMenu();
		}

		function moveSelection(direction) {
			new (direction==1?Down:Up)().play();
			selectedMenuItem += direction;
			if (selectedMenuItem < 0) {
				selectedMenuItem = menuItemCount() - 1;
			}
			if (selectedMenuItem == menuItemCount()) {
				selectedMenuItem = 0;
			}
			renderMenu();
		}

		function makeSelection() {
			new Select().play();
			var next = menuTree[currentMenu]["choices"][selectedMenuItem];
			if (next is Function) {
				next = next();
			}
			selectedMenuItem = 0;
			gotoMenu(next);
			renderMenu();
		}

		var keys = {};
		var prevKeys = {};

		function controls() {
			if ((!prevKeys[38] && keys[38]) || (!prevKeys[87] && keys[87])) {
				moveSelection(-1);
			}
			if ((!prevKeys[40] && keys[40]) || (!prevKeys[83] && keys[83])) {
				moveSelection(+1);
			}
			if ((!prevKeys[13] && keys[13]) || (!prevKeys[32] && keys[32])) {
				makeSelection();
			}
			for (var key in keys) {
				prevKeys[key] = keys[key];
			}
		}

		public function Game() {
			gotoAndStop(1);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, function (e) {
				keys[e.keyCode] = true;
			});
			stage.addEventListener(KeyboardEvent.KEY_UP, function (e) {
				keys[e.keyCode] = false;
			});
			addEventListener(Event.ENTER_FRAME, refresh);
			frontbufferBitmapData = new BitmapData(stage.stageWidth, stage.stageHeight);
			addChild(new Bitmap(frontbufferBitmapData));
			gotoMenu("first");
		}
	}
}