extends Node2D

@onready var player = get_node("Player")
@onready var spawnPoint = get_node("SpawnPoint")


# Called when the node enters the scene tree for the first time.
func _ready():
	player.position = spawnPoint.position
	#get_node("HUD").transform = global_transform
	player.reset()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_hud_respawn_player():
	print("Respawning the player. . .")
	player.position = spawnPoint.position
	print("Player reset to spawn point")
	var playerHealth = get_node("Player/Health")
	playerHealth.resetHealth()
	print("Player health reset to ", playerHealth.current_health)


func _on_hud_damage_player():
	player.take_damage(2)


func _on_player_player_health_updated(player_current_health):
	get_node("UILayer/HUD").player_health_updated(player_current_health)
