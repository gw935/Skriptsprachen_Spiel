extends "res://Entities/Bullets/Bullet.gd"

var is_exploded := false

export var explosionDamage: int
export (PackedScene) var ExplosionEffect

func explode():
	
	var bodys = $Explosion.get_overlapping_bodies()
	for b in bodys:
		if b.has_method('take_damage'):
			b.take_damage(explosionDamage)


func _on_Bullet_body_entered(body):
	if is_exploded:
		return
	is_exploded = true
	if body.has_method('take_damage'):
		body.take_damage(damage)
	explode()
	deleteBullet()


func _on_Timer_timeout():
	if is_exploded:
		return
	explode()
	deleteBullet()
