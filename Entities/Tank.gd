extends KinematicBody2D


export var speed: float
export var rotation_speed: float

var velocity = Vector2()

func _ready():
	pass


func control(delta):
	pass


func _physics_process(delta):
	control(delta)
	move_and_slide(velocity)
