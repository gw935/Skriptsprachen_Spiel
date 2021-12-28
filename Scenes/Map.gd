extends Node2D


func _on_Tank_shoot(bullet, startPosiotion, startDirection):
	var newBullet = bullet.instance()
	add_child(newBullet)
	newBullet.start(startPosiotion, startDirection)
