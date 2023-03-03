extends Area2D

var entered = false
var onReady = false

func _on_Area2D_body_entered(body):
	if body.name == "Quote":
		entered = true
		onReady = true

func _on_Area2D_body_exited(body):
	if body.name == "Quote":
		entered = false

func _process(delta):
	if onReady == true and Resources.p1 == false:
		$AnimationPlayer.play("Incorrecto")
	elif onReady == true and Resources.p1 == true:
		$AnimationPlayer.play("Asegurado")
	else:
		$AnimationPlayer.play("Apagada")
		
	if entered == true and Resources.p1 == false:
		if Input.is_action_just_pressed("ui_down"):
			get_node("../Board").visible = true
			$ReadyOn.play()
