extends StaticBody2D


# Declare member variables here. Examples:
var level = 0
var baseXP = 0
var reqXP = 0

func get_tree():
	return self.get_node("tree")
# Called when the node enters the scene tree for the first time.

func update_req():
	reqXP = (level + 1) * 5

func _ready():
	update_req()
	var tree = self.get_tree()
	tree.visible = false
	pass # Replace with function body.

func update_texture():
	var tree = self.get_tree()
	if not tree.visible:
		tree.visible = true
	tree.frame = level

func update_base(water):
	baseXP += water
	if baseXP >= reqXP:
		level += 1
		baseXP -= reqXP
		update_texture()
	update_req()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	update_texture()
