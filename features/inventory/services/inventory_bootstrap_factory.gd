class_name InventoryBootstrapFactory
extends RefCounted

const BUNKER_SESSION_STATE_MODEL := preload("res://runtime/models/bunker_session_state.gd")
const CONTAINER_GRID_STATE_MODEL := preload("res://runtime/models/container_grid_state.gd")
const CONTAINER_ITEM_STATE_MODEL := preload("res://runtime/models/container_item_state.gd")
const ITEM_STACK_STATE_MODEL := preload("res://runtime/models/item_stack_state.gd")


func build_bunker_session_state() -> Resource:
	var bunker_state: Resource = BUNKER_SESSION_STATE_MODEL.new()
	bunker_state.set("inventory_container", _build_player_inventory())
	bunker_state.set("stash_container", _build_stash_inventory())
	bunker_state.set("active_panel_action", &"")
	bunker_state.set("is_inventory_open", false)
	bunker_state.set("player_position", Vector2(480.0, 896.0))
	bunker_state.set("player_position_3d", Vector3(0.0, 0.75, 4.2))
	return bunker_state


func _build_player_inventory() -> Resource:
	var container: Resource = CONTAINER_GRID_STATE_MODEL.new()
	container.set("container_id", &"player_inventory")
	container.set("title", "Hunter Kit")
	container.set("columns", 8)
	container.set("rows", 6)
	var items: Array[Resource] = []
	items.append(_make_entry(&"mkr", "Makarov", Vector2i(2, 1), Vector2i(0, 0), 1, Color(0.27, 0.34, 0.40, 1.0), Color(0.78, 0.84, 0.88, 1.0)))
	items.append(_make_entry(&"kni", "Knife", Vector2i(1, 2), Vector2i(2, 0), 1, Color(0.31, 0.31, 0.25, 1.0), Color(0.89, 0.83, 0.61, 1.0)))
	items.append(_make_entry(&"med", "Medkit", Vector2i(2, 2), Vector2i(4, 0), 1, Color(0.43, 0.24, 0.24, 1.0), Color(0.92, 0.65, 0.58, 1.0)))
	items.append(_make_entry(&"a18", "9x18", Vector2i(1, 1), Vector2i(0, 2), 60, Color(0.43, 0.37, 0.25, 1.0), Color(0.91, 0.82, 0.60, 1.0)))
	items.append(_make_entry(&"wtr", "Water", Vector2i(1, 2), Vector2i(1, 2), 1, Color(0.20, 0.35, 0.43, 1.0), Color(0.55, 0.80, 0.92, 1.0)))
	items.append(_make_entry(&"rat", "Ration", Vector2i(1, 1), Vector2i(3, 2), 1, Color(0.37, 0.39, 0.22, 1.0), Color(0.80, 0.84, 0.52, 1.0)))
	container.set("items", items)
	return container


func _build_stash_inventory() -> Resource:
	var container: Resource = CONTAINER_GRID_STATE_MODEL.new()
	container.set("container_id", &"stash")
	container.set("title", "Bunker Stash")
	container.set("columns", 12)
	container.set("rows", 6)
	var items: Array[Resource] = []
	items.append(_make_entry(&"tol", "Tool Kit", Vector2i(2, 2), Vector2i(0, 0), 1, Color(0.31, 0.32, 0.36, 1.0), Color(0.73, 0.74, 0.81, 1.0)))
	items.append(_make_entry(&"bat", "Battery", Vector2i(1, 2), Vector2i(3, 0), 1, Color(0.22, 0.29, 0.24, 1.0), Color(0.64, 0.84, 0.70, 1.0)))
	items.append(_make_entry(&"scr", "Scrap", Vector2i(2, 1), Vector2i(5, 0), 4, Color(0.33, 0.27, 0.22, 1.0), Color(0.76, 0.65, 0.55, 1.0)))
	items.append(_make_entry(&"flt", "Filter", Vector2i(2, 1), Vector2i(0, 3), 1, Color(0.23, 0.33, 0.28, 1.0), Color(0.67, 0.86, 0.72, 1.0)))
	items.append(_make_entry(&"ful", "Fuel", Vector2i(1, 2), Vector2i(8, 1), 1, Color(0.40, 0.27, 0.18, 1.0), Color(0.92, 0.72, 0.42, 1.0)))
	items.append(_make_entry(&"tap", "Tape", Vector2i(1, 1), Vector2i(10, 0), 2, Color(0.36, 0.33, 0.22, 1.0), Color(0.84, 0.80, 0.47, 1.0)))
	container.set("items", items)
	return container


func _make_entry(
	item_id: StringName,
	display_name: String,
	footprint: Vector2i,
	grid_position: Vector2i,
	quantity: int,
	tint: Color,
	accent: Color
) -> Resource:
	var stack: Resource = ITEM_STACK_STATE_MODEL.new()
	stack.set("item_id", item_id)
	stack.set("display_name", display_name)
	stack.set("short_label", display_name.substr(0, mini(3, display_name.length())).to_upper())
	stack.set("footprint", footprint)
	stack.set("quantity", quantity)
	stack.set("tint", tint)
	stack.set("accent", accent)

	var entry: Resource = CONTAINER_ITEM_STATE_MODEL.new()
	entry.set("stack", stack)
	entry.set("grid_position", grid_position)
	return entry
