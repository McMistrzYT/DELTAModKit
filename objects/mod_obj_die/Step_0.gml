
if con == 0 {
	if scr_trigcheck("dietrigger") {
		con = 1
		scr_tempsave();
		scr_gameover();
		exit;
	} else if scr_trigcheck("walkedaround") && !enteredarea {
		scr_trigkill("walkedaround")
		con = 2
		enteredarea = true
		global.interact = 1
		scr_speaker("no_one")
		msgset(0, "* Well, you technically didn't pass the line./")
		msgnext("* I'll just let you get away with this.../")
		d_make()
		exit;
	}
	
	if scr_interacttrigcheck("deathlinetrigger", true) {
		con = 2
		global.interact = 1
		scr_speaker("no_one")
		msgset(0, "* A Lone line./")
		msgnext("* (You feel as if touching it is a bad idea.)/%")
		d_make()
		exit;
	}
}

if con == 2 && !d_ex() {
	con = 0
	global.interact = 0
}