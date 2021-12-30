extends CanvasLayer


func gameOver(player):
	$CenterContainer/WinContainer/WinLabel.text = "Player " + str(player) + " Won"
	$CenterContainer.show()


func changeHealth(player, health):
	if player == 1:
		$ui_player_1_VBox/HealthLabel.text = "HP: " + str(health)
	else:
		$ui_player_2_VBox/HealthLabel.text = "HP: " + str(health)


func changeAmmo(player, ammo):
	if player == 1:
		$ui_player_1_VBox/Ammo.text = "Ammo: " + str(ammo)
	else:
		$ui_player_2_VBox/Ammo.text = "Ammo: " + str(ammo)


func changeBulletType(player, type):
	var gunType
	match type:
		-1:
			gunType = ""
		0:
			gunType = "Strong"
		1:
			gunType = "Explosive"
	if player == 1:
		$ui_player_1_VBox/AmmoType.text = "Gun: " + str(gunType)
	else:
		$ui_player_2_VBox/AmmoType.text = "Gun: " + str(gunType)


func _on_Menu_Button_pressed():
	get_tree().change_scene("res://Scenes/TitleScreen/TitleScreen.tscn")


func _on_Restart_Button_pressed():
	get_tree().reload_current_scene()
