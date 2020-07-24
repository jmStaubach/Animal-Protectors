extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var story = ["Hallo, ich bin Perro und du musst mir helfen",
			"Das hat was mit Umwelt zu tun",
			"Du musst mir helfen"]
			
var index = 0;

# Called when the node enters the scene tree for the first time.
func _ready():
	$TextureRect/Panel/Label.text = story[index] + "\n (Drücke Space)"
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#if Input.is_action_just_pressed("ui_select") && $TextureRect/Panel.visible:

	pass


func _on_TextureButton_pressed():
	#get_tree().change_scene("res://world.tscn")
	$TextureRect/Panel.visible = true
	$TextureRect/PeruPicture.visible = true
	get_tree().change_scene("res://Cutscene.tscn")		
	pass # Replace with function body.
