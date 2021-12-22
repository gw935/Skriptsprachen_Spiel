extends "res://Entities/Tank.gd"


func control(delta):
	var rotation_dir = 0
	if Input.is_action_pressed("left"):
		rotation_dir -= 1
	if Input.is_action_pressed("right"):
		rotation_dir += 1
	rotation += rotation_speed * rotation_dir * delta
	
	# velocity auf 0 setzen sonst haellt der Spieler nicht an
	# rotation ist nicht im selben Massstab wie speed. 2 sollte ok sein
	velocity = Vector2()
	if Input.is_action_pressed("up"):
		velocity = Vector2(speed, 0).rotated(rotation)
	if Input.is_action_pressed("down"):
		velocity = Vector2(-speed, 0).rotated(rotation)
