extends KinematicBody2D

var movimiento = Vector2(0, 0)

const VELOCIDAD = 1500
const GRAVEDAD = 300
const ARRIBA = Vector2(0,-1)
const VELOCIDAD_SALTO = 3500
const LIMITE_MUNDO = 3000
const POTENCIADOR_MULTIPLICADOR = 1.5

signal animar

func _process(delta):
	aplicar_gravedad()
	saltar()
	mover()
	animar()
	move_and_slide(movimiento, ARRIBA)
	
func aplicar_gravedad():
	if position.y > LIMITE_MUNDO:
		get_tree().call_group("EstadoJuego", "fin_juego")
	if is_on_floor() and movimiento.y > 0:
		movimiento.y = 0
	elif is_on_ceiling():
		movimiento.y = 1
	else:
		movimiento.y += GRAVEDAD

func saltar():
	if Input.is_action_pressed("saltar") and is_on_floor():
		movimiento.y -= VELOCIDAD_SALTO
		$SonidoSalto.play()

func mover():
	if Input.is_action_pressed("izquierda") and not Input.is_action_pressed("derecha"):
		movimiento.x = -VELOCIDAD
	elif Input.is_action_pressed("derecha") and not Input.is_action_pressed("izquierda"):
		movimiento.x = VELOCIDAD
	else:
		movimiento.x = 0
		
func animar():
	emit_signal("animar", movimiento)

func lastimar():
	#tutorial: 11 - Area2D - Making Spike Hazard
	position.y -= 1
	yield(get_tree(), "idle_frame")
	movimiento.y = -VELOCIDAD_SALTO
	$SonidoDolor.play()
#	if vidas < 1:
#		fin_juego()
		
func potenciador():
	position.y -= 1
	yield(get_tree(), "idle_frame")
	movimiento.y -= VELOCIDAD_SALTO * POTENCIADOR_MULTIPLICADOR