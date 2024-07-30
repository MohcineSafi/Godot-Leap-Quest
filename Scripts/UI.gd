extends CanvasLayer



func _ready():
	pass
func _input(event):
	if(event.is_action_released("Enter")):
		get_tree().change_scene("res://Scenes/Level1.tscn")
	elif(event.is_action_pressed("quit")):
		get_tree().quit()

