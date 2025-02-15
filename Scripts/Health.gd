extends Node
class_name Health


@export var max_health = 10
var current_health

signal has_died
signal current_health_updated

# Called when the node enters the scene tree for the first time.
func _ready():
	current_health = max_health


func takeDamage(damage:int):
	current_health -= damage
	print("Taken ", damage)
	print("Current Health: ", current_health)
	emit_signal("current_health_updated", current_health)
	
	if current_health <= 0:
		emit_signal("has_died")


func heal(health:int):
	current_health += health
	current_health = mini(current_health,max_health)


func resetHealth():
	current_health = max_health
	print("Reset health to ", current_health)
	emit_signal("current_health_updated", current_health)
