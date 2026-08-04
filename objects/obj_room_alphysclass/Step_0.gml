if (con == 10 && !d_ex()) {
	con = 12
	global.interact = 1
	global.msc = -99
	global.choice = -1
	global.choicemsg[0] = stringsetloc("#Yes", "obj_room_alphysclass_slash_Step_0_gml_12_0")
	global.choicemsg[1] = stringsetloc("#No", "obj_room_alphysclass_slash_Step_0_gml_13_0")
	global.choicemsg[2] = ("")
	global.choicemsg[3] = ("")
	scr_speaker("no_name")
	msgset(0, "* (Alphys' computer^1. Look at the wallpaper?)/", "obj_room_alphysclass_slash_Step_0_gml_18_0")
	msgnext("\\C2")
	d_make()
}

if (con == 12 && global.choice != -1) {
	con = 100
	k_d(3)
	
	if (global.choice == 0)
	{
		scr_speaker("no_name")
		msgset(0, "* (Originally^1, the wallpaper was two buff superheroes hugging.)/", "obj_room_alphysclass_slash_Step_0_gml_33_0")
		msgnext("* (Then^1, probably due to your mom's influence...)/", "obj_room_alphysclass_slash_Step_0_gml_34_0")
		msgnext("* (It was edited to them being 4 inches apart due to school dance rules.)/", "obj_room_alphysclass_slash_Step_0_gml_35_0")
		msgnext("* (..^1. now^1, the superheroes are back together again.)/", "obj_room_alphysclass_slash_Step_0_gml_36_0")
		msgnext("* (Perhaps because it's the weekend.)/%", "obj_room_alphysclass_slash_Step_0_gml_37_0")
	}
	else if (global.choice == 1)
	{
		scr_speaker("no_name")
		msgset(0, "* (You decided not to look^1, after looking at it the whole time^1, you were deciding.)/%", "obj_room_alphysclass_slash_Step_0_gml_41_0")
	}
	
	d_make()
}

if (con == 14 && !d_ex())
{
	con = 100
	global.interact = 1
	scr_speaker("no_name")
	msgset(0, "* (It's Alphys' computer wallpaper.)/", "obj_room_alphysclass_slash_Step_0_gml_55_0")
	msgnext("* (Yes^1, you looked at it when standing on the other side of the desk.)/", "obj_room_alphysclass_slash_Step_0_gml_56_0")
	msgnext("* (You had to crane your head around.)/", "obj_room_alphysclass_slash_Step_0_gml_57_0")
	
	if (!scr_havechar(DRCharacter.Susie)) {
		msgnext("* (It was at a really harsh angle and you couldn't really see it.)/%", "obj_room_alphysclass_slash_Step_0_gml_61_0")
	}
	else
	{
		scr_anyface_next("susie", 9)
		msgnext("\\E9* Heh^1, you look stupid./%", "obj_room_alphysclass_slash_Step_0_gml_65_0")
	}
	
	d_make()
}

if (con == 30 && !d_ex()){
	con = 100
	global.interact = 1
	scr_speaker("no_name")
	msgset(0, "* (There's a drawing by Temmie of her with an additional set of ears.)/")
	msgnext("* (Seems to be motivating you to play a certain MMORPG...)/")
	msgnext("* (..^1. you decided to pass.)/%")
	d_make()
}

if (con == 32 && !d_ex())
{
	con = 100
	global.interact = 1
	scr_speaker("no_name")
	msgset(0, "* (The Internet is having an outage anyway.)/%", "obj_room_alphysclass_slash_Step_0_gml_92_0")
	d_make()
}

if (con == 40 && !d_ex())
{
	con = 100
	global.interact = 1
	scr_speaker("no_name")
	msgset(0, "* (It's a bunch of roses.)/%", "obj_readable_room1_slash_Other_10_gml_453_0")
	d_make()
}

if (con == 50 && !d_ex())
{
	con = 100
	global.interact = 1
	scr_speaker("no_name")
	msgset(0, "* (You checked the time.)/", "obj_readable_room1_slash_Other_10_gml_414_0")
	msgnext("* (... it seems to not be time for class.)/%", "obj_readable_room1_slash_Other_10_gml_415_0")
	d_make()
}

if (con == 100 && !d_ex())
{
	con = -1
	global.interact = 0
}
