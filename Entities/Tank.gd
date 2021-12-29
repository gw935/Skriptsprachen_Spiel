extends KinematicBody2D

signal health_changed
signal ammo_changed
signal bulletIndex_changed

export var player: String

export var health: int
export var speed: float
export var rotation_speed: float
export var reloadTime: float
export var invincibilityTime: float

export (PackedScene) var Bullet
export (Array, PackedScene) var PickupBullet

var can_shoot = true
var ammo := 0 
var bulletIndex := -1

var velocity = Vector2()


func _ready():
	$Timer.wait_time = reloadTime


func control(delta):
	var rotation_dir = 0
	if Input.is_action_pressed("left" + player):
		rotation_dir -= 1
	if Input.is_action_pressed("right" + player):
		rotation_dir += 1
	rotation += rotation_speed * rotation_dir * delta
	
	# velocity auf 0 setzen sonst haellt der Spieler nicht an
	# rotation ist nicht im selben Massstab wie speed. 2 sollte ok sein
	velocity = Vector2()
	if Input.is_action_pressed("up" + player):
		velocity = Vector2(speed, 0).rotated(rotation)
	if Input.is_action_pressed("down" + player):
		velocity = Vector2(-speed, 0).rotated(rotation)
	
	# Shooting
	if Input.is_action_pressed("fire" + player):
		shoot()


func shoot():
	if can_shoot:
		can_shoot = false
		$Timer.start()
		$Sfx.play()
		var dir = Vector2(1, 0).rotated($Body/Barrel.global_rotation)
		if ammo > 0 and bulletIndex != -1:
			var newBullet = PickupBullet[bulletIndex].instance()
			get_tree().get_root().add_child(newBullet)
			newBullet.start($Body/Barrel/Position2D.global_position, dir)
			ammo -= 1
			emit_signal("ammo_changed", ammo)
		else:
			var newBullet = Bullet.instance()
			get_tree().get_root().add_child(newBullet)
			newBullet.start($Body/Barrel/Position2D.global_position, dir)


func _physics_process(delta):
	if health <= 0:
		queue_free()
	
	control(delta)
	move_and_slide(velocity)


func _on_Timer_timeout():
	can_shoot = true


func take_damage(damage):
	health = health - damage
	emit_signal("health_changed", health)


func pickupItem(healthIncrease, speedIncrease, reloadTimeDecrease, ammoAmount, bulletType):
	health += healthIncrease
	if speed + speedIncrease > 190:
		speed = 190
	else:
		speed += speedIncrease
	if reloadTime - reloadTimeDecrease < 0.5:
		reloadTime = 0.5
	else:
		reloadTime -= reloadTimeDecrease
		$Timer.wait_time = reloadTime
	if bulletType != -1:
		if bulletType == bulletIndex:
			ammo += ammoAmount
		else:
			ammo = ammoAmount
		bulletIndex = bulletType
	else:
		if bulletIndex != -1:
			ammo += ammoAmount
	emit_signal("health_changed", health)
	emit_signal("ammo_changed", ammo)
	emit_signal("bulletIndex_changed", bulletIndex)
