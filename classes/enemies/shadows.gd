extends CharacterBody2D
const SPEED = 300.0
var char_sprite: Sprite2D
var x_dir: bool = false
var y_dir: bool = false

func _ready():
	char_sprite = find_child("Sprite2D")
	

func _physics_process(delta):
	var x_in = Input.get_axis("ui_left", "ui_right")
	var y_in = Input.get_axis("ui_up", "ui_down")
	velocity = Vector2(x_in, y_in) * SPEED
	
	#This sets the directions for calculating the correct sprite frame.
	#Doing it off of velocity made it harder to handle flipping a single axis.
	if (x_in > 0 and !x_dir) or (x_in < 0 and x_dir):
		x_dir = !x_dir
	if (y_in > 0 and !y_dir) or (y_in < 0 and y_dir):
		y_dir = !y_dir
	
	#Sprite frames are in the following format: [east, north, south, west] with a 45 degree CW rotation.
	if x_dir and y_dir:
		char_sprite.frame_coords.y = 0
	elif x_dir and !y_dir:
		char_sprite.frame_coords.y = 1
	elif !x_dir and y_dir:
		char_sprite.frame_coords.y = 2
	else:
		char_sprite.frame_coords.y = 3
	move_and_slide()
