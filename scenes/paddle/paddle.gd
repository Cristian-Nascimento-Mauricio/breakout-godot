extends StaticBody2D

@export var speed:float = 700.0
var min_x:float = 45.0
var max_x:float = 755.0


func _ready():
	pass 

func _process(delta):
	move_paddle(delta)
	limit_move()
 

func move_paddle(delta:float) -> void:
	if Input.is_action_pressed("mv_left"):
		position.x -= speed * delta
	elif Input.is_action_pressed("mv_right"):
		position.x += speed	 * delta


func limit_move() -> void:
	position.x = clamp(position.x,min_x,max_x)
	
