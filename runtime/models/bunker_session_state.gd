class_name BunkerSessionState
extends Resource

const CONTAINER_GRID_STATE_MODEL := preload("res://runtime/models/container_grid_state.gd")

@export var inventory_container: Resource = CONTAINER_GRID_STATE_MODEL.new()
@export var stash_container: Resource = CONTAINER_GRID_STATE_MODEL.new()
@export var active_panel_action: StringName = &""
@export var is_inventory_open: bool = false
@export var player_position: Vector2 = Vector2(480.0, 896.0)
@export var player_position_3d: Vector3 = Vector3(0.0, 0.75, 4.2)
