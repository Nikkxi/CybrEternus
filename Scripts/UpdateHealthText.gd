extends TextEdit

var playerHealth 
# Called when the node enters the scene tree for the first time.
func _ready():
	playerHealth = get_parent().get_node("Player/Health")
	text = (String)playerHealth.current_health


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_health_current_health_updated(newHealthValue):
	text = newHealthValue
	pass
