extends "res://Entities/Bullets/Bullet.gd"


export var explosionDamage: int
export (PackedScene) var ExplosionEffect

func explode():
	var explosionEffect = ExplosionEffect.instance()
	get_tree().get_root().add_child(explosionEffect)
	explosionEffect.position = self.global_position
	explosionEffect.start()
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
