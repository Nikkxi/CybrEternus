extends TileMapLayer


func on_body_entered(player:CharacterBody2D):
	var tile_coord = local_to_map(to_local(player.global_position))
	var tile = get_cell_tile_data(tile_coord)
	if tile.get_custom_data("is_tall_grass"):
		var rand = RandomNumberGenerator.new()
		if (rand.randi_range(0,100) > 80):
			emit_signal("trigger_battle")
