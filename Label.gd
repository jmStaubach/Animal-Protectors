extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var value = 3;


# Called when the node enters the scene tree for the first time.
func _ready():
	text = str("Fische: ",value)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_World_updateFish():
	value -= 1
	text = str("Fische: ",value)
	pass # Replace with function body.


func _on_FishReset_increaseFishCount():
	if(value < 3):
		value += 1
	text = str("Fische: ",value)
	pass # Replace with function body.
