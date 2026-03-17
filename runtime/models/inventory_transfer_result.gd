class_name InventoryTransferResult
extends Resource

const CONTAINER_ITEM_STATE_MODEL := preload("res://runtime/models/container_item_state.gd")

@export var success: bool = false
@export var reason: StringName = &""
@export var source_container_id: StringName = &""
@export var target_container_id: StringName = &""
@export var placed_at: Vector2i = Vector2i(-1, -1)
@export var entry: Resource = CONTAINER_ITEM_STATE_MODEL.new()

