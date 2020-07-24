extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func removeSelf():
	queue_free()
	pass

func invert():
	$RigidBody2D/AnimatedSprite.animation = "inverted"
	pass

func _on_RigidBody2D_body_entered(_body):
	queue_free()
	pass # Replace with function body.
