extends KinematicBody2D
var speed: float = 250.0
var gravityForce: int = 900
var jumpForce = 600
var vel = Vector2()
var is_jumping: bool = false
onready var animated = $AnimatedSprite

func _ready():
	pass
func _physics_process(delta):
	
	vel.x = 0
	#adding movements
	if Input.is_action_pressed("left"):
		vel.x -= speed
	if Input.get_action_strength("right"):
		vel.x += speed
	#adding gravity
	vel.y += gravityForce * delta
	if Input.is_action_pressed("jump") and is_on_floor():
		vel.y -= jumpForce
	#Turning left or right
	if(vel.x < 0):
		animated.flip_h = true
	elif(vel.x > 0):
		animated.flip_h = false
	#play animation
	if(vel.x == 0):
		animated.play("idle")
	elif(vel.x < 0 || vel.x > 0) and is_on_floor():
		animated.play("run")
	if(vel.y > 0) and (!is_on_floor()):
		animated.play("fall")
	elif(vel.y < 0) and (!is_on_floor()):
		animated.play("jump")
	vel = move_and_slide(vel, Vector2.UP)
