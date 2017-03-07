// TO DO : 
/*

room_menu (start | options (fs,reso,sound,about) | exit)
            ||
	room_start (allow players to select char for +-10 seconds) [players objects here and persistent! - one obj_game remembers which rooms are in play and keeps them in order, also prevents double rooms]
	    ||
      8x room_random! [ based on obj_game - also deals out new player states]
	    ||
	 room_end (see player score based on candy and go back to main menu in +-10 seconds)
	 
	 
1. make main menu / room_options / room_about [almost]
2. make room_start with player selection (check!)
	______ (if all works well)
3. make room_game0 ... room_game7 
	a. add scenery
	b. add objects that control scenery
	c. write player game state
	
4. make room_end with score in candy / no number or actual winner

___________________________________

GRAPHICS
1. create menu buttons
2. create countdown and 'finish' logos
3. create backgrounds
4. create room_end candy

SOUND
- click sounds for buttons (like arcade!)
- hit sounds for correct
- hit sound for fail
- nice background sounds
- bell for start and level change

CODE:
a. test menu_main
b. menu_options / menu_about
c. left/right nav in obj_controls
d. different games codes (test hangen first)
e. end room (with hangen first!)
f. 
...
x. add random keys (hold 3 sec)


*/
