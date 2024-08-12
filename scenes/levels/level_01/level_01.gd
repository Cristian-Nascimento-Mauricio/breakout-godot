extends Node2D

@onready var text:Label = $Label
@onready var gameManeger:Node2D = $GameManeger

func _process(delta):
	if Input.is_action_just_pressed("start_game"):
		text.visible = false
