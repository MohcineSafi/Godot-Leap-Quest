extends Area2D
export var speed = 100
export var distance = 100
export var spin = 3
onready var startPosition: float = position.x
onready var target_dist: float = position.x + distance

func _ready():
	pass
#create a function called move to
func move_to(currentPosition, target, moving):
	var newPosition = currentPosition
	#are we moving right
	if newPosition < target:
		newPosition += moving
		#have we reached
		if newPosition > target:
			newPosition = target
	#else are we moving left
	else:
		newPosition -= moving
		#have reached the left side?
		if newPosition < target:
			newPosition = target
	return newPosition
#implement the move to function
func _physics_process(delta):
	position.x = move_to(position.x, target_dist, speed * delta)
	#have we reached the target?
	if position.x == target_dist:
		#successfully reached the left side
		if target_dist == startPosition:
			#start moving right
			target_dist = position.x + distance
		else:
			target_dist = startPosition
	#spinning
	if position.x < target_dist:
		rotation_degrees += spin
	else:
		rotation_degrees -= spin
		
#detect and kill the player if hit
func _on_enemy_body_entered(body):
	if body == ($"../../player"):
		get_tree().reload_current_scene()
		
