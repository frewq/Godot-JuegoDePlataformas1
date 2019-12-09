extends Area2D



func _on_Trampolin_body_entered(body):
	if body.has_method("potenciador"):
		$AnimationPlayer.play("Potenciador")
		body.potenciador()
