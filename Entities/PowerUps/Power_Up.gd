extends RigidBody2D

var rng = RandomNumberGenerator.new()

var speed = 50

export var healthIncrease: int
export var speedIncrease: int
export var reloadTimeDecrease: float
export var ammoAmount: int
export var bulletType: int

func start():
	rng.randomize()
	# bewegt sich in random richtung
	apply_impulse(Vector2(0,100), 
		Vector2(rng.randi_range(-300, 300), rng.randi_range(-300, 300)).normalized() * speed)


func _on_Area2D_body_entered(body):
	if body != self:
		if body.has_method('pickupItem'):
			body.pickupItem(healthIncrease, speedIncrease, reloadTimeDecrease, ammoAmount, bulletType)
			queue_free()
