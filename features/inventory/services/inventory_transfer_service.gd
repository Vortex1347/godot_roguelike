class_name InventoryTransferService
extends RefCounted

const DRAG_PAYLOAD_MODEL := preload("res://runtime/models/inventory_drag_payload.gd")
const TRANSFER_RESULT_MODEL := preload("res://runtime/models/inventory_transfer_result.gd")

const RESULT_OK: StringName = &"ok"
const RESULT_MISSING_ITEM: StringName = &"missing_item"
const RESULT_INVALID_PAYLOAD: StringName = &"invalid_payload"
const RESULT_OUT_OF_BOUNDS: StringName = &"out_of_bounds"
const RESULT_OCCUPIED: StringName = &"occupied"


func pick_up_item(container_state: Resource, cell: Vector2i) -> Resource:
	var container: Resource = container_state
	if container == null:
		return null

	var entry: Resource = _find_entry_by_cell(container, cell)
	if entry == null:
		return null

	var payload: Resource = DRAG_PAYLOAD_MODEL.new()
	payload.set("source_container_id", _container_id(container))
	payload.set("source_position", _entry_position(entry))
	payload.set("entry", entry)
	return payload


func preview_transfer(
	source_container_state: Resource,
	target_container_state: Resource,
	target_cell: Vector2i,
	payload_state: Resource
) -> Resource:
	var source_container: Resource = source_container_state
	var target_container: Resource = target_container_state
	var payload: Resource = payload_state
	if source_container == null or target_container == null or not _is_drag_payload(payload):
		return _build_result(false, RESULT_INVALID_PAYLOAD, &"", &"", Vector2i(-1, -1), null)

	var entry: Resource = payload.get("entry")
	if entry == null:
		return _build_result(false, RESULT_INVALID_PAYLOAD, _container_id(source_container), _container_id(target_container), target_cell, null)

	var ignored_entry: Resource = entry if source_container == target_container else null
	var rejection_reason: StringName = _find_rejection_reason(target_container, entry, target_cell, ignored_entry)
	if rejection_reason != &"":
		return _build_result(false, rejection_reason, _container_id(source_container), _container_id(target_container), target_cell, entry)

	return _build_result(true, RESULT_OK, _container_id(source_container), _container_id(target_container), target_cell, entry)


func move_item(
	source_container_state: Resource,
	target_container_state: Resource,
	target_cell: Vector2i,
	payload_state: Resource
) -> Resource:
	var source_container: Resource = source_container_state
	var target_container: Resource = target_container_state
	var payload: Resource = payload_state
	if source_container == null or target_container == null or not _is_drag_payload(payload):
		return _build_result(false, RESULT_INVALID_PAYLOAD, &"", &"", Vector2i(-1, -1), null)

	var source_position: Vector2i = payload.get("source_position")
	var entry: Resource = _find_entry_by_origin(source_container, source_position)
	if entry == null:
		return _build_result(false, RESULT_MISSING_ITEM, _container_id(source_container), _container_id(target_container), target_cell, null)

	var preview: Resource = preview_transfer(source_container, target_container, target_cell, payload)
	if preview == null:
		return _build_result(false, RESULT_INVALID_PAYLOAD, _container_id(source_container), _container_id(target_container), target_cell, null)

	var is_success: bool = preview.get("success")
	if not is_success:
		return preview

	if source_container != target_container:
		var source_items: Array = _container_items(source_container)
		source_items.erase(entry)
		source_container.set("items", source_items)

		var target_items: Array = _container_items(target_container)
		target_items.append(entry)
		target_container.set("items", target_items)

	entry.set("grid_position", target_cell)
	return _build_result(true, RESULT_OK, _container_id(source_container), _container_id(target_container), target_cell, entry)


func _find_rejection_reason(
	container: Resource,
	entry: Resource,
	target_cell: Vector2i,
	ignored_entry: Resource
) -> StringName:
	var stack: Resource = _entry_stack(entry)
	if stack == null:
		return RESULT_INVALID_PAYLOAD

	var footprint: Vector2i = _stack_footprint(stack)
	if target_cell.x < 0 or target_cell.y < 0:
		return RESULT_OUT_OF_BOUNDS

	if target_cell.x + footprint.x > _container_columns(container) or target_cell.y + footprint.y > _container_rows(container):
		return RESULT_OUT_OF_BOUNDS

	for raw_entry in _container_items(container):
		var other_entry: Resource = raw_entry
		if other_entry == null or other_entry == ignored_entry:
			continue

		var other_stack: Resource = _entry_stack(other_entry)
		if other_stack == null:
			continue

		if _rects_overlap(target_cell, footprint, _entry_position(other_entry), _stack_footprint(other_stack)):
			return RESULT_OCCUPIED

	return &""


func _find_entry_by_cell(container: Resource, cell: Vector2i) -> Resource:
	for raw_entry in _container_items(container):
		var entry: Resource = raw_entry
		if entry == null:
			continue

		var stack: Resource = _entry_stack(entry)
		if stack == null:
			continue

		var entry_position: Vector2i = _entry_position(entry)
		var footprint: Vector2i = _stack_footprint(stack)
		if cell.x >= entry_position.x \
		and cell.x < entry_position.x + footprint.x \
		and cell.y >= entry_position.y \
		and cell.y < entry_position.y + footprint.y:
			return entry

	return null


func _find_entry_by_origin(container: Resource, origin: Vector2i) -> Resource:
	for raw_entry in _container_items(container):
		var entry: Resource = raw_entry
		if entry == null:
			continue

		if _entry_position(entry) == origin:
			return entry

	return null


func _rects_overlap(a_position: Vector2i, a_size: Vector2i, b_position: Vector2i, b_size: Vector2i) -> bool:
	if a_position.x + a_size.x <= b_position.x:
		return false
	if b_position.x + b_size.x <= a_position.x:
		return false
	if a_position.y + a_size.y <= b_position.y:
		return false
	if b_position.y + b_size.y <= a_position.y:
		return false
	return true


func _build_result(
	success: bool,
	reason: StringName,
	source_container_id: StringName,
	target_container_id: StringName,
	placed_at: Vector2i,
	entry: Resource
) -> Resource:
	var result: Resource = TRANSFER_RESULT_MODEL.new()
	result.set("success", success)
	result.set("reason", reason)
	result.set("source_container_id", source_container_id)
	result.set("target_container_id", target_container_id)
	result.set("placed_at", placed_at)
	result.set("entry", entry)
	return result


func _is_drag_payload(value: Resource) -> bool:
	if value == null:
		return false
	return value.get_script() == DRAG_PAYLOAD_MODEL


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
	var position: Vector2i = entry.get("grid_position")
	return position


func _stack_footprint(stack: Resource) -> Vector2i:
	var footprint: Vector2i = stack.get("footprint")
	return footprint
