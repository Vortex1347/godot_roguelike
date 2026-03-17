extends Node

const RUN_STATE_MODEL := preload("res://runtime/models/run_state.gd")
const INVENTORY_BOOTSTRAP_FACTORY_MODEL := preload("res://features/inventory/services/inventory_bootstrap_factory.gd")
const BUNKER_SESSION_STATE_MODEL := preload("res://runtime/models/bunker_session_state.gd")

signal state_changed(state: Resource)

var _state: Resource = RUN_STATE_MODEL.new()
var _inventory_bootstrap_factory := INVENTORY_BOOTSTRAP_FACTORY_MODEL.new()


func get_state() -> Resource:
	return _state


func reset_for_bootstrap() -> void:
	_state = RUN_STATE_MODEL.new()
	_state.set("bunker_state", _inventory_bootstrap_factory.build_bunker_session_state())
	state_changed.emit(_state)


func ensure_bunker_session_state() -> Resource:
	var bunker_state: Resource = _state.get("bunker_state")
	if bunker_state == null or bunker_state.get_script() != BUNKER_SESSION_STATE_MODEL:
		_state.set("bunker_state", _inventory_bootstrap_factory.build_bunker_session_state())
		bunker_state = _state.get("bunker_state")

	return bunker_state


func set_bunker_inventory_open(is_open: bool, action_id: StringName = &"") -> void:
	var bunker_state: Resource = ensure_bunker_session_state()
	if bunker_state == null:
		return

	bunker_state.set("is_inventory_open", is_open)
	bunker_state.set("active_panel_action", action_id if is_open else &"")


func set_bunker_player_position(player_position: Vector2) -> void:
	var bunker_state: Resource = ensure_bunker_session_state()
	if bunker_state == null:
		return

	bunker_state.set("player_position", player_position)


func get_bunker_player_position() -> Vector2:
	var bunker_state: Resource = ensure_bunker_session_state()
	if bunker_state == null:
		return Vector2.ZERO

	var player_position: Vector2 = bunker_state.get("player_position")
	return player_position


func set_bunker_player_position_3d(player_position: Vector3) -> void:
	var bunker_state: Resource = ensure_bunker_session_state()
	if bunker_state == null:
		return

	bunker_state.set("player_position_3d", player_position)


func get_bunker_player_position_3d() -> Vector3:
	var bunker_state: Resource = ensure_bunker_session_state()
	if bunker_state == null:
		return Vector3.ZERO

	var player_position: Vector3 = bunker_state.get("player_position_3d")
	return player_position
