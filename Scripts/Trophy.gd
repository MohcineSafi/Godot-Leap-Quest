extends Area2D
export var level: PackedScene
onready var score_manager = $"../scoreManager"

func _ready():
	pass


func _on_Trophy_body_entered(body):
	if (body == ($"../player")):
		#change scene only when all fruits are collected
		if(score_manager.score > 9):
			get_tree().change_scene_to(level)
