extends Control

func _ready():
	pass # Replace with function body.

func _process(delta):
	pass

func _on_controls_pressed():
	var scene = load("res://scenes/control_menu.tscn")
	get_tree().change_scene_to_packed(scene)

func _on_start_button_pressed():
	var scene = load("res://Level1.tscn")

func _on_quit_pressed():
	get_tree().quit()
