extends Node2D

var player_1
var player_2

var ui


func _ready():
	randomize()
	player_1 = get_node("Player_1")
	player_2 = get_node("Player_2")
	
	ui = get_node("UI")
	
	print("connect signals")
	player_1.connect("health_changed", self, "_on_health_changed_player_1")
	player_1.connect("ammo_changed", self, "_on_ammo_changed_player_1")
	player_1.connect("bulletIndex_changed", self, "_on_bulletIndex_changed_player_1")
	
	player_2.connect("health_changed", self, "_on_health_changed_player_2")
	player_2.connect("ammo_changed", self, "_on_ammo_changed_player_2")
	player_2.connect("bulletIndex_changed", self, "_on_bulletIndex_changed_player_2")


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
