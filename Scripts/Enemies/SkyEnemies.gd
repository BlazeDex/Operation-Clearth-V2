extends KinematicBody2D

var direction = 1
var speed = Vector2()
var player = null
var plife = Resources.life

func _ready():
	if direction == 1:
		$AnimatedSprite.flip_h = true
	
	
func _physics_process(delta):
	if is_on_wall():
		direction *= -1
		$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h
	
	if player != null and plife > 1:
		speed = position.direction_to(player.position)
	else:
		speed.x = 100 * direction
		speed = move_and_slide(speed, Vector2.UP) 
	
	speed.x = 100 * direction
	speed = move_and_slide(speed, Vector2.UP) 
