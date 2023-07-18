extends CharacterBody2D


@export_range(10,100) var SPEED = 30
@export var loot:String

var health:Health

signal respawn_player

func _ready():
	pass

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
	
	var formatted_output = "%d %d Velocity"
	var actual_output = formatted_output % [velocity.x, velocity.y]
	print(actual_output)
	move_and_slide()


func _on_health_dies():
	print("Drops loot: " + loot)

func _on_button_pressed() -> bool:
	get_node("Health").takeDamage(2)
	return true
