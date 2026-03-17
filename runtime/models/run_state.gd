class_name RunState
extends Resource

const BUNKER_SESSION_STATE_MODEL := preload("res://runtime/models/bunker_session_state.gd")

@export var seed: int = 0
@export var active_map_id: StringName = &""
@export var is_in_raid: bool = false
@export var bunker_state: Resource = BUNKER_SESSION_STATE_MODEL.new()

