extends Particles2D

func start():
	emitting = false


func _on_Sfx_finished():
	queue_free()
