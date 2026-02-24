

varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform sampler2D DissolveTex;
uniform float Dissolve;
uniform float Edge;
uniform vec2 DissolveUV;
uniform vec2 DefaultUV;
uniform vec3 C1;
uniform vec3 C2;
void main()
{
    vec2 ConvertedUV = v_vTexcoord - DefaultUV;
    vec4 DissolveCol = texture2D( DissolveTex, DissolveUV + ConvertedUV);

    float Dissolve = (Dissolve * (1.0 + Edge));
    Dissolve = (Dissolve - 1.0);
    
    vec4 pixcolor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
    gl_FragColor = pixcolor;
    gl_FragColor.a = min(DissolveCol.r + Dissolve, gl_FragColor.a);

    if (gl_FragColor.a <= Edge) 
    {
      gl_FragColor.rgb = mix(C1,C2,gl_FragColor.a/Edge);
    }
    gl_FragColor.a = min(ceil(gl_FragColor.a),pixcolor.a);
}

