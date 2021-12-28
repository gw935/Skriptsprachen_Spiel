extends "res://Entities/Bullets/Bullet.gd"


func _on_StrongerBullet_area_entered(area):
	if area.has_method('explode'):
		area.explode()
