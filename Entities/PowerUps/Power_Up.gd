extends RigidBody2D

var rng = RandomNumberGenerator.new()

export var speed: int

func _ready():
	rng.randomize()
	# bewegt sich in random richtung
	apply_impulse(Vector2(0,100), 
		Vector2(rng.randi_range(-300, 300), rng.randi_range(-300, 300)).normalized() * speed)


func _on_Area2D_body_entered(body):
	if body != self:
		# metode vom Body aufrufen um shit zu tun body.do_shit
		queue_free()
