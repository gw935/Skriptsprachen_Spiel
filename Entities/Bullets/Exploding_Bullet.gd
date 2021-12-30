extends "res://Entities/Bullets/Bullet.gd"

var is_exploded := false

export var explosionDamage: int
export (PackedScene) var ExplosionEffect

func explode():
	var explosionEffect = ExplosionEffect.instance()
	get_tree().get_current_scene().add_child(explosionEffect)
	explosionEffect.position = self.global_position
	explosionEffect.start()
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
