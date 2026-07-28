#ifdef GL_NV_desktop_lowp_mediump
	precision highp float; 
	precision highp int;
#endif
varying vec4 v_vColour;
uniform vec2 rippleCenter;
uniform vec4 rippleRad; //current/max/thickness/yratio
uniform int rippleBanding; 
uniform bool rippleFading; 

void main()
{
	vec2 _adjustedXY = gl_FragCoord.xy;
	_adjustedXY.y = mix(rippleCenter.y, _adjustedXY.y, rippleRad.a);
	float _dist = distance(_adjustedXY.xy, rippleCenter.xy);
	float _edge = max(0.0, _dist - (rippleRad.x-rippleRad.z));
	float _perc = _dist / rippleRad.x;
	float _alph = 1.0;
	float _rimthickness = rippleRad.z / 3.0;
	float _fadestart = rippleRad.y / 3.0;
	//if (_perc > 0.85) _alph = 0.85;
	//if (_perc > 0.90) _alph = 0.9;
	//if (_perc > 0.95) _alph = 1.0;
	if (rippleBanding == 1) _alph = _perc;
	if (rippleBanding == 0)
	{
		if (_edge > 0.0) _alph = 0.6;
		if (_edge > _rimthickness) _alph = 0.8;
		if (_edge > _rimthickness * 2.0) _alph = 1.0;
	}
	if (rippleBanding == 2)
	{
		if (_edge > rippleRad.z) _alph = 0.0;
	}
	_edge = min(_edge, 1.0);
	if (_perc > 1.0) _alph = 0.0;
    gl_FragColor = v_vColour; //* texture2D( gm_BaseTexture, v_vTexcoord );
	gl_FragColor.a = _edge * _alph;
	if (rippleFading) gl_FragColor.a = gl_FragColor.a * min(1.0,(1.0 - ((rippleRad.x-_fadestart)/(rippleRad.y-_fadestart))));
}
