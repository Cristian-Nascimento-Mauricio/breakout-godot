extends Node2D

@export var blocks:Node2D
@export var next_level:String 
var amount_blocks:int = 0


func _ready():
	search_blocks() 


func _process(delta):
	pass


func search_blocks():
	for block in blocks.get_children():
		amount_blocks += block.life
		print(amount_blocks)

func update_amout_block():
	amount_blocks -= 1
	if amount_blocks <= 0:
		get_tree().change_scene_to_file(next_level)
