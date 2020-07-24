extends AnimatedSprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal game_over

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_DrillTimer_timeout():
	if frame == 3:
		emit_signal("game_over")
		frame = 0
	else:
		frame += 1
	
	pass # Replace with function body.
