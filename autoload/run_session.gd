extends Node

const RUN_STATE_MODEL := preload("res://runtime/models/run_state.gd")

signal state_changed(state: Resource)

var _state: Resource = RUN_STATE_MODEL.new()


func get_state() -> Resource:
	return _state


func reset_for_bootstrap() -> void:
	_state = RUN_STATE_MODEL.new()
	state_changed.emit(_state)
