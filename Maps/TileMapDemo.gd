extends TileMap

@export_range(0,10) var octaves:int = 8
@export_range(0,10) var gain:int = 8
@export_range(0,5) var lacunarity:int = 8

@export var width = 1000
@export var height = 1000

var noise:FastNoiseLite
var map:Array

# Called when the node enters the scene tree for the first time.
func _ready():
	noise = FastNoiseLite.new()
	noise.noise_type = FastNoiseLite.TYPE_PERLIN
	noise.fractal_octaves = octaves
	noise.fractal_gain = gain
	noise.fractal_lacunarity = lacunarity


func _generateMap():
	map.resize(width)
	
	for i in map:
		map.append([])
		
	for col in map:
		for row in col:
			map[col][row] = noise.get_noise_2d(col,row)
			
