extends Control


signal respawn_player
signal damage_player
signal restart_game


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func player_health_updated(player_current_health):
	get_node("TopBar/CurrentHealth").text = str(player_current_health)
	
func _on_respawn_player_button_pressed():
	emit_signal("respawn_player")


func _on_damage_player_button_pressed():
	emit_signal("damage_player")


func _on_player_died():
	get_node("TopBar").visible = false
	get_node("GameOver").visible = true
	
func _on_game_restart():
	get_node("TopBar").visible = true
	get_node("GameOver").visible = false
	emit_signal("restart_game")
