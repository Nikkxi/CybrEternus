extends CharacterBody2D


const SPEED = 300


func _unhandled_input(event):
	if event is InputEvent:
		if event.is_action("Quit"):
			get_tree().get_root().propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)
			get_tree().quit(0)
	pass

func _physics_process(delta):
	var input_dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	position += input_dir * SPEED * delta
	
	move_and_slide()
