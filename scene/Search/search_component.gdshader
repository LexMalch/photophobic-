shader_type canvas_item;

uniform float blur_strength : hint_range(0, 10) = 3.0;

void fragment() {
    vec4 blur = vec4(0.0);
    float samples = 0.0;
    
    // Проход размытия (горизонтальный + вертикальный)
    for (float x = -5.0; x <= 5.0; x += 1.0) {
        blur += texture(TEXTURE, UV + vec2(x, 0.0) * 0.01 * blur_strength);
        samples += 1.0;
    }
    for (float y = -5.0; y <= 5.0; y += 1.0) {
        blur += texture(TEXTURE, UV + vec2(0.0, y) * 0.01 * blur_strength);
        samples += 1.0;
    }
    
    COLOR = blur / samples;
}