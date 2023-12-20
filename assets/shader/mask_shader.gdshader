shader_type canvas_item;
void fragment(){
	COLOR = texture(SCREEN_TEXTURE,SCREEN_UV);
	vec4 color = texture(TEXTURE,UV);
	COLOR *= color;
	
	// makes line fully opaque
//	COLOR.rgb /= color.a;
	
	// alpha line
	COLOR *= 5.0;
	COLOR += color * color.a * 0.5;

	// make everything opaque so that the darkness covers non-light stuff 
	COLOR.a = 1.0;
}