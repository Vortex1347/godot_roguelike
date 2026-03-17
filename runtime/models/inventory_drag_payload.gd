class_name InventoryDragPayload
extends Resource

const CONTAINER_ITEM_STATE_MODEL := preload("res://runtime/models/container_item_state.gd")

@export var source_container_id: StringName = &""
@export var source_position: Vector2i = Vector2i.ZERO
@export var entry: Resource = CONTAINER_ITEM_STATE_MODEL.new()

