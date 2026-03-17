class_name BunkerPlayer3D
extends CharacterBody3D

@export var move_speed := 7.5

@onready var _visual_pivot: Node3D = $VisualPivot

var movement_enabled := true
var _last_facing := Vector3(0.0, 0.0, -1.0)


func _physics_process(_delta: float) -> void:
	var input_vector := Vector2.ZERO
	if movement_enabled:
		input_vector = Input.get_vector("move_left", "move_right", "move_up", "move_down")

	var move_direction := Vector3(input_vector.x, 0.0, input_vector.y)
	if move_direction.length_squared() > 0.001:
		move_direction = move_direction.normalized()
		_last_facing = move_direction

	velocity.x = move_direction.x * move_speed
	velocity.z = move_direction.z * move_speed
	velocity.y = 0.0
	move_and_slide()
	_update_facing()
	RunSession.set_bunker_player_position_3d(global_position)


func _process(_delta: float) -> void:
	_update_facing()


func _update_facing() -> void:
	if _last_facing.length_squared() <= 0.001:
		return

	_visual_pivot.look_at(global_position + _last_facing, Vector3.UP)
