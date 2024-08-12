extends Node2D

@onready var pointLight:PointLight2D = $PointLight2D

func _on_link_button_mouse_entered():
	pointLight.enabled = true


func _on_link_button_mouse_exited():
	pointLight.enabled = false 
