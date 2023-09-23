extends Area2D
export (int) var Velocidad
var Movimiento = Vector2()
var limite
signal golpe #identifica cuando un enemigo nos choca

func _ready():
	#Defino limite de la pantalla
	limite = get_viewport_rect().size
	hide()

func _process(delta):
	Movimiento = Vector2()
	if Input.is_action_pressed("ui_right"):
		Movimiento.x += 1
	if Input.is_action_pressed("ui_left"):
		Movimiento.x -= 1
	if Input.is_action_pressed("ui_down"):
		Movimiento.y += 1
	if Input.is_action_pressed("ui_up"):
		Movimiento.y -= 1
	if Movimiento.length() > 0:
		Movimiento = Movimiento.normalized() * Velocidad
	position += Movimiento * delta


#Position va estar atrapdo en el limite de la ventana
	position.x = clamp(position.x, 0, limite.x)
	position.y = clamp(position.y, 0, limite.y)

#vamos a acoplar las animaciones
	if Movimiento.x != 0:
		$Sprite_player.animation = "Lado"
		$Sprite_player.flip_h = Movimiento.x < 0
	elif Movimiento.y < 0:
		$Sprite_player.animation = "Atras"
	elif Movimiento.y > 0:
		$Sprite_player.animation = "Frente"
	else:
		$Sprite_player.animation = "Quieto"




func _on_Player_body_entered(body):
	hide()
	emit_signal("golpe")
	$CollisionShape2D.disabled = true

#Funcion para la posicion inicial
func inicio(posi):
	position = posi
	show()
	$CollisionShape2D.disabled = false

