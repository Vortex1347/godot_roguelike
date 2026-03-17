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
	bunker_state.set("player_position_3d", Vector3(0.0, 0.75, 2.8))
	return bunker_state


func _build_player_inventory() -> Resource:
	var container: Resource = CONTAINER_GRID_STATE_MODEL.new()
	container.set("container_id", &"player_inventory")
	container.set("title", "Field Satchel")
	container.set("columns", 8)
	container.set("rows", 6)
	var items: Array[Resource] = []
	items.append(_make_entry(&"emb", "Ember Tome", Vector2i(2, 1), Vector2i(0, 0), 1, Color(0.34, 0.20, 0.18, 1.0), Color(0.92, 0.57, 0.36, 1.0)))
	items.append(_make_entry(&"ash", "Ash Wand", Vector2i(1, 2), Vector2i(2, 0), 1, Color(0.24, 0.21, 0.18, 1.0), Color(0.87, 0.81, 0.66, 1.0)))
	items.append(_make_entry(&"vit", "Vital Draught", Vector2i(2, 2), Vector2i(4, 0), 1, Color(0.33, 0.18, 0.22, 1.0), Color(0.90, 0.53, 0.60, 1.0)))
	items.append(_make_entry(&"aes", "Aether Salt", Vector2i(1, 1), Vector2i(0, 2), 36, Color(0.24, 0.33, 0.39, 1.0), Color(0.69, 0.86, 0.92, 1.0)))
	items.append(_make_entry(&"mwt", "Moonwater", Vector2i(1, 2), Vector2i(1, 2), 1, Color(0.16, 0.28, 0.38, 1.0), Color(0.52, 0.78, 0.96, 1.0)))
	items.append(_make_entry(&"sun", "Sunbread", Vector2i(1, 1), Vector2i(3, 2), 1, Color(0.41, 0.31, 0.17, 1.0), Color(0.88, 0.74, 0.42, 1.0)))
	container.set("items", items)
	return container


func _build_stash_inventory() -> Resource:
	var container: Resource = CONTAINER_GRID_STATE_MODEL.new()
	container.set("container_id", &"stash")
	container.set("title", "Sanctum Vault")
	container.set("columns", 12)
	container.set("rows", 6)
	var items: Array[Resource] = []
	items.append(_make_entry(&"rch", "Rune Chalk", Vector2i(2, 2), Vector2i(0, 0), 1, Color(0.25, 0.26, 0.31, 1.0), Color(0.72, 0.74, 0.84, 1.0)))
	items.append(_make_entry(&"staff", "Ironwood Staff", Vector2i(1, 3), Vector2i(3, 0), 1, Color(0.25, 0.19, 0.13, 1.0), Color(0.76, 0.63, 0.41, 1.0)))
	items.append(_make_entry(&"res", "Amber Resin", Vector2i(2, 1), Vector2i(5, 0), 3, Color(0.39, 0.26, 0.14, 1.0), Color(0.94, 0.70, 0.34, 1.0)))
	items.append(_make_entry(&"ward", "Warding Charm", Vector2i(2, 1), Vector2i(0, 3), 1, Color(0.19, 0.31, 0.27, 1.0), Color(0.63, 0.86, 0.77, 1.0)))
	items.append(_make_entry(&"sil", "Silver Thread", Vector2i(1, 2), Vector2i(8, 1), 1, Color(0.33, 0.34, 0.38, 1.0), Color(0.86, 0.88, 0.93, 1.0)))
	items.append(_make_entry(&"vbl", "Void Bloom", Vector2i(1, 1), Vector2i(10, 0), 2, Color(0.20, 0.17, 0.27, 1.0), Color(0.69, 0.58, 0.88, 1.0)))
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
