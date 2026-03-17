extends Node

signal screen_changed(screen: AppScreen)

enum AppScreen {
	BOOTSTRAP,
	BUNKER,
}

var _current_screen: AppScreen = AppScreen.BOOTSTRAP


func get_current_screen() -> AppScreen:
	return _current_screen


func go_to_bootstrap() -> void:
	_set_screen(AppScreen.BOOTSTRAP)


func go_to_bunker() -> void:
	_set_screen(AppScreen.BUNKER)


func _set_screen(screen: AppScreen) -> void:
	if _current_screen == screen:
		return

	_current_screen = screen
	screen_changed.emit(screen)
