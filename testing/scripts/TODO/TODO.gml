// TO DO : 
/*

room_menu (start | options (fs,reso,sound,about) | exit) === DONE
            ||
	room_start (allow players to select char for +-10 seconds) [players objects here and persistent! - one obj_game remembers which rooms are in play and keeps them in order, also prevents double rooms]
	    ||
      8x room_random! [ based on obj_game - also deals out new player states] ===== DONE
	    ||
	 room_end (see player score based on candy and go back to main menu in +-10 seconds)
	 
	 
1. make main menu / room_options / room_about [almost] ====== DONE
2. make room_start with player selection (check!) ===== DONE
	______ (if all works well)
3. make room_game0 ... room_game7  ===== W.I.P.
	a. add scenery ===== W.I.P.
	b. add objects that control scenery
	c. write player game state ===== DONE
	
4. make room_end with score in candy / no number or actual winner

___________________________________

GRAPHICS
1. create menu buttons ======= DONE
2. create countdown and 'finish' logos ======== placeholders
3. create backgrounds ========== DONE!
4. create room_end candy

SOUND
- click sounds for buttons (like arcade!)
- hit sounds for correct
- hit sound for fail
- nice background sounds
- bell for start and level change

CODE:
a. test menu_main ============ WORKS/DONE
b. menu_options / menu_about ======== DONE
c. left/right nav in obj_controls ====== DONE
d. different games codes (test hangen first) == 4/8
e. end room (with hangen first!) =start
f. 
...
x. add random keys (hold 3 sec) ===== scrapped


order; menu buttons, ctndown/finish, menu TEST, hangen TEST -> == HANGEN FIXED

new order: 
code menu options & about ]]] =====DONE
code all game modes (fix hangen 0 ) ===== 3/8
end screen count score.


*/
/*

10-minute-playground-break

Hinkelen (2 button timing) - DDR!; hoogste score
(schuin-achter view)

...Annemariakoekoek (2 button periodic mashing) - RUN - freeze - RUN - freeze - …; naar eind
...(schuin-achter view)

.Hoepelen (1 button adjusting) - niet te snel, niet te langzaam spammen; finish bereiken
.(schuin-achter view)

Bal-in-hoepel-werpen (1 button hold for power, release to throw)
(schuin-achter-view)

...Touwtje springen (1 button timing) - RRR touwtje springen ; hoogste score
...(front view)

...Aan rek hangen (1 button mashing) - langste volhouden
...(front view)

...Balanceren (2 button adjustments) - op balk / bal / touw balanceren
...(front view)

...Schommelen (2 buttons alternating) - op juiste moment juiste knop spammen (OF JUIST NIET SPAM, MAAR HOLD!); hoogste komen
...(side view??) - front view op verende pinguin wellicht! / hoepelen.


*/
