#region SAVE
	function scr_save_point_text(){
		switch (room) {
			case room_dw_test:
				nodialogue = false;
			
				scr_speaker("no_name");
				msgset(0, "* You are filled with the power of DELTAModKit./%");
				break;
		
			case room_town_mid: nodialogue = true break;
		
			default:
				nodialogue = false;
			
				scr_speaker("no_name");
				msgset(0, "* This is a save point./");
				msgnext("* You can configure this dialogue in scr_ui_config->scr_save_point_text./%");
				break;
		}
	}
#endregion
#region DARKCONTROLLER
	// For things like Character Icons use scr_heroes_config
	variable_global_set("@@DarkItemMenuData@@", [])
	
	function scr_darkitemmenu_init(){
		variable_global_set("@@DarkItemMenuData@@", [])
		
		scr_createitemmenu("USE", "item", true)
		scr_createitemmenu("TOSS", "item", true)
		scr_createitemmenu("KEY", "keyitem", true).grayunusableitems = 1
	}
	
	// RAW FUNCTIONS
	// _additemmenu(name <string>, variablename <string>, global <bool>, press <method>, init <method>, getiteminfo <method>, getmenuname <method>, submenu5 <method>)
	function scr_createitemmenu(menuname = "ERR", variablename = "item", isglobal = true, pressmethod = function() { // When Pressing Z on a item
    if name == "TOSS" {
        snd_play(snd_ultraswing);
        parent.onebuffer = 2;
        global.faceaction[0] = 0;
        global.faceaction[1] = 0;
        global.faceaction[2] = 0;
        throwitem = getvariable(slot);
        
        shifttype(slot, 0);
        with parent scr_itemdesc(other.getarray(), other.offset)
        
        global.charselect = -1;
        
        with parent scr_item_throw_special(other.throwitem)
    } else {
        itemuseid = getvariable(slot)
        var nextcharselect = global.charselect
        var gettrophy = 1
        var playfailedsound = 0
        var falsecharselect = NaN
        
        if variable == "keyitem" {
            falsecharselect = 3
            itemuseid += offset
            gettrophy = 0
            playfailedsound = 1
        }
        
        __selectediteminfo = iteminfo(itemuseid)
        var structnames = variable_struct_get_names(__selectediteminfo)
        for (var i = 0; i < array_length(structnames); i++) { variable_struct_set(parent, structnames[i], variable_struct_get(__selectediteminfo, structnames[i])) }
        
        if __selectediteminfo.itemtarget > 0 { parent.selectnoise = 1 }
        
        allowforceclose = 1
        
        switch __selectediteminfo.itemtarget {
            case 0:
            
            break
            case 1:
                if (__selectediteminfo.usable == 1) {
                    global.submenu = 5
                } else if playfailedsound snd_play(snd_cantselect)
            break
            case 2:
                parent.onebuffer = 2;
                global.faceaction[0] = 0;
                global.faceaction[1] = 0;
                global.faceaction[2] = 0;
                
                if (__selectediteminfo.usable == 1) {
                    if falsecharselect != NaN global.charselect = falsecharselect
                    with parent scr_itemuse(other.itemuseid);
                    
                    nextcharselect = -1
                    if __selectediteminfo.consumable == 1 {
                        //if gettrophy with (obj_event_manager) trigger_event($0, $9); // Playstation Trophy Manager.
                        if (__selectediteminfo.replaceable > 0)
                            setvariable(slot, __selectediteminfo.replaceable)
                        else 
                            shifttype(slot, 0)
                        
                        if getvariable(0) == 0 parent.forcecloseitemmenu = 1
                    }
                                    
                    with parent scr_itemdesc(other.getarray(), other.offset)
                } else if playfailedsound snd_play(snd_cantselect)
            
            break
        }
        
        if allowforceclose && getvariable(0) == 0 parent.forcecloseitemmenu = 1
        
        global.charselect = nextcharselect
    }
}, initmethod = function() { // Initilization, runs upon Clicking on the Menu
    updateitems()
    offset = 0
    shifttype = scr_itemshift
    if variable == "keyitem" {
        parent.deschaver = 1;
        grayunusableitems = 1
        offset = KEYITEMDATASTART
        shifttype = scr_keyitemshift
        //if (scr_keyitemcheck(8 /* LANCER */) && !instance_exists(obj_lancergotchi)) instance_create(parent.x, parent.y, obj_lancergotchi);
    } else {
        parent.deschaver = 1;
        
        if (getvariable(0) == 0) { // Kick out of Menu instantly if empty
            global.submenu = 1;
            parent.deschaver = 0;
        } else {
            parent.selectnoise = 1;
        }
    }
    with parent scr_itemdesc(other.getarray(), other.offset)
}, getiteminfo = function(item) { // Item Info, override this if you're not using scr_iteminfo, also make sure this returns a data struct, it is also how itthe renderer gets the item names.
    var data = {}
    if variable == "keyitem" && item < KEYITEMDATASTART { item += KEYITEMDATASTART }
    
    data.menuparent = self
    with data { scr_iteminfo(item) }
    
    return data
}, getname = function() { // For Localization to work, If you don't need the name to change depending on things, don't add this argument.
	/*
    if global.lang == "ja" {
        switch name {
            default: break
            case "USE":
                return scr_84_get_lang_string("obj_darkcontroller_slash_Draw_0_gml_807_0") // USE
            break
            case "TOSS":
                return scr_84_get_lang_string("obj_darkcontroller_slash_Draw_0_gml_809_0") // TOSS
            break
            case "KEY":
                return scr_84_get_lang_string("obj_darkcontroller_slash_Draw_0_gml_811_0") // KEY
            break
        }
    }
	*/
    return name
}, itemsubmenu5code = function() { // Sub Menu 5 is the Menu you go to for selecting who you want the item to be used on, the base functionality cannot be changed through this, only the thing related to items, as the base functionality is also used for the unused overworld spell healing
        with parent scr_itemuse(other.itemuseid);
        
        if __selectediteminfo.consumable == 1 {
            //with (obj_event_manager) trigger_event($0, $9); // Playstation Trophy Manager.
            if (__selectediteminfo.replaceable > 0)
                setvariable(slot, __selectediteminfo.replaceable)
            else
                shifttype(slot, 0)
            
            if getvariable(0) == 0 parent.forcecloseitemmenu = 1
        }
        
        with parent scr_itemdesc(other.getarray(), other.offset)
        global.submenu = 2;
        global.faceaction[global.charselect] = 0;
        global.charselect = -1;
    }) {
	var data = {}
    data.isglobal = isglobal
    data.variable = variablename
    data.name = menuname
    data.slot = 0
    data.button1 = method(data, pressmethod)
    data.init = method(data, initmethod)
    data.parent = obj_darkcontroller
    data.iteminfo = method(data, getiteminfo)
    data.getname = method(data, getname)
    data.submenu5 = method(data, itemsubmenu5code)
    
    data.getvariable = method(data, function(slot) {
        var vari = getarray()
        if slot < 0 || slot >= array_length(vari) return 0
        if vari[slot] == 999 return 0 // 999 is for some reason a Placeholder Value Toby Uses, like when Games use $FF as the ending for a List, but toby just never checks for this??
        return vari[slot]
    })
    
    data.getarray = method(data, function() {
        return variable_struct_get(self.isglobal ? global : parent, variable)
    })
    
    data.setvariable = method(data, function(slot, value) {
        var struct = self.isglobal ? global : parent
        var vari = variable_struct_get(struct, variable)
        if slot < 0 || slot >= array_length(vari) return 0
        vari[slot] = value
        variable_struct_set(struct, variable, vari)
    })
    data.updateitems = method(data, function() {
        itemnames = array_create(13, " ")
        itemsusable = array_create(13, 0)
        
        for (var i = 0; getvariable(i) != 0; i++) {
            var _iteminfo = iteminfo(getvariable(i))
            itemnames[i] = _iteminfo.itemnameb
            itemsusable[i] = _iteminfo.usable
        }
    })
    data.updateitems()
    data.grayunusableitems = 0
    var _itemmenuslist = variable_global_get("@@DarkItemMenuData@@") ?? []
    array_push(_itemmenuslist, data)
    variable_global_set("@@DarkItemMenuData@@", _itemmenuslist)
	return data
}
	
