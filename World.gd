extends Node2D

@onready var player = get_node("Player")
@onready var spawnPoint = get_node("SpawnPoint")


# Called when the node enters the scene tree for the first time.
func _ready():
	respawn_player()
	player.respawn_player.connect(respawn_player)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func respawn_player():
	print("Respawning the player. . .")
	player.position = spawnPoint.position
	pass
