extends Particles2D

func start():
	emitting = true
	$Sfx.play()


func _on_Sfx_finished():
	queue_free()
