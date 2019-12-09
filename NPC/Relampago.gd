extends Node2D

const VELOCIDAD = 300

func _ready():
	set_as_toplevel(true)
	global_position = get_parent().global_position

func _process(delta):
	position.y += VELOCIDAD * delta
	administrar_colision()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func administrar_colision():
	var colisionador = $Area2D.get_overlapping_bodies()
	for objetos in colisionador:
		if objetos.name == "Jugador":
			get_tree().call_group("EstadoJuego", "lastimar")
		queue_free()