extends KinematicBody2D

const bullet = preload("res://Escenas/Players/Bullets.tscn")
const purificar = preload("res://Escenas/Players/Purificador.tscn")


const ACCELERATION = 70
const MAX_SPEED = 300
const JUMP_H = -900
const UP = Vector2(0, -1)
const gravity = 40

var globalLife = Resources
var collision
var motion = Vector2()
var knockBack = 1000
var knockUp = 900

func _ready():
	$GUI/HealthPoints.value = globalLife.life
	$GUI/Energy.value = Resources.energy
	$Body.flip_h = true 

func throwBullet():
	var throw_Bullet = bullet.instance()
	if !$Body.flip_h:
		$Throw.scale.x = -1 
		throw_Bullet.scale = Vector2(-1.4, 1.4)
		throw_Bullet.speed = -700
	else: 
		$Throw.scale.x = 1
		throw_Bullet.scale = Vector2(1.4, 1.4)
		throw_Bullet.speed = 700
		
	throw_Bullet.global_position = $Throw/Direction.global_position
	get_tree().call_group("Mundo", "add_child", throw_Bullet)
	
func activateRay():
	var getRay = purificar.instance()
	if !$Body.flip_h:
		$Throw.scale.x = -1 
		getRay.scale = Vector2(-0.25, 0.25).rotated(rotation)
	else: 
		$Throw.scale.x = 1
		getRay.scale = Vector2(0.25, 0.25).rotated(rotation)
	getRay.global_position = $Throw.global_position
	get_tree().call_group("Mundo", "add_child", getRay)
	yield(get_tree().create_timer(0.6), "timeout")
	getRay.queue_free()

func updateLife():
	$GUI/HealthPoints.value = globalLife.life	

func updateEnergy():
	$GUI/Energy.value = Resources.energy

func dead():
	get_node("../GameOver").visible = true
	get_node("../GameOver/Death").play()
	get_node("../AudioStreamPlayer2D").stop()
	queue_free()

func get_dmg():
	globalLife.lostLife1()
	updateLife()
	$Hurt.play()
	print(globalLife.life)
	
func getFlinched():
	if $Body.flip_h == true:
		motion.x -= lerp(motion.x, knockBack, 0.5)
		motion.y = lerp(0, -knockUp, 0.6)
	else:
		motion.x += lerp(motion.x, knockBack, 0.5)
		motion.y = lerp(0, -knockUp, 0.6)

func _physics_process(delta):
	motion.y += gravity
	var friction = false
	
	
	if Input.is_action_pressed("ui_right"):
		motion.x = min(motion.x + ACCELERATION, MAX_SPEED)
		$AnimationPlayer.play("Walking")
		$Body.flip_h = true
	elif Input.is_action_pressed("ui_left"):
		motion.x = max(motion.x - ACCELERATION, -MAX_SPEED)
		$AnimationPlayer.play("Walking")
		$Body.flip_h = false
	elif Input.is_action_pressed("ui_down"):
		$AnimationPlayer.play("Check")
		print(Resources.p1)
		friction = true
	else:
		$AnimationPlayer.play("Idle")
		friction = true
		
	if Input.is_action_just_pressed("Shoot"):
		if Resources.energy > 0:
			throwBullet()
			Resources.energy -= 1
			updateEnergy()
	elif Input.is_action_just_pressed("Purificar"):
			if Resources.energy > 0:
				activateRay()
				Resources.energy -= 5
				updateEnergy()
			else:
				return
	
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = JUMP_H
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.5)
	else:
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.01) 
			
	
	if(get_slide_collision(get_slide_count()-1) != null):
		var obj_col = get_slide_collision(get_slide_count()-1).collider
		if(obj_col.is_in_group("Enemy")):  
			get_dmg()
			getFlinched()
	
	if(globalLife.life < 1):
		dead()
	
	motion = move_and_slide(motion, UP)
