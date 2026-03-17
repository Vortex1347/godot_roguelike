class_name BunkerPlayer
extends CharacterBody2D

@export var move_speed := 260.0

@onready var _weapon_pivot: Node2D = $WeaponPivot

var movement_enabled := true
var _last_facing := Vector2.RIGHT


func _physics_process(_delta: float) -> void:
	var input_vector := Vector2.ZERO
	if movement_enabled:
		input_vector = Input.get_vector("move_left", "move_right", "move_up", "move_down")

	velocity = input_vector * move_speed
	move_and_slide()
	RunSession.set_bunker_player_position(global_position)


func _process(_delta: float) -> void:
	var look_vector := get_global_mouse_position() - global_position
	if look_vector.length_squared() > 0.001:
		_last_facing = look_vector.normalized()

	_weapon_pivot.rotation = _last_facing.angle()

