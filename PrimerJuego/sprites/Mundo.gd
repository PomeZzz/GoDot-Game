extends Node

export (PackedScene) var Monstruo

var Punteo

func _ready():
	randomize()

func nuevo_juego():
	Punteo = 0
	$Player.inicio($PosicionDeInicio.position)
	$InicioTimer.start()
	$Interfaz.mostrar_mensaje("Preparate...")
	$Interfaz.refresh_puntos(Punteo)

func game_over():
	$PunteoTimer.stop()
	$MonstruoTimer.stop()
	$Interfaz.game_over()


func _on_InicioTimer_timeout():
	$MonstruoTimer.start()
	$PunteoTimer.start()

func _on_PunteoTimer_timeout():
	Punteo += 1
	$Interfaz.refresh_puntos(Punteo)

func _on_MonstruoTimer_timeout():
	$Camino/MonstruoPosicion.set_offset(randi())
	var M = Monstruo.instance()
	add_child(M)
	
	
	var dire= $Camino/MonstruoPosicion.rotation + PI /2
	M.position = $Camino/MonstruoPosicion.position
	
	
	dire += rand_range(-PI /4, PI /4)
	M.rotation = dire
	M.set_linear_velocity(Vector2(rand_range(M.vel_min,M.vel_max),0).rotated(dire))
