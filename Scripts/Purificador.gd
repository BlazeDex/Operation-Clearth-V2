extends Area2D

func _on_Purificador_body_entered(body):
	if body.is_in_group("MW1"):
		print("Detecté el agua")
		get_node("../MuddyWater/MW1").visible = false
	elif body.is_in_group("MW2"):
		print("Detecté el agua")
		get_node("../MuddyWater/MW2").visible = false
	elif body.is_in_group("MW3"):
		print("Detecté el agua")
		get_node("../MuddyWater/MW3").visible = false
	elif body.is_in_group("MW4"):
		print("Detecté el agua")
		get_node("../MuddyWater/MW4").visible = false
	elif body.is_in_group("MW5"):
		print("Detecté el agua")
		get_node("../MuddyWater/MW5").visible = false
	elif body.is_in_group("MW6"):
		print("Detecté el agua")
		get_node("../MuddyWater/MW6").visible = false
