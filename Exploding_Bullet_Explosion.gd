extends Particles2D


func start():
	$Sfx.play()
	emitting = true


func _on_Sfx_finished():
	queue_free()
