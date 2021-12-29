extends Area2D

var BulletHit = preload("res://Effects/Explosions/BulletHit.tscn")

export var speed: int
export var damage: int
export var time_alive: float

var velocity = Vector2()

func start(startPosition, startDirection):
	position = startPosition
	rotation = startDirection.angle()
	$Timer.wait_time = time_alive
	$Timer.start()
	velocity = startDirection * speed


func _process(delta):
	position += velocity * delta


func _on_Bullet_body_entered(body):
	var bulletHit = BulletHit.instance()
	get_tree().get_root().add_child(bulletHit)
	bulletHit.position = self.global_position
	bulletHit.start()
	if body.has_method('take_damage'):
		body.take_damage(damage)
	deleteBullet()


# wird aufgerufen, wenn die Bullet mit etwas kollidiert
# Explosionsanimation etc.
func deleteBullet():
	queue_free()


func _on_Timer_timeout():
	print("bullet despawn")
	deleteBullet()
