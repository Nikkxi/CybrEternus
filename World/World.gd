extends Node2D

@onready var player = get_node("Player")
@onready var spawnPoint = get_node("SpawnPoint")


# Called when the node enters the scene tree for the first time.
func _ready():
	#player.player_has_died.connect(_on_player_died)
	player.reset(spawnPoint.position)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func reset_player():
	print("Resetting the player. . .")
	player.reset(spawnPoint.position)


func damage_player():
	player.take_damage(2)


func _on_player_health_updated(player_current_health):
	get_node("HUD").player_health_updated(player_current_health)


func _on_player_died():
	print("The player has died")
	get_node("HUD")._on_player_died()
	
	
func _on_game_restart():
	print("Restarting the game")
	reset_player()
