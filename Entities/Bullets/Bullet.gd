extends Area2D


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
	if body.has_method('take_damage'):
		body.take_damage(damage)
	# fuer Kisten und so
	if body.has_method('destroy'):
		body.destroy(damage)
	deleteBullet()


# wird aufgerufen, wenn die Bullet mit etwas kollidiert
# Explosionsanimation etc.
func deleteBullet():
	print("bullet deleted")
	queue_free()


func _on_Timer_timeout():
	deleteBullet()
