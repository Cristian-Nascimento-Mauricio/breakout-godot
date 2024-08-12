extends StaticBody2D

@export var life:int = 3

@export var green:Color = "00ff00"
@export var yellow:Color = "efc300"
@export var red:Color = "ff0000"


func _ready():
	update_color()


func update_color() -> void:
	if life == 3:
		modulate = green
	elif life == 2:
		modulate = yellow
	elif life == 1:
		modulate = red		
	elif life <= 0:
		queue_free()
	
