extends Node

const SAVE_DIRECTORY := "user://saves"
const DEFAULT_SLOT_ID := "slot_001"


func get_default_save_path() -> String:
	return SAVE_DIRECTORY.path_join("%s.save" % DEFAULT_SLOT_ID)


func ensure_save_directory() -> void:
	DirAccess.make_dir_recursive_absolute(ProjectSettings.globalize_path(SAVE_DIRECTORY))
