extends Node
class_name Health


@export var max_health = 10
var current_health

signal Dies
signal current_health_updated

# Called when the node enters the scene tree for the first time.
func _ready():
	current_health = max_health


func takeDamage(damage:int):
	current_health -= damage
	
	emit_signal("current_health_updated", current_health)
	
	if current_health <= 0:
		Dies.emit()


func receiveHealing(health:int):
	current_health += health
	
	if current_health > max_health:
		current_health = max_health