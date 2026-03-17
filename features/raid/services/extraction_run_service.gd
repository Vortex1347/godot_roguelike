class_name ExtractionRunService
extends RefCounted


func create_bootstrap_seed() -> int:
	return Time.get_unix_time_from_system()
