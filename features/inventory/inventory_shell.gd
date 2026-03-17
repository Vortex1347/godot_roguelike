class_name InventoryShell
extends Control

const BUNKER_ACTIONS := preload("res://features/bunker/bunker_actions.gd")
const TRANSFER_SERVICE_MODEL := preload("res://features/inventory/services/inventory_transfer_service.gd")
const INVENTORY_DRAG_PAYLOAD_MODEL := preload("res://runtime/models/inventory_drag_payload.gd")

signal open_state_changed(is_open: bool)

@onready var _title_label: Label = $Chrome/Margin/Layout/Header/TitleBlock/Title
@onready var _subtitle_label: Label = $Chrome/Margin/Layout/Header/TitleBlock/Subtitle
@onready var _status_label: Label = $Chrome/Margin/Layout/Header/Status
@onready var _stash_title_label: Label = $Chrome/Margin/Layout/Body/StashColumn/StashTitle
@onready var _inventory_title_label: Label = $Chrome/Margin/Layout/Body/InventoryColumn/InventoryTitle
@onready var _stash_grid = $Chrome/Margin/Layout/Body/StashColumn/StashGrid
@onready var _inventory_grid = $Chrome/Margin/Layout/Body/InventoryColumn/InventoryGrid
@onready var _hint_label: Label = $Chrome/Margin/Layout/Hint

var _transfer_service := TRANSFER_SERVICE_MODEL.new()
var _bunker_state: Resource = null
var _active_drag_payload: Resource = null


func _ready() -> void:
	hide()
	mouse_filter = Control.MOUSE_FILTER_IGNORE


func setup(session_state: Resource) -> void:
	_bunker_state = session_state
	if _bunker_state == null:
		return

	_stash_grid.bind(self, _bunker_state.get("stash_container"))
	_inventory_grid.bind(self, _bunker_state.get("inventory_container"))
	_refresh_shell()

	var is_inventory_open: bool = _bunker_state.get("is_inventory_open")
	if is_inventory_open:
		visible = true
		mouse_filter = Control.MOUSE_FILTER_STOP
	else:
		hide()
		mouse_filter = Control.MOUSE_FILTER_IGNORE


func open_shell(action_id: StringName = BUNKER_ACTIONS.OPEN_STASH) -> void:
	if _bunker_state == null:
		return

	_bunker_state.set("is_inventory_open", true)
	_bunker_state.set("active_panel_action", action_id)
	RunSession.set_bunker_inventory_open(true, action_id)
	visible = true
	mouse_filter = Control.MOUSE_FILTER_STOP
	_title_label.text = "Sanctum Vault"
	_subtitle_label.text = "Mage sanctum slice with live vault transfers."
	_status_label.text = "Drag relics and provisions between the vault and field satchel. Invalid placements are rejected."
	_hint_label.text = "I closes the shell. Drag with the left mouse button. E opens from the vault hotspot."
	_refresh_shell()
	open_state_changed.emit(true)


func close_shell() -> void:
	if _bunker_state == null:
		return

	_bunker_state.set("is_inventory_open", false)
	_bunker_state.set("active_panel_action", BUNKER_ACTIONS.NONE)
	RunSession.set_bunker_inventory_open(false)
	_active_drag_payload = null
	hide()
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	open_state_changed.emit(false)


func toggle_shell(action_id: StringName = BUNKER_ACTIONS.OPEN_INVENTORY) -> void:
	if is_open():
		close_shell()
	else:
		open_shell(action_id)


func is_open() -> bool:
	return visible


func pick_up_item(container_id: StringName, cell: Vector2i) -> Resource:
	var container: Resource = _resolve_container(container_id)
	if container == null:
		return null

	var payload: Resource = _transfer_service.pick_up_item(container, cell)
	if not _is_inventory_drag_payload(payload):
		return null

	_active_drag_payload = payload
	var entry: Resource = payload.get("entry")
	var stack_name: String = _stack_display_name(entry)
	if not stack_name.is_empty():
		_status_label.text = "Picked up %s." % stack_name
	return payload


