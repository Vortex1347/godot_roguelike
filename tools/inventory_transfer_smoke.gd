extends SceneTree

const INVENTORY_BOOTSTRAP_FACTORY_MODEL := preload("res://features/inventory/services/inventory_bootstrap_factory.gd")
const INVENTORY_TRANSFER_SERVICE_MODEL := preload("res://features/inventory/services/inventory_transfer_service.gd")


func _initialize() -> void:
	var factory = INVENTORY_BOOTSTRAP_FACTORY_MODEL.new()
	var transfer_service = INVENTORY_TRANSFER_SERVICE_MODEL.new()
	var bunker_state: Resource = factory.build_bunker_session_state()
	var inventory_container: Resource = bunker_state.get("inventory_container")
	var stash_container: Resource = bunker_state.get("stash_container")

	var payload: Resource = transfer_service.pick_up_item(stash_container, Vector2i(0, 0))
	assert(payload != null)

	var valid_result: Resource = transfer_service.move_item(stash_container, inventory_container, Vector2i(6, 3), payload)
	assert(valid_result != null)
	assert(bool(valid_result.get("success")))

	var invalid_payload: Resource = transfer_service.pick_up_item(inventory_container, Vector2i(6, 3))
	assert(invalid_payload != null)

	var invalid_result: Resource = transfer_service.move_item(inventory_container, inventory_container, Vector2i(4, 0), invalid_payload)
	assert(invalid_result != null)
	assert(not bool(invalid_result.get("success")))
	assert(StringName(invalid_result.get("reason")) == &"occupied")

	quit(0)
