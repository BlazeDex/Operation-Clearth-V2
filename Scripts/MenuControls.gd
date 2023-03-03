extends Control

func _on_Jugar_pressed():
	if Resources.tutorial == false:
		get_tree().change_scene("res://Escenas/Tutorial.tscn")
		Resources.life = 100
		Resources.energy = 100
		Resources.p1 = false
	elif Resources.level2Up == false:
		get_tree().change_scene("res://Escenas/Pruebas.tscn")
		Resources.life = 100
		Resources.energy = 100
		Resources.p1 = false
	else:
		get_tree().change_scene("res://Escenas/Desierto.tscn")
		Resources.life = 100
		Resources.energy = 100

func _on_Salir_pressed():
	get_tree().quit()
