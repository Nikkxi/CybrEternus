extends Control


signal respawn_player
signal damage_player


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func player_health_updated(player_current_health):
	get_node("TopBar/CurrentHealth").text = str(player_current_health)
	
func _on_respawn_player_button_pressed():
	emit_signal("respawn_player")


func _on_damage_player_button_pressed():
	emit_signal("damage_player")
