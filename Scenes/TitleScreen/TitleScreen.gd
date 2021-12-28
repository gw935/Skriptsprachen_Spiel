extends Control


func _on_NewGameButton_pressed():
	$FadeIn.show()
	$FadeIn/AnimationPlayer.play("fade_into_LevelSelectionScreen")


func changeToLevelSelectionScreen():
	get_tree().change_scene("res://Scenes/LevelSelectionScreen/LevelSelectionScreen.tscn")


func _on_OptionsButton_pressed():
	pass # TODO: open Options Menu


func _on_ExitButton_pressed():
	get_tree().quit()
