extends Area2D


@export var speed:float = 300.0
@onready var direction:Vector2 = Vector2([-1,1].pick_random(),[-1,1].pick_random())
@onready var top:RayCast2D = $top
@onready var below:RayCast2D = $below
@onready var left:RayCast2D = $left
@onready var right:RayCast2D = $right

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += direction * speed * delta
	if position.x >= 800 or position.x <= 0:
		direction.x *= -1	
	if position.y >= 600 or position.y <= 0:
		direction.y *= -1


func _on_body_entered(body):
	if top.is_colliding() or below.is_colliding():
		direction.y *= -1 # Replace with function body.
	elif right.is_colliding() or left.is_colliding():
		direction.x *= -1
