/// @description 0-8=KEY, 9=MOUSE, 10+=CONTROLLER

// define
new_player=-1;
current_keyset=-1;


ctrl[0,0]=vk_left;		ctrl[0,1]=vk_right;
ctrl[0,2]=vk_up;		ctrl[0,3]=vk_down;

ctrl[1,0]=ord("A");		ctrl[1,1]=ord("D");
ctrl[1,2]=ord("S");		ctrl[1,3]=ord("F");

ctrl[2,0]=ord("J");		ctrl[2,1]=ord("L");
ctrl[2,2]=ord("K");		ctrl[2,3]=ord("H");

ctrl[3,0]=ord("Z");		ctrl[3,1]=ord("X");
ctrl[3,2]=ord("C");		ctrl[3,3]=ord("V");

ctrl[4,0]=ord("N");		ctrl[4,1]=ord("M");
ctrl[4,2]=ord("B");		ctrl[4,3]=188;

ctrl[5,0]=ord("Q");		ctrl[5,1]=ord("E");
ctrl[5,2]=ord("W");		ctrl[5,3]=ord("R");

ctrl[6,0]=ord("I");		ctrl[6,1]=ord("P");
ctrl[6,2]=ord("O");		ctrl[6,3]=ord("U");

ctrl[7,0]=vk_numpad1;	ctrl[7,1]=vk_numpad3;
ctrl[7,2]=vk_numpad2;	ctrl[7,3]=vk_numpad0;

ctrl[8,0]=vk_numpad4;	ctrl[8,1]=vk_numpad6;
ctrl[8,2]=vk_numpad5;	ctrl[8,3]=vk_numpad8;

for(var i=0; i<=9; i++) {
	ctrl_lease[i]=false;
}

maxpads=gamepad_get_device_count();
for(var i=0; i<maxpads; i++) {
    if (gamepad_is_connected(i)) {
        ctrl_lease[10+i]=false;
    }
}

