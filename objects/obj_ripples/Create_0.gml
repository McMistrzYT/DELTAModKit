u_center = shader_get_uniform(shd_ripple, "rippleCenter")
u_rad = shader_get_uniform(shd_ripple, "rippleRad")
u_banding = shader_get_uniform(shd_ripple, "rippleBanding")
u_fading = shader_get_uniform(shd_ripple, "rippleFading")
ripples = []

MakeRipple = function(x, y, radiusmax, radius, thickness, color, hspeed, vspeed, friction, life, curveid, yratio, blend, banding, fading){
	var _ripple = {
		x: x,
		y: y,
		rad: radius,
		radstart: radius,
		life: life,
		lifemax: life,
		radmax: radiusmax,
		col: color,
		hsp: hspeed,
		vsp: vspeed,
		fric: friction,
		thickness: thickness,
		curve: curveid,
		yratio: yratio,
		blend: blend,
		banding: banding,
		fading: fading
	}
	array_push(ripples, _ripple)
	return _ripple;
}

surf_ripples = noone
curves = [
    animcurve_get_channel(ac_ripples, "norm"), 
    animcurve_get_channel(ac_ripples, "slow"), 
    //animcurve_get_channel(ac_floweryac, "x"), 
    //animcurve_get_channel(ac_floweryac, "y"), 
    //animcurve_get_channel(ac_scurves, "lancer_spinspeed"), 
    //animcurve_get_channel(ac_scurves, "fusuma"), 
    //animcurve_get_channel(ac_scurves, "fusuma_close"), 
    animcurve_get_channel(ac_ripples, "inverse"), 
	animcurve_get_channel(ac_ripples, "in")
]
blend = c_black
