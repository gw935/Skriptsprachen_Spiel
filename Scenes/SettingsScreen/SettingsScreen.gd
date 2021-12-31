extends Control


func _on_Sound_Volum_HSlider_value_changed(value):
	if value == $Sound_Volum_HSlider.min_value:
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), -255)
	else:
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), value)


func _on_ReturnButton_pressed():
	$FadeIn.show()
	$FadeIn/AnimationPlayer.play("fade_into_titlescreen_from_settings")

func changeToTitleScreen():
	get_tree().change_scene("res://Scenes/TitleScreen/TitleScreen.tscn")
