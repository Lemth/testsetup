/// @description Insert description here
// You can write your code in this editor

google_analytics_screenview("Game_end");
google_analytics_time_end("Playtime", "Total_Playtime");
google_analytics_event("Playtime", "Reached_End");

maxscore=0;

alarm[0]=6*room_speed;
with(obj_player) {
	y=room_height/2;
	image_index=0;
	counti=0;
	player_score=player_werpen_score+player_hinkel_score+player_koekoek_score+player_hoepel_score+
			player_balans_score+player_hangen_score+player_springen_score+player_wippen_score;
	other.maxscore=max(other.maxscore,player_score);
	google_analytics_event("Playstats", "Score",string(player_score),string(id));
}

count=0;

with(obj_controls) {
	for(i=0;i<10;i++) {
		google_analytics_event("Playstats", "Controls", string(ctrl_lease[i]), string(i)]);
		if(ctrl_lease[i]==true) {
			other.count+=1;	
		}
	}
}

google_analytics_event("Playstats", "Players", string(count), "PlayerCount");
