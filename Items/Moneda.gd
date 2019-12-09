extends Node2D

var tomada = false


func _on_Area2D_body_entered(body):
	if not tomada:
		tomada = true
		$AnimationPlayer.play("morir")
		$AudioStreamPlayer.play()
		get_tree().call_group("EstadoJuego", "Moneda_Arriba")

func morir():
	queue_free()