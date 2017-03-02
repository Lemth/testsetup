/// @desc player STEP
if(keyset>-1) {
	script_execute(ctrl_script); // get input
} else {
	script_execute(asset_get_index("ai_"+asset_get_index(room)));		
}

