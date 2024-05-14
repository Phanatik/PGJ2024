extends Sprite2D


# Declare member variables here. Examples:
var jug_level = 0.0
var jug_volume = 10.0
var prox_level = 0.0

func _ready():
	self.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if jug_level > 0:
		if not self.visible:
			self.visible = true
		prox_level = ceil((4*jug_level)/jug_volume)
		var load_text = "res://assets/player/jug" + str(prox_level) + ".png"
		self.set_texture(load(load_text))
	else:
		self.visible = false
#	pass
