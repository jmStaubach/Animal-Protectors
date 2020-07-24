extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var fish_scene = preload("res://Fish.tscn")

var isThrowing = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
	
	
func look_left():
		if isThrowing:
			$Area2D/AnimatedSprite.animation = "pingu_throw_left"					
		else:
			$Area2D/AnimatedSprite.animation = "pingu_left"
		pass
func look_right():
	
		if isThrowing:
			$Area2D/AnimatedSprite.animation = "pingu_throw_right"		
		else:
			$Area2D/AnimatedSprite.animation = "pingu_right"	
		pass
		
func start_throw():
		isThrowing = true
		if $Area2D/AnimatedSprite.animation == "pingu_right":
			$Area2D/AnimatedSprite.animation = "pingu_throw_right"
		else:
			$Area2D/AnimatedSprite.animation = "pingu_throw_left"						
		pass
		
func throwFish(multiplier): 
	var fish = fish_scene.instance()
	var direction = 1
	print(multiplier)
	isThrowing = false
	if($Area2D/AnimatedSprite.animation == "pingu_throw_left"):
		look_left()
		direction = -1;
	else:
		fish.invert()
		look_right()
	fish.position = Vector2(position.x + 20 * direction, position.y)
	fish.get_child(0).apply_impulse(Vector2(0,0),Vector2(direction * 50 + 8 * direction * multiplier, -120))
	get_parent().add_child(fish)

	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
