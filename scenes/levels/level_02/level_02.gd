extends Node2D

@onready var text:Label = $Label

func _process(delta):
	if Input.is_action_just_pressed("start_game"):
		text.visible = false
