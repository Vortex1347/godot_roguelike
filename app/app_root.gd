extends Node

const BOOTSTRAP_SCREEN_SCENE := preload("res://app/bootstrap_screen.tscn")
const BUNKER_SLICE_3D_SCENE := preload("res://features/bunker/bunker_slice_3d.tscn")

@onready var _world_root: Node = $WorldRoot

var _active_screen: Node = null


func _ready() -> void:
	AppRouter.screen_changed.connect(_on_screen_changed)
	RunSession.reset_for_bootstrap()
	RunSession.ensure_bunker_session_state()
	AppRouter.go_to_bunker()


func _on_screen_changed(screen: AppRouter.AppScreen) -> void:
	if is_instance_valid(_active_screen):
		_active_screen.queue_free()
		_active_screen = null

	match screen:
		AppRouter.AppScreen.BOOTSTRAP:
			_active_screen = BOOTSTRAP_SCREEN_SCENE.instantiate()
		AppRouter.AppScreen.BUNKER:
			_active_screen = BUNKER_SLICE_3D_SCENE.instantiate()

	if _active_screen != null:
		_world_root.add_child(_active_screen)
