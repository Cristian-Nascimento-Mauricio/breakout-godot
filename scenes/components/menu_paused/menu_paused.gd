extends Control

@export var level:Node2D

func _ready():
	hide() 


func _process(delta):
	if Input.is_action_just_pressed("paused"):
		if level.get_tree().paused:
			hide()
			level.get_tree().paused = false
			return
			
		show()
		level.get_tree().paused = true


func _on_continue_pressed():
	hide()
	level.get_tree().paused = false


func _on_menu_main_pressed():
	level.get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/main_menu/main_menu.tscn") 


func _on_exited_pressed():
	get_tree().quit()
