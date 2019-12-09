extends CanvasLayer

func _ready():
	$Control/TextureRect/HBoxContainer/CuentaVida.text = "3"
	
func actualiza_GUI(quedan_vidas, monedas):
	$Control/TextureRect/HBoxContainer/CuentaVida.text = str(quedan_vidas)
	$Control/TextureRect/HBoxContainer/CuentaMoneda.text = str(monedas)
