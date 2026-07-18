var leaf_xpos = x + 40 + random(12)
var leaf = scr_marker(leaf_xpos, y, spr_lw_tree_leaf_01)
leaf.depth = depth - 10
leaf.image_speed = 0.5
scr_lerpvar_instance(leaf, "x", leaf_xpos + 30 + random(10), leaf_xpos + 35 + random(10), 40, -1, "out")
scr_lerpvar_instance(leaf, "y", y + 30, y + 60, 40, 1, "out")
scr_lerpvar_instance(leaf, "image_alpha", 0, 1, 5, 1, "out")
scr_script_delayed(scr_lerpvar_instance, 20, leaf, "image_alpha", 1, 0, 15, 1, "out")
scr_doom(leaf, 50)
leaf_counter++

if (leaf_counter < 3)
	alarm[3] = 8
