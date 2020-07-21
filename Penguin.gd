extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var fish_scene = preload("res://Fish.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
	
func throwFish_left():
	var fish = fish_scene.instance()
	$Area2D/AnimatedSprite.animation = "pingu_left"
	fish.position = Vector2(position.x - 20, position.y)
	fish.get_child(0).applied_force = Vector2(-4000, 0)
	get_parent().add_child(fish)
	pass
	
func throwFish_right():
	var fish = fish_scene.instance()
	$Area2D/AnimatedSprite.animation = "pingu_right"
	fish.position = Vector2(position.x + 20, position.y)
	fish.get_child(0).applied_force = Vector2(4000, 0)
	get_parent().add_child(fish)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
