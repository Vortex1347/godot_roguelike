class_name InventoryGridView
extends Control

const INVALID_CELL := Vector2i(-1, -1)
const INVENTORY_DRAG_PAYLOAD_MODEL := preload("res://runtime/models/inventory_drag_payload.gd")

@export var slot_size: int = 48

var container_state: Resource = null
var inventory_shell: Node = null
var _hover_cell: Vector2i = INVALID_CELL
var _preview_cell: Vector2i = INVALID_CELL
var _preview_valid := false


func bind(shell: Node, state: Resource) -> void:
	inventory_shell = shell
	container_state = state
	refresh()


func refresh() -> void:
	if container_state == null:
		custom_minimum_size = Vector2.ZERO
		queue_redraw()
		return

	custom_minimum_size = Vector2(_container_columns(container_state) * slot_size, _container_rows(container_state) * slot_size)
	size = custom_minimum_size
	queue_redraw()


func _get_drag_data(at_position: Vector2) -> Variant:
	if container_state == null or inventory_shell == null:
		return null

	var cell: Vector2i = _local_to_cell(at_position)
	if cell == INVALID_CELL:
		return null

	var payload: Resource = inventory_shell.pick_up_item(_container_id(container_state), cell)
	if payload == null:
		return null

	var preview: Control = _create_drag_preview(payload)
	if preview != null:
		set_drag_preview(preview)

	return payload


func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	if container_state == null or inventory_shell == null:
		return false

	var cell: Vector2i = _local_to_cell(at_position)
	_preview_cell = cell
	_preview_valid = inventory_shell.preview_placement(_container_id(container_state), cell, data)
	queue_redraw()
	return _preview_valid


func _drop_data(at_position: Vector2, data: Variant) -> void:
	if container_state == null or inventory_shell == null:
		return

	var cell: Vector2i = _local_to_cell(at_position)
	inventory_shell.drop_item(_container_id(container_state), cell, data)
	_clear_drop_preview()


func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		_hover_cell = _local_to_cell(event.position)
		queue_redraw()


func _notification(what: int) -> void:
	if what == NOTIFICATION_MOUSE_EXIT:
		_hover_cell = INVALID_CELL
		queue_redraw()
	elif what == NOTIFICATION_DRAG_END:
		_clear_drop_preview()


func _draw() -> void:
	if container_state == null:
		return

	_draw_grid(container_state)
	_draw_items(container_state)
	_draw_preview_overlay()


func _draw_grid(container: Resource) -> void:
	var background_rect := Rect2(Vector2.ZERO, custom_minimum_size)
	draw_rect(background_rect, Color(0.08, 0.10, 0.11, 0.92), true)
	draw_rect(background_rect, Color(0.30, 0.34, 0.31, 1.0), false, 2.0)

	var rows: int = _container_rows(container)
	var columns: int = _container_columns(container)
	for row in range(rows):
		for column in range(columns):
			var cell_rect := Rect2(
				Vector2(column * slot_size + 2, row * slot_size + 2),
				Vector2(slot_size - 4, slot_size - 4)
			)
			var fill := Color(0.11, 0.13, 0.14, 0.94)
			if _hover_cell == Vector2i(column, row) and not get_viewport().gui_is_dragging():
				fill = Color(0.17, 0.20, 0.19, 0.98)
			draw_rect(cell_rect, fill, true)
			draw_rect(cell_rect, Color(0.22, 0.26, 0.24, 1.0), false, 1.0)


func _draw_items(container: Resource) -> void:
	var font: Font = ThemeDB.fallback_font
	for raw_entry in _container_items(container):
		var entry: Resource = raw_entry
		if entry == null:
			continue

		var stack: Resource = _entry_stack(entry)
		if stack == null:
			continue

		var entry_position: Vector2i = _entry_position(entry)
		var footprint: Vector2i = _stack_footprint(stack)
		var item_rect := Rect2(
			Vector2(entry_position.x * slot_size + 4, entry_position.y * slot_size + 4),
			Vector2(footprint.x * slot_size - 8, footprint.y * slot_size - 8)
		)
		draw_rect(item_rect, _stack_tint(stack), true)
		draw_rect(item_rect, _stack_accent(stack), false, 2.0)

		if font != null:
			var label_text: String = _stack_short_label(stack)
			draw_string(font, item_rect.position + Vector2(8, 18), label_text, HORIZONTAL_ALIGNMENT_LEFT, -1.0, 14, Color(0.95, 0.96, 0.90, 1.0))
			var quantity: int = _stack_quantity(stack)
			if quantity > 1:
				draw_string(font, item_rect.position + Vector2(item_rect.size.x - 20, item_rect.size.y - 8), str(quantity), HORIZONTAL_ALIGNMENT_LEFT, -1.0, 13, Color(0.90, 0.84, 0.62, 1.0))


