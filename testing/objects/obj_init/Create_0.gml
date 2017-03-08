/// @description Initialize game

randomize();
show_debug_overlay(true);

draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_set_font(fnt_pix);

// INIT GLOBAL VARS
global.fullscreen=0; // fulscreen setting
global.resolution_height=min(720,display_get_height()); // resolution height in pixels (16:9 always!)
global.volume=0.8; // volume master

// CHECK FOR SAVED VARS
if(file_exists("m.ini")) {
	ini_open("m.ini");
	global.fullscreen=ini_read_real("Settings","Fullscreen",0);
	global.resolution_height=ini_read_real("Settings","Resolution",min(720,display_get_height()));
	global.volume=ini_read_real("Settings","Volume",0.8);
	ini_close();
}

// SET FULLSCREEN
if(global.fullscreen==1) {
	window_set_fullscreen(true);
} else {
	window_set_fullscreen(false);
	window_set_size(round(global.resolution_height*16/9),global.resolution_height);
}

// SET MASTER VOLUME
audio_master_gain(clamp(global.volume,0,1));

// SET ROOM RESOLUTION
for (var i=1;i<=room_last;i++) {
	if(room_exists(i)) {
		room_set_viewport(i,0,true,0,0,round(global.resolution_height*16/9),global.resolution_height); // required ?!
		room_set_view_enabled(i,true); // required ?!
	}
}
// RESIZE APP SURFACE
surface_resize(application_surface,round(global.resolution_height*16/9),global.resolution_height); // required ?!

// GOTO MENU
room_goto(room_menu);


