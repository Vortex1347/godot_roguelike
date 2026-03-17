class_name ContainerItemState
extends Resource

const ITEM_STACK_STATE_MODEL := preload("res://runtime/models/item_stack_state.gd")

@export var stack: Resource = ITEM_STACK_STATE_MODEL.new()
@export var grid_position: Vector2i = Vector2i.ZERO

