extends Node2D

var rng = RandomNumberGenerator.new()

var player_1
var player_2

var ui

var items = [
	preload("res://Entities/PowerUps/Explosion_Power_Pickup.tscn"),
	preload("res://Entities/PowerUps/Health_Power_Pickup.tscn"),
	preload("res://Entities/PowerUps/Reload_Power_Pickup.tscn"),
	preload("res://Entities/PowerUps/Speed_Power_Pickup.tscn"),
	preload("res://Entities/PowerUps/Stronger_Bullet_Pickup.tscn")
	]
var ammoPickup = preload("res://Entities/PowerUps/Ammo_Pickup.tscn")


func _ready():
	randomize()
	player_1 = get_node("Player_1")
	player_2 = get_node("Player_2")
	
	ui = get_node("UI")
	
	print("connect signals")
	player_1.connect("health_changed", self, "_on_health_changed_player_1")
	player_1.connect("ammo_changed", self, "_on_ammo_changed_player_1")
	player_1.connect("bulletIndex_changed", self, "_on_bulletIndex_changed_player_1")
	player_1.connect("tank_died", self, "_on_Tank_died")
	
	player_2.connect("health_changed", self, "_on_health_changed_player_2")
	player_2.connect("ammo_changed", self, "_on_ammo_changed_player_2")
	player_2.connect("bulletIndex_changed", self, "_on_bulletIndex_changed_player_2")
	player_2.connect("tank_died", self, "_on_Tank_died")

var p1 = 0
var p2 = 0

func _on_Tank_died(player):
	if player == "_2":
		print("Player 2 died")
		p1 = 1
	else:
		print("Player 1 died")
		p2 = 1
		
		
	if p1 && p2:
		ui.gameOver("s have not")
	elif p1 == 1 && p2 == 0:
		ui.gameOver(1)
	elif p2 ==1 && p1 == 0:
		ui.gameOver(2)
			
			


func _on_health_changed_player_1(health):
	print("health Changed")
	ui.changeHealth(1, health)


func _on_ammo_changed_player_1(ammo):
	ui.changeAmmo(1, ammo)


func _on_bulletIndex_changed_player_1(bulletIndex):
	ui.changeBulletType(1, bulletIndex)


func _on_health_changed_player_2(health):
	print("health Changed")
	ui.changeHealth(2, health)


func _on_ammo_changed_player_2(ammo):
	ui.changeAmmo(2, ammo)


func _on_bulletIndex_changed_player_2(bulletIndex):
	ui.changeBulletType(2, bulletIndex)


func spawnItem(position):
	rng.randomize()
	items.shuffle ()
	var item = items[0].instance()
	item.position = position
	add_child(item)
	item.start()
	var ammoAmount = rng.randi_range(1, 3)
	for i in ammoAmount:
		var ammo = ammoPickup.instance()
		ammo.position = position
		add_child(ammo)
		ammo.start()
