extends RigidBody2D

export var health: int

func take_damage(damage):
	health -= damage
	if health <= 0:
		queue_free()
