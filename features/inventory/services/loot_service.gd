class_name LootService
extends RefCounted


func build_placeholder_loot_roll(seed: int) -> Array[StringName]:
	var rng := RandomNumberGenerator.new()
	rng.seed = seed

	if seed == 0:
		return []

	return [&"scrap", &"medkit", &"ammo_9x18"].slice(0, mini(3, 1 + rng.randi_range(0, 2)))