func preview_placement(container_id: StringName, cell: Vector2i, payload_state: Variant) -> bool:
	var payload: Resource = payload_state
	if not _is_inventory_drag_payload(payload):
		return false

	var source_container_id: StringName = payload.get("source_container_id")
	var source_container: Resource = _resolve_container(source_container_id)
	var target_container: Resource = _resolve_container(container_id)
	if source_container == null or target_container == null:
		return false

	var preview: Resource = _transfer_service.preview_transfer(source_container, target_container, cell, payload)
	if preview == null:
		return false

	var is_success: bool = preview.get("success")
	return is_success


func drop_item(container_id: StringName, cell: Vector2i, payload_state: Variant) -> Resource:
	var payload: Resource = payload_state
	if not _is_inventory_drag_payload(payload):
		reject_invalid_placement(&"invalid_payload")
		return null

	var source_container_id: StringName = payload.get("source_container_id")
	var source_container: Resource = _resolve_container(source_container_id)
	var target_container: Resource = _resolve_container(container_id)
	if source_container == null or target_container == null:
		reject_invalid_placement(&"invalid_payload")
		return null

	var result: Resource = _transfer_service.move_item(source_container, target_container, cell, payload)
	_active_drag_payload = null
	if result == null:
		reject_invalid_placement(&"invalid_payload")
		return null

	var is_success: bool = result.get("success")
	if not is_success:
		var reason: StringName = result.get("reason")
		reject_invalid_placement(reason)
		return result

	var entry: Resource = result.get("entry")
	var stack_name: String = _stack_display_name(entry)
	var target_id: StringName = result.get("target_container_id")
	_status_label.text = "%s moved to %s." % [stack_name, _container_title_for_id(target_id)]
	_refresh_shell()
	return result


func reject_invalid_placement(reason: StringName) -> void:
	match reason:
		&"out_of_bounds":
			_status_label.text = "Rejected: item would exceed the grid boundary."
		&"occupied":
			_status_label.text = "Rejected: target cells are already occupied."
		&"missing_item":
			_status_label.text = "Rejected: source item is no longer available."
		_:
			_status_label.text = "Rejected: transfer payload is invalid."


func has_active_drag_payload() -> bool:
	return _active_drag_payload != null


func get_active_drag_payload() -> Resource:
	return _active_drag_payload


func _refresh_shell() -> void:
	if _bunker_state == null:
		return

	var stash_container: Resource = _bunker_state.get("stash_container")
	var inventory_container: Resource = _bunker_state.get("inventory_container")

	if stash_container != null:
		_stash_title_label.text = "%s  %dx%d" % [
			_container_title(stash_container),
			_container_columns(stash_container),
			_container_rows(stash_container),
		]
	if inventory_container != null:
		_inventory_title_label.text = "%s  %dx%d" % [
			_container_title(inventory_container),
			_container_columns(inventory_container),
			_container_rows(inventory_container),
		]

	_stash_grid.refresh()
	_inventory_grid.refresh()


func _resolve_container(container_id: StringName) -> Resource:
	if _bunker_state == null:
		return null

	var stash_container: Resource = _bunker_state.get("stash_container")
	if stash_container != null and _container_id(stash_container) == container_id:
		return stash_container

	var inventory_container: Resource = _bunker_state.get("inventory_container")
	if inventory_container != null and _container_id(inventory_container) == container_id:
		return inventory_container

	return null


func _container_title_for_id(container_id: StringName) -> String:
	var container: Resource = _resolve_container(container_id)
	if container == null:
		return "target grid"
	return _container_title(container)


func _container_id(container: Resource) -> StringName:
	var id: StringName = container.get("container_id")
	return id


func _container_title(container: Resource) -> String:
	var title: String = container.get("title")
	return title


func _container_columns(container: Resource) -> int:
	return int(container.get("columns"))


func _container_rows(container: Resource) -> int:
	return int(container.get("rows"))


func _stack_display_name(entry: Resource) -> String:
	if entry == null:
		return ""

	var stack: Resource = entry.get("stack")
	if stack == null:
		return ""

	var name: String = stack.get("display_name")
	return name


func _is_inventory_drag_payload(value: Resource) -> bool:
	if value == null:
		return false
	return value.get_script() == INVENTORY_DRAG_PAYLOAD_MODEL
