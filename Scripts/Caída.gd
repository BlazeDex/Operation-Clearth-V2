extends Area2D


func _on_Cada_body_entered(body):
	if body.get_name() == "Quote":
		Resources.life = 0
