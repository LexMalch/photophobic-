extends SubViewport
func _ready():
	var viewport_texture = $SubViewport.get_texture()
	$ColorRect.material.set_shader_param("blur_texture", viewport_texture)
