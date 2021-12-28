extends "res://Entities/Obstacles/Obstacle.gd"

export (Array, PackedScene) var Items
var ammoPickup = preload("res://Entities/PowerUps/Ammo_Pickup.tscn")

var rng = RandomNumberGenerator.new()


func take_damage(damage):
	health -= damage
	if health <= 0:
		rng.randomize()
		Items.shuffle ()
		var item = Items[0].instance()
		get_tree().get_root().add_child(item)
		item.position = self.global_position
		item.start()
		#var ammoAmount = rng.randi_range(3, 3)
		#for i in ammoAmount:
		#	var ammo = ammoPickup.instance()
		#	get_tree().get_root().add_child(ammo)
		#	ammo.position = self.global_position
		#	ammo.start()
		queue_free()
