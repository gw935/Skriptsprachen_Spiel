extends "res://Entities/Bullets/Bullet.gd"


export var explosionDamage: int

func explode():
	var bodys = $Explosion.get_overlapping_bodies()
	for b in bodys:
		if b.has_method('take_damage'):
			b.take_damage(explosionDamage)


func _on_Bullet_body_entered(body):
	if body.has_method('take_damage'):
		body.take_damage(damage)
	explode()
	deleteBullet()


func _on_Timer_timeout():
	explode()
	deleteBullet()
