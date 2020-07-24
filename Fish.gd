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
	$RigidBody2D/CollisionShape2D.disabled = true
	queue_free()
	pass

func invert():
	$RigidBody2D/AnimatedSprite.animation = "inverted"
	pass

