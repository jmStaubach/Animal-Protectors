extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var velocity = Vector2(20,0)

var drilling = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func setLeftDirection():
	velocity = Vector2(-40,0)	
	pass
func setRightDirection():
	velocity = Vector2(40,0)	
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	position +=  velocity * delta
	pass


func startDrilling():
	velocity = Vector2(0,0)
	#TODO Animation für das Bohren hinzufügen
	get_parent().get_child(3).start()
	drilling = true
	pass

func _on_Area2D_body_entered(body):
	
	get_parent().get_child(2).updateScore() 

	drilling = false
	if body.get_parent().has_method("removeSelf"):
		body.get_parent().removeSelf()
		get_parent().remove_child(self)
	else:
		startDrilling()
	pass # Replace with function body.
