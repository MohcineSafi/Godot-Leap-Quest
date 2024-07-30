extends Area2D
onready var text_holder = $"../../scoreManager"

func _ready():
	pass


func _on_fruit_body_entered(body):
	if(body == ($"../../player")):
		queue_free()
		text_holder.updateScore()

