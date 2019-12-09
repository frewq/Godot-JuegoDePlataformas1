extends AnimatedSprite

func _on_Jugador_animar(movimiento):
	if movimiento.y < 0:
		play("saltar")
	elif movimiento.x > 0:
		flip_h = false
		play("caminar")
	elif movimiento.x < 0:
		flip_h = true
		play("caminar")
	else:
		play("quieto")