func _draw_preview_overlay() -> void:
	if _preview_cell == INVALID_CELL or inventory_shell == null or not inventory_shell.has_active_drag_payload():
		return

	var payload: Resource = inventory_shell.get_active_drag_payload()
	if not _is_inventory_drag_payload(payload):
		return

	var entry: Resource = payload.get("entry")
	if entry == null:
		return

	var stack: Resource = _entry_stack(entry)
	if stack == null:
		return

	var footprint: Vector2i = _stack_footprint(stack)
	var preview_rect := Rect2(
		Vector2(_preview_cell.x * slot_size + 4, _preview_cell.y * slot_size + 4),
		Vector2(footprint.x * slot_size - 8, footprint.y * slot_size - 8)
	)
	var fill := Color(0.34, 0.54, 0.32, 0.34) if _preview_valid else Color(0.70, 0.25, 0.20, 0.34)
	var outline := Color(0.62, 0.84, 0.55, 0.95) if _preview_valid else Color(0.92, 0.48, 0.40, 0.95)
	draw_rect(preview_rect, fill, true)
	draw_rect(preview_rect, outline, false, 2.0)


func _local_to_cell(at_position: Vector2) -> Vector2i:
	if container_state == null:
		return INVALID_CELL

	var cell := Vector2i(floori(at_position.x / slot_size), floori(at_position.y / slot_size))
	if cell.x < 0 or cell.y < 0 or cell.x >= _container_columns(container_state) or cell.y >= _container_rows(container_state):
		return INVALID_CELL

	return cell


func _clear_drop_preview() -> void:
	_preview_cell = INVALID_CELL
	_preview_valid = false
	queue_redraw()


func _create_drag_preview(payload_state: Resource) -> Control:
	if not _is_inventory_drag_payload(payload_state):
		return null

	var entry: Resource = payload_state.get("entry")
	if entry == null:
		return null

	var stack: Resource = _entry_stack(entry)
	if stack == null:
		return null

	var footprint: Vector2i = _stack_footprint(stack)
	var preview := PanelContainer.new()
	preview.custom_minimum_size = Vector2(footprint.x * slot_size - 8, footprint.y * slot_size - 8)
	preview.self_modulate = Color(1, 1, 1, 0.92)

	var color_rect := ColorRect.new()
	color_rect.color = _stack_tint(stack)
	color_rect.custom_minimum_size = preview.custom_minimum_size
	preview.add_child(color_rect)

	var label := Label.new()
	label.text = _stack_short_label(stack)
	label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	label.anchors_preset = PRESET_FULL_RECT
	label.theme_override_colors.font_color = Color(0.95, 0.96, 0.90, 1.0)
	preview.add_child(label)
	return preview


func _container_id(container: Resource) -> StringName:
	var container_id: StringName = container.get("container_id")
	return container_id


func _container_columns(container: Resource) -> int:
	return int(container.get("columns"))


func _container_rows(container: Resource) -> int:
	return int(container.get("rows"))


func _container_items(container: Resource) -> Array:
	return container.get("items")


func _entry_stack(entry: Resource) -> Resource:
	var stack: Resource = entry.get("stack")
	return stack


func _entry_position(entry: Resource) -> Vector2i:
	var grid_position: Vector2i = entry.get("grid_position")
	return grid_position


func _stack_footprint(stack: Resource) -> Vector2i:
	var footprint: Vector2i = stack.get("footprint")
	return footprint


func _stack_tint(stack: Resource) -> Color:
	var tint: Color = stack.get("tint")
	return tint


func _stack_accent(stack: Resource) -> Color:
	var accent: Color = stack.get("accent")
	return accent


func _stack_quantity(stack: Resource) -> int:
	return int(stack.get("quantity"))


func _stack_short_label(stack: Resource) -> String:
	var short_label: String = stack.get("short_label")
	if not short_label.is_empty():
		return short_label

	var display_name: String = stack.get("display_name")
	return display_name.substr(0, mini(3, display_name.length())).to_upper()


func _is_inventory_drag_payload(value: Resource) -> bool:
	if value == null:
		return false
	return value.get_script() == INVENTORY_DRAG_PAYLOAD_MODEL
