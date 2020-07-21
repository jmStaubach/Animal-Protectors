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
	if(animation == "3 broken parts"):
		emit_signal("game_over")
	if(animation == "2 broken parts"):
		animation = "3 broken parts"
	if(animation == "1 broken part"):
		animation = "2 broken parts"
	if(animation == "default"):
		animation = "1 broken part";
	pass # Replace with function body.
