extends Particles2D


func start():
	emitting = true


func _on_Sfx_finished():
	queue_free()
