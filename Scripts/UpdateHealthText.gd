extends Label

@onready var playerHealth = get_tree().call()
# Called when the node enters the scene tree for the first time.
func _ready():
	text = str(playerHealth.current_health)
	playerHealth.connect("current_health_updated", Callable(self, "_on_health_current_health_updated"))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_health_current_health_updated(newHealth):
	text = str(newHealth)
