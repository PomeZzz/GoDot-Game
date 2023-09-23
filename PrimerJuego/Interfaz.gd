extends CanvasLayer

signal iniciar_juego

func mostrar_mensaje(texto):
	$Mensaje.text = texto
	$Mensaje.show()
	$MensajeTimer.start()
	
func game_over():
	mostrar_mensaje("Game Over")
	yield($MensajeTimer, "timeout")
	$Button.show()
	$Mensaje.text = "Mi Primer Juego"
	$Mensaje.show()


func refresh_puntos(Puntos):
	$PunteoLabel.text = str(Puntos)

func _on_MensajeTimer_timeout():
	$Mensaje.hide()


func _on_Button_pressed():
	$Button.hide()
	emit_signal("iniciar_juego")
