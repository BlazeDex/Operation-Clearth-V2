extends Area2D
var entered = false

func _on_Door_body_entered(body):
	if body.name == "Quote":
		entered = true


func _on_Door_body_exited(body):
	if body.name == "Quote":
		entered = false
	
func _process(delta):
	if entered == true:
		if Input.is_action_just_pressed("ui_down"):
			get_tree().change_scene("res://Escenas/Pruebas.tscn")
			Resources.tutorial = true
			print("Cambié de escena")
			print(Resources.tutorial)



