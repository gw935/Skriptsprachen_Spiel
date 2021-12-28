extends Node


onready var viewport1 = $HBoxContainer/ViewportContainer1/Viewport1
onready var viewport2 = $HBoxContainer/ViewportContainer2/Viewport2
onready var camera1 = $HBoxContainer/ViewportContainer1/Viewport1/Camera2D
onready var camera2 = $HBoxContainer/ViewportContainer2/Viewport2/Camera2D
onready var world = $HBoxContainer/ViewportContainer1/Viewport1/Level_01

func _ready():
	viewport2.world_2d = viewport1.world_2d
	camera1.target = world.get_node("Player_1")
	camera2.target = world.get_node("Player_2")
