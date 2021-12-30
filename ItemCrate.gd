extends "res://Entities/Obstacles/Obstacle.gd"

export (Array, PackedScene) var Items
var ammoPickup = preload("res://Entities/PowerUps/Ammo_Pickup.tscn")

var rng = RandomNumberGenerator.new()

var is_exploded := false


func take_damage(damage):
	if is_exploded:
		return
	health -= damage
	if health <= 0:
		is_exploded = true
		$CollisionShape2D.set_deferred("disabled", true)
		get_tree().get_current_scene().call_deferred("spawnItem", get_global_position())
		get_parent().remove_child(self)
		queue_free()
