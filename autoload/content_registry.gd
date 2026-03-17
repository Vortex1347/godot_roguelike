extends Node

var _bootstrap_catalog: Dictionary = {
	"definitions": PackedStringArray([
		"res://content/definitions/game_definition.gd",
		"res://content/definitions/item_def.gd",
		"res://content/definitions/weapon_def.gd",
		"res://content/definitions/ammo_def.gd",
		"res://content/definitions/quest_def.gd",
		"res://content/definitions/faction_def.gd",
	]),
}


func get_bootstrap_catalog() -> Dictionary:
	return _bootstrap_catalog.duplicate(true)
