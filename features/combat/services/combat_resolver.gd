class_name CombatResolver
extends RefCounted


func resolve_placeholder_damage(base_damage: float, armor_penetration: float) -> float:
	var mitigation := clampf(armor_penetration * 0.1, 0.0, 0.75)
	return maxf(0.0, base_damage * (1.0 - mitigation))

