extends Area2D

@export var game_maneger:Node2D

@onready var timer:Timer = $Timer

@export var speed:float = 300.0
@export var start_position:Vector2 = Vector2(400,500)
@export var start_diretion:Vector2 = Vector2(0,0)
@export var new_diretiion:Vector2 = Vector2(0,0)

var is_game_start:bool = false

func _ready():
	reset() 
	random_start_diretion()


func _physics_process(delta):
	if is_game_start:
		move_ball(delta)
		limit_ball()
	else:
		is_game_start = Input.is_action_just_pressed("start_game")		
		


func reset() -> void:
	position = start_position

func random_start_diretion() -> void:
	var random_x = [-1,1].pick_random()
	
	start_diretion = Vector2(random_x,-1) 
	new_diretiion = start_diretion
	


func move_ball(delta:float) -> void:
		position += new_diretiion * speed * delta


func limit_ball() -> void:
	if position.y <= 600:
		if position.y <= 0:
			new_diretiion.y *= -1
		if position.x <= 0 or position.x >= 800:
			new_diretiion.x *= -1
	elif position.y >= 600:
		if timer.is_stopped():
			timer.start()


func game_over():
	new_diretiion = Vector2(0,0)
	reset()
	random_start_diretion()
	is_game_start = false

	

func _on_body_entered(body:Node):
	if body.is_in_group("paddle"):
		new_diretiion.y *= -1 # Replace with function body.
	elif body.is_in_group("block"):
		body.life -= 1
		body.update_color()
		new_diretiion.y *= -1
		game_maneger.update_amout_block()


func _on_timer_timeout():
	print("Game over")
	game_over()  # Replace with function body.
