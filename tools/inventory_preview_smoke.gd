extends SceneTree

const INVENTORY_BOOTSTRAP_FACTORY_MODEL := preload("res://features/inventory/services/inventory_bootstrap_factory.gd")
const INVENTORY_TRANSFER_SERVICE_MODEL := preload("res://features/inventory/services/inventory_transfer_service.gd")
const INVENTORY_GRID_VIEW_MODEL := preload("res://features/inventory/inventory_grid_view.gd")


func _init() -> void:
	var factory := INVENTORY_BOOTSTRAP_FACTORY_MODEL.new()
	var state: Resource = factory.build_bunker_session_state()
	var stash_container: Resource = state.get("stash_container")
	var transfer_service := INVENTORY_TRANSFER_SERVICE_MODEL.new()
	var payload: Resource = transfer_service.pick_up_item(stash_container, Vector2i(0, 0))
	if payload == null:
		push_error("Inventory preview smoke failed: payload is null.")
		quit(1)
		return

	var grid_view := INVENTORY_GRID_VIEW_MODEL.new()
	var preview: Control = grid_view._create_drag_preview(payload)
	if preview == null:
		push_error("Inventory preview smoke failed: preview is null.")
		quit(1)
		return

	if preview.get_child_count() != 2:
		push_error("Inventory preview smoke failed: expected 2 preview children.")
		quit(1)
		return

	var label := preview.get_child(1)
	if label == null or not (label is Label):
		push_error("Inventory preview smoke failed: label child missing.")
		quit(1)
		return

	if not label.has_theme_color_override("font_color"):
		push_error("Inventory preview smoke failed: label font override missing.")
		quit(1)
		return

	preview.free()
	grid_view.free()

	quit()
