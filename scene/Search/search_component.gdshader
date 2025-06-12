shader_type canvas_item;

// Добавляем правильную текстуру
uniform sampler2D screen_texture : hint_screen_texture;

uniform float blur_strength : hint_range(0, 10) = 3.0;

void fragment() {
    vec4 blur = vec4(0.0);
    float samples_count = 0.0;

    // Используем SCREEN_UV вместо UV для работы с экраном
    vec2 base_uv = SCREEN_UV;

    // Горизонтальный проход
    for (float x = -5.0; x <= 5.0; x += 1.0) {
        blur += texture(screen_texture, base_uv + vec2(x, 0.0) * 0.01 * blur_strength);
        samples_count += 1.0;
    }

    // Вертикальный проход
    for (float y = -5.0; y <= 5.0; y += 1.0) {
        blur += texture(screen_texture, base_uv + vec2(0.0, y) * 0.01 * blur_strength);
        samples_count += 1.0;
    }

    COLOR = blur / samples_count;
}