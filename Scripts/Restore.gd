extends Area2D

var entered = false
var onReady = false
var character = null

func _on_Area2D_body_entered(body):
	if body.name == "Quote":
		entered = true
		onReady = true
		character = body

func _on_Area2D_body_exited(body):
	if body.name == "Quote":
		entered = false
		character = null

func _process(delta):
	if onReady == true:
		$AnimationPlayer.play("Ready")
	else:
		$AnimationPlayer.play("Apagado")
		
	if entered == true:
		if Input.is_action_just_pressed("ui_down"):
			Resources.life = 100
			Resources.energy = 100
			character.updateLife()
			character.updateEnergy()
			$Rellenar.play()
