extends "res://Resources/Items/Item.gd"

class_name Weapon

@export_range(1,4) var minDamage: int
@export_range(4,20) var maxDamage: int

@export var type: WeaponType

enum WeaponType{
	SWORD,
	SPEAR,
	AXE
}
