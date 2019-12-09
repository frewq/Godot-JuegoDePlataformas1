extends Node2D

var vidas = 3
var monedas = 0
var objetivo_numero_monedas = 10

func _ready():
	add_to_group("EstadoJuego")
	actualizar_GUI()

func lastimar():
	vidas -= 1
	$Jugador.lastimar()
	actualizar_GUI()
	if vidas < 1:
		fin_juego()

func fin_juego():
	get_tree().change_scene("res://Niveles/FinJuego.tscn")
	
func actualizar_GUI():
	get_tree().call_group("GUI", "actualiza_GUI", vidas, monedas)
	
func Moneda_Arriba():
	monedas += 1
	actualizar_GUI()
	var multiplo_de_monedas = (monedas % objetivo_numero_monedas) == 0
	if multiplo_de_monedas:
		vida_arriba()

func vida_arriba():
	vidas += 1
	actualizar_GUI()
	
func victoria():
	get_tree().change_scene("res://Niveles/Victoria.tscn")