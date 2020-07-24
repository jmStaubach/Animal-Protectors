extends Timer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var amountOfDrills = 0

# Called when the node enters the scene tree for the first time.
func addDrill():
	amountOfDrills += 1
	pass
	
func removeDrill():
	amountOfDrills -= 1
	pass
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if amountOfDrills == 0:
		stop()
	pass
