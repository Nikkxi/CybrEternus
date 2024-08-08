extends "res://Resources/Items/Item.gd"

class_name Weapon

@export_range(1,4) var minDamage: int
@export_range(4,20) var maxDamage: int
@export_range(0.1,2) var attackSpeed: float

@export var type: WeaponType

enum WeaponType{
	SWORD,
	SPEAR,
	AXE
}

func perform():
	pass
