extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var fish_scene = preload("res://Fish.tscn")

var velocity = Vector2(200,0)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$AlbatrossSprite.position += velocity * delta
	pass


func _on_FishTimer_timeout():
	if $AlbatrossSprite.position.x < 250 || $AlbatrossSprite.position.x > 550:
		var fish = fish_scene.instance()
		fish.position = $AlbatrossSprite.position
		fish.position.x =  $AlbatrossSprite.position.x + 10
		fish.position.y =  $AlbatrossSprite.position.y + 10
		get_parent().add_child(fish)
	pass # Replace with function body.




func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	pass # Replace with function body.
