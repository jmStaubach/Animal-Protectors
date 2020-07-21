extends Node2D


signal updateFish
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var penguin_scene = preload("res://Penguin.tscn")
var fish_scene = preload("res://Fish.tscn")
var boat_scene = preload("res://Boat.tscn")
var penguin = penguin_scene.instance()
var start_postion = Vector2(420,397) 
var start_postion_fish = Vector2(400,397) 

# Called when the node enters the scene tree for the first time.
func _ready():
	penguin.position = start_postion
	add_child(penguin)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_left"):
		if $FishCount.value > 0:
			penguin.throwFish_left()		
			emit_signal("updateFish")
	if Input.is_action_just_pressed("ui_right"):
		if $FishCount.value > 0:
			penguin.throwFish_right()		
			emit_signal("updateFish")
	
	pass


func _on_BoatTimer_timeout():
	var boat = boat_scene.instance()
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var my_random_number = rng.randi_range(1, 2)
	
	print(my_random_number)
	if my_random_number == 1:
		boat.position.x = 800;
		boat.setLeftDirection()
	else:
		boat.setRightDirection()
	boat.position.y = 500

	
	add_child(boat)
	pass # Replace with function body.


func _on_Area2D_body_entered(body):
	print("Hallo!!")
	pass # Replace with function body.


func _on_AnimatedSprite_game_over():
	print("game Over")
	$Game_Over_Label.visible = true
	get_tree().paused = true
	pass # Replace with function body.


func _on_Button_pressed():
	get_tree().reload_current_scene()
	pass # Replace with function body.


func _on_water_body_body_entered(body):
	print(body)
	remove_child(body.get_parent())
	pass # Replace with function body.


func _on_IncreaseDifficulty_timeout():
	if($BoatTimer.wait_time > 3):
		$BoatTimer.wait_time -= 1;
	pass # Replace with function body.
