extends Area2D

func _on_Node2D_body_entered(body):
	if body.name == "Quote":
		$Sprite.visible = true
		get_node("../Label").visible = true
		get_node("../../Control").visible = true
		yield(get_tree().create_timer(10.0), "timeout")
		$Sprite.visible = false
		get_node("../Label").visible = false

