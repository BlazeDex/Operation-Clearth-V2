extends KinematicBody2D

var direction = 1
var speed = Vector2()

func _ready():
	if direction == -1:
		$AnimatedSprite.flip_h = true
	$AnimatedSprite/FloorDetection.position.x = $CollisionShape2D.shape.get_extents().x * direction
	
func _physics_process(delta):
	if is_on_wall() or !$AnimatedSprite/FloorDetection.is_colliding():
		direction *= -1
		$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h
		$AnimatedSprite/FloorDetection.position.x = $CollisionShape2D.shape.get_extents().x * direction

	speed.y += 20
	speed.x = 250 * direction
	speed = move_and_slide(speed, Vector2.UP)
