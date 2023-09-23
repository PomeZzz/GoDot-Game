extends RigidBody2D

export (int) var vel_min
export (int) var vel_max

var tipo_monstruo = ["monstruo", "mini"]

func _ready():
	$AnimatedSprite.animation = tipo_monstruo[randi() % tipo_monstruo.size()]
	
	if $AnimatedSprite.animation == "enemigo":
		$CollisionShape2D.scale.x = 1.4
		$CollisionShape2D.scale.y = 1.4



func _on_Visibilidad_screen_exited():
	pass # Replace with function body.
