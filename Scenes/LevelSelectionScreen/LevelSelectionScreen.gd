extends Control

var level = [
	"res://Scenes/Level_01.tscn",
	"res://Scenes/Test_Level.tscn",
	"res://Scenes/Level/Level_02/Level_02.tscn"
]
var levelPictures = [
	preload("res://Assets/PreviewLevel/preview_desert.png"),
	preload("res://Assets/PreviewLevel/Preview_Mapname.png"),
	preload("res://Assets/PreviewLevel/preview_camping.png")
]
var levelNames = [
	"Level_1",
	"Test_Level",
	"Level_2"
]

var titleScreen = "res://Scenes/TitleScreen/TitleScreen.tscn"

var selectedScreen = 0


func _on_PlayButton_pressed():
	$FadeIn.show()
	$FadeIn/AnimationPlayer.play("fade_into_LevelScreen")


func changeToSelectedLevel():
	get_tree().change_scene(level[selectedScreen])


func _on_ReturnButton_pressed():
	$FadeIn.show()
	$FadeIn/AnimationPlayer.play("fade_into_TitleScreen")


func changeToTitleScreen():
	get_tree().change_scene(titleScreen)



func _on_leftButton_pressed():
	if selectedScreen <= 0:
		selectedScreen = level.size() - 1
	else:
		selectedScreen = selectedScreen - 1
	$VBoxContainer/HBoxContainer/TextureRect.texture = levelPictures[selectedScreen]
	$LevelLabel.text = levelNames[selectedScreen]


func _on_rightButton_pressed():
	if selectedScreen >= level.size() - 1:
		selectedScreen = 0
	else:
		selectedScreen = selectedScreen + 1
	$VBoxContainer/HBoxContainer/TextureRect.texture = levelPictures[selectedScreen]
	$LevelLabel.text = levelNames[selectedScreen]
