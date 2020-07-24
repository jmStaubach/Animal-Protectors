extends Node2D


signal updateFish
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var penguin_scene = preload("res://Penguin.tscn")
var fish_scene = preload("res://Fish.tscn")
var boat_scene = preload("res://Boat.tscn")
var albatross_scene = preload("res://Albatross.tscn")
var rene_scene = preload("res://Rene.tscn")
var penguin = penguin_scene.instance()
var start_postion = Vector2(390,365) 
var start_postion_fish = Vector2(400,397) 
var boat_speed = Vector2(40,0)
var max_speed = 180

var rene = rene_scene.instance()
# Called when the node enters the scene tree for the first time.
func _ready():
	penguin.position = start_postion
	add_child(penguin)
	rene.visible = false
	add_child(rene)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):

	if Input.is_action_just_pressed("ui_select") :
		if $FishCount.value > 0:
			$ThrowTimer.start()	
			$ProgressBar.visible = true
			penguin.start_throw()
	if  Input.is_action_just_released("ui_select") && $ProgressBar.visible:
		$ThrowTimer.stop()
		$ProgressBar.visible = false
		if $FishCount.value > 0:
			#throw fish
			penguin.throwFish($ProgressBar.value)
			emit_signal("updateFish")
		$ProgressBar.value = 0;

	if Input.is_action_just_pressed("ui_up") && $HelpBar.value == 100:
		var albatross = albatross_scene.instance()
		add_child(albatross)
		$HelpBar.value = 0
	if Input.is_action_just_pressed("ui_down") && $RepairBar.value == 100:
		$RepairBar.value = 0
		
		rene.visible = true
		$ReneTimer.start()
		
		$StaticBody2D/CrackSprite.frame = 0
	if Input.is_action_just_pressed("ui_left"):
			penguin.look_left()		
	if Input.is_action_just_pressed("ui_right"):
			penguin.look_right()		
	
	pass


func _on_BoatTimer_timeout():

	spawnBoat()
	pass # Replace with function body.


func spawnBoat():
	var boat = boat_scene.instance()
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var my_random_number = rng.randi_range(1, 2)
	
	print(my_random_number)
	if my_random_number == 1:
		boat.position.x = 800;
		boat.setLeftDirection()
		boat.init(Vector2(-boat_speed.x,0))
	else:
		boat.init(boat_speed)	
		boat.setRightDirection()
	boat.position.y = 465

	
	add_child(boat)



func _on_AnimatedSprite_game_over():
	print("game Over")
	$Sprite/Game_Over_Label.visible = true
	$Game_Over.visible = true
	penguin.setAnimation("pingu_sad")
	penguin.position.y = 500
	get_tree().paused = true
	pass # Replace with function body.


func _on_Button_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()
	pass # Replace with function body.


func _on_water_body_body_entered(body):
	if(body is RigidBody2D):
		body.get_parent().queue_free()
	pass # Replace with function body.


func _on_IncreaseDifficulty_timeout():
	if($BoatTimer.wait_time > 2):
		$BoatTimer.wait_time -= 1;
	
	if(boat_speed.x < max_speed):
		boat_speed.x += 20
	pass # Replace with function body.



func _on_Wave_timeout():
	
	print("Wave!")
	spawnBoat()
	spawnBoat()
	spawnBoat()	
	pass # Replace with function body.


func _on_ReneTimer_timeout():
	
	rene.visible = false
	$ReneTimer.stop()
	pass # Replace with function body.
