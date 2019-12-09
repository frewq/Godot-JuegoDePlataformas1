extends Area2D



func _on_PinchoArriba_body_entered(body):
#	body.lastimar()
	get_tree().call_group("EstadoJuego", "lastimar")
