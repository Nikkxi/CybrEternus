extends CharacterBody2D


@export_range(10,100) var SPEED = 30
@export var loot:String

var health:Health

signal player_health_updated
signal player_died

func _ready():
	pass

func _process(_delta):
	if Input.is_action_pressed("quit"):
		get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)
		get_tree().quit()

func _physics_process(_delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Vector2.ZERO
	direction.x = Input.get_axis("move_left", "move_right")
	direction.y = Input.get_axis("move_up", "move_down")
	direction = direction.normalized()
	
	if direction:
		velocity = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
	
	#var formatted_output = "%d %d Velocity"
	#var actual_output = formatted_output % [velocity.x, velocity.y]
	#print(actual_output)
	move_and_slide()
	
func reset():
	get_node("Health").resetHealth()

func take_damage(damage:int):
	get_node("Health").takeDamage(damage)
	

func _on_health_dies():
	print("Drops loot: " + loot)


func _on_health_current_health_updated(current_health):
	emit_signal("player_health_updated", current_health)

func _on_player_death():
	emit_signal("player_died")
