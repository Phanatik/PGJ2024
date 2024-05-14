extends StaticBody2D


# Declare member variables here. Examples:
var water_volume = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func update_volume(jug):
	#how much space is left in the jug
	var remain = jug.jug_volume - jug.jug_level
	#is there more space in the jug than there is water to fill it?
	var change = min(remain, water_volume - remain)
	water_volume -= remain
	return change

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if water_volume <= 0:
		self.get_node("Area2D/Sprite/pool").visible = false
	pass
