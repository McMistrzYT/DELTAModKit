if (is_closed)
{
	draw_self()
}
else
{
	gpu_set_blendenable(false)
	gpu_set_colorwriteenable(false, false, false, true)
	draw_sprite(spr_lw_trees_fence_mask, 0, 242, 30)
	gpu_set_blendenable(true)
	gpu_set_colorwriteenable(true, true, true, true)
	gpu_set_blendmode_ext(bm_dest_alpha, bm_inv_dest_alpha)
	gpu_set_alphatestenable(true)
	draw_sprite(fence_right_sprite, 0, fence_right_xpos, fence_right_ypos)
	gpu_set_alphatestenable(false)
	gpu_set_blendmode(bm_normal)
}
