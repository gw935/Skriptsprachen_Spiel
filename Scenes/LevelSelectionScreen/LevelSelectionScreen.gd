extends Control

var selectedScreen = "res://Scenes/Level_01.tscn"


func _on_PlayButton_pressed():
	$FadeIn.show()
	$FadeIn/AnimationPlayer.play("fade_into_LevelScreen")


func changeToSelectedLevel():
	get_tree().change_scene(selectedScreen)


func _on_ReturnButton_pressed():
	$FadeIn.show()
	$FadeIn/AnimationPlayer.play("fade_into_TitleScreen")


func changeToTitleScreen():
	get_tree().change_scene("res://Scenes/TitleScreen/TitleScreen.tscn")
