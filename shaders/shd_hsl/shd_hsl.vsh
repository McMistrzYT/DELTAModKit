//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec3 _hsl;

const mat3 rgb2yiq = mat3(0.299, 0.587, 0.114, 0.595716, -0.274453, -0.321263, 0.211456, -0.522591, 0.311135);
const mat3 yiq2rgb = mat3(1.0, 0.9563, 0.6210, 1.0, -0.2721, -0.6474, 1.0, -1.1070, 1.7046);
const float PI = 3.14159265;

void main()
{
    vec4 tColor = texture2D(gm_BaseTexture, v_vTexcoord);
    vec3 yColor = (tColor.rgb * v_vColour.rgb) * rgb2yiq; 


	//change hue	
    float originalHue = atan(yColor.b, yColor.g);
    float finalHue = originalHue + _hsl.r*PI;

    float chroma = sqrt(yColor.b * yColor.b + yColor.g * yColor.g);
	
	//change saturation
	chroma = chroma+_hsl.g;
	//chroma = clamp(chroma+_hsl.g,0,1);
	
	//change luminosity
	float luma = yColor.r + _hsl.b;
	//float luma = clamp(yColor.r+_hsl.b,0,1);
	
    vec3 yFinalColor = vec3(luma, chroma * cos(finalHue), chroma * sin(finalHue));
    
    gl_FragColor = vec4(yFinalColor * yiq2rgb, tColor.a * v_vColour.a);
}
