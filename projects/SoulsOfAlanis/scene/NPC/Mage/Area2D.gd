extends Area2D

func _input(event):
	
	var bodies = get_overlapping_bodies()
	
	for body in bodies:
		
		if body.name == "Player" && event.is_action_pressed("ui_up"):
			$TextBox/DialogPainel.show()