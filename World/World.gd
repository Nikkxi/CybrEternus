extends Node2D

@onready var player = get_node("Player")
@onready var spawnPoint = get_node("SpawnPoint")


# Called when the node enters the scene tree for the first time.
func _ready():
	player.player_has_died.connect(_on_player_died)
	player.reset(spawnPoint.position)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func respawn_player():
	print("Respawning the player. . .")
	player.update_position(spawnPoint.position)
	print("Player reset to spawn point")
	var playerHealth = get_node("Player/Health")
	playerHealth.resetHealth()
	print("Player health reset to ", playerHealth.current_health)


func damage_player():
	player.take_damage(2)


func _on_player_health_updated(player_current_health):
	get_node("UILayer/HUD").player_health_updated(player_current_health)


func _on_player_died():
	print("The player has died")
	get_node("UILayer/HUD")._on_player_died()
	
	
func _on_game_restart():
	print("Restarting the game")
	player.reset(spawnPoint.position)