#endregion
#region TENSIONBAR

enum DRTensionColor {
	Orange = 0,
	Blue,
}

// Chapter 1 Accurate Settings: {EnableTensionbarAlphaFix 1, EnableTensionbarSlicedCorners 0}
// Chapter 2+Accurate Settings: {EnableTensionbarAlphaFix 0, EnableTensionbarSlicedCorners 1}
#macro EnableTensionbarAlphaFix 0
#macro EnableTensionbarSlicedCorners 1
function scr_tensionbar_colors_init(){
	global.barcolors = []
	global.defaultbarcolor = DRTensionColor.Orange

	scr_tensionbar_createcolor(c_red, c_orange, c_yellow, c_maroon, c_white, "TensionLight", DRTensionColor.Orange)
	scr_tensionbar_createcolor(c_blue, merge_color(c_blue, c_teal, 0.5), c_teal, c_navy, c_white, "TensionDark", DRTensionColor.Blue)
}

// TENSIONBAR_COLORS_BASEFUNCTIONS
/// @desc Creates a Tension Bar Color.
/// @arg UsedTP The Color Used when Using Tension
/// @arg CurrentTP The Color Used for the Current Amount of Tension
/// @arg MaxTP The Color Used when At MAXTension
/// @arg Backing The Color for the Background of the TensionBar
/// @arg Glow The Usually White Line seen on the Bar
/// @arg Name The Name of the TensionBar Color (Shows up in Debug Logs)
/// @arg ID The ID the Bar is assigned To 
function scr_tensionbar_createcolor(usedtp = c_red, currenttp = c_orange, maxtp = c_yellow, backing = merge_color(c_red, c_black, 0.5), glow = c_white, name = "UNDEFINED", colorid = array_length(global.barcolors)) {	var color = {}
	color.usedtp = usedtp
	color.currenttp = currenttp
	color.maxtp = maxtp
	color.backing = backing
	color.glow = glow
	color.name = name
	color.id = colorid
	global.barcolors[colorid] = color
	return color
}
#endregion
