
if con == 0 {
	if scr_trigcheck("dietrigger") {
		con = 1
		scr_tempsave();
		scr_gameover();
		exit;
	} else if scr_trigcheck("walkedaround") && !enteredarea {
		con = 2
		enteredarea = true
		global.interact = 1
		scr_speaker("no_one")
		msgset(0, "* Well, you technically didn't pass the line/")
		msgnext("* I'll just let you get away with this.../")
		d_make()
	}
}

if con == 2 && !d_ex() {
	con = 0
	global.interact = 0
}