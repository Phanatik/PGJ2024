extends CharacterBody2D

func get_jug():
	return self.get_node("jug")
	
@export var run_speed = 300
@export var jump_speed = -600
@export var gravity = 1200

#var velocity = Vector2()
var jumping = false
var can_interact_with_tree = false
var can_interact_with_stone = false
var tree = null
var stone = null

func get_input():
	velocity.x = 0
	var right = Input.is_action_pressed('move_right')
	var left = Input.is_action_pressed('move_left')
	var up = Input.is_action_pressed('move_up')
	var down = Input.is_action_pressed('move_down')
	var jump = Input.is_action_just_pressed('ui_select')

	#if jump and is_on_floor():
		#jumping = true
		#velocity.y = jump_speed
	if right:
		$Sprite2D.flip_h = false
		velocity.x += run_speed
	if left:
		$Sprite2D.flip_h = true
		velocity.x -= run_speed
	if up:
		velocity.y += run_speed
	if down:
		velocity.y -= run_speed

func _physics_process(delta):
	get_input()
	velocity.y += gravity * delta
	if jumping and is_on_floor():
		jumping = false
	set_velocity(velocity)
	set_up_direction(Vector2(0, -1))
	move_and_slide()
	velocity = velocity

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var label = get_node("Label")
	var interact = Input.is_action_just_pressed('interact')
	if interact:
		var jug = get_jug()
		if can_interact_with_tree:
			if jug.jug_level <= 0:
				label.text = "Thirsty"
			else:
				tree.update_base(jug.jug_level)
				jug.jug_level = 0
		if can_interact_with_stone:
			if stone.water_volume <= 0:
				label.text = "Thirsty"
			else:
				jug.jug_level += stone.update_volume(jug)

func _on_Area2D_body_entered(body):
	if body.name == "TreePot":
		can_interact_with_tree = true
		tree = body
	elif "stone" in body.name:
		can_interact_with_stone = true
		stone = body
	pass # Replace with function body.

func _on_Area2D_body_exited(body):
	if body.name == "TreePot":
		can_interact_with_tree = false
	elif "stone" in body.name:
		can_interact_with_stone = false
	var label = get_node("Label")
	label.text = ""
	pass # Replace with function body.
