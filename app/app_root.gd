extends Node


func _ready() -> void:
	RunSession.reset_for_bootstrap()
	AppRouter.go_to_bootstrap()

