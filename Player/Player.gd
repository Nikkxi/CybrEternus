extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

signal respawn_player

func _process(delta):
	if Input.is_action_pressed("quit"):
		get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)
		get_tree().quit()
	
	if Input.is_action_pressed("respawn"):
		print("Emitting player respawn signal!")
		respawn_player.emit()

func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Vector2.ZERO
	direction.x = Input.get_axis("ui_left", "ui_right")
	direction.y = Input.get_axis("ui_up", "ui_down")
	direction = direction.normalized()
	
	if direction:
		velocity = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
	
	print("%d %d Velocity", velocity.x, velocity.y)
	move_and_slide()
