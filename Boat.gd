extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var velocity = Vector2(0,0)
func init(speed):
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var random_speed = 0
	if(speed.x < 0):
		random_speed = rng.randi_range(speed.x, -20)	
	else:	
		random_speed = rng.randi_range(20, speed.x)
	velocity = Vector2(random_speed, 0)
	print(velocity.x)
	pass


var drilling = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func setLeftDirection():
	scale = Vector2(-1,1)
	pass
func setRightDirection():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	position +=  velocity * delta
	pass


func startDrilling():
	drilling = true
	velocity = Vector2(0,0)
	#TODO Animation für das Bohren hinzufügen
	var drillTimer : Timer = get_parent().find_node("DrillTimer")
	drillTimer.start()
	drillTimer.addDrill()
	

	$Area2D/EnemySprite.play("drilling")
	pass



	
func _on_Area2D_body_entered(body):
	

	if body.get_parent().has_method("removeSelf"):
		body.get_parent().free()
		var boatCounter = get_parent().find_node("BoatCounter")
		boatCounter.updateScore() 
		var helpBar : ProgressBar = get_parent().find_node("HelpBar")
		helpBar.value += 8
		if drilling:
			get_parent().find_node("DrillTimer").removeDrill()
			drilling = false
		queue_free()
	elif body is StaticBody2D:
		startDrilling()
	pass # Replace with function body.
