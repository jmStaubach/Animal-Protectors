extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	get_parent().get_tree().paused = false
	get_parent().get_tree().reload_current_scene()
	pass # Replace with function body.


func _on_Game_Over_Label_visibility_changed():
	text = str("Oh, du hast es leider nicht geschafft die bösen Ölbohrer abzuwehren \n \n Highscore: ", get_parent().get_child(2).score)
	pass # Replace with function body.
