class_name BunkerSlice3D
extends Node3D

const BUNKER_ACTIONS := preload("res://features/bunker/bunker_actions.gd")

@onready var _player = $Player
@onready var _prompt_panel: PanelContainer = $Ui/PromptPanel
@onready var _prompt_label: Label = $Ui/PromptPanel/Margin/PromptLabel
@onready var _status_panel: PanelContainer = $Ui/StatusPanel
@onready var _status_label: Label = $Ui/StatusPanel/Margin/StatusLabel
@onready var _status_timer: Timer = $Ui/StatusTimer
@onready var _inventory_shell = $Ui/InventoryShell

var _bunker_state: Resource = null
var _active_hotspot = null


func _ready() -> void:
	_bunker_state = RunSession.ensure_bunker_session_state()
	_inventory_shell.setup(_bunker_state)
	_inventory_shell.open_state_changed.connect(_on_inventory_open_state_changed)
	_status_timer.timeout.connect(_on_status_timeout)

	for child in $Hotspots.get_children():
		var hotspot = child
		if hotspot == null:
			continue

		hotspot.focus_entered.connect(_on_hotspot_focus_entered)
		hotspot.focus_exited.connect(_on_hotspot_focus_exited)

	var bunker_state: Resource = _bunker_state
	if bunker_state != null:
		var player_position: Vector3 = bunker_state.get("player_position_3d")
		_player.global_position = player_position

	_player.movement_enabled = not _inventory_shell.is_open()
	_refresh_prompt()
	_show_status("3D bunker benchmark ready. Inventory shell stayed live through the pivot.")


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("inventory"):
		_inventory_shell.toggle_shell(BUNKER_ACTIONS.OPEN_INVENTORY)
		get_viewport().set_input_as_handled()
		return

	if event.is_action_pressed("interact") and not _inventory_shell.is_open() and _active_hotspot != null:
		_activate_hotspot(_active_hotspot)
		get_viewport().set_input_as_handled()


func _activate_hotspot(hotspot) -> void:
	var action_id: StringName = hotspot.get("action_id")
	match action_id:
		BUNKER_ACTIONS.OPEN_STASH, BUNKER_ACTIONS.OPEN_INVENTORY:
			_inventory_shell.open_shell(action_id)
		BUNKER_ACTIONS.OPEN_TRADER:
			_show_status("Trader stall is blocked in as the next hub flow.")
		BUNKER_ACTIONS.OPEN_TASK_BOARD:
			_show_status("Task board remains a reserved 3D hotspot for the next pass.")
		_:
			_show_status("This bunker prop is not wired yet.")


func _on_hotspot_focus_entered(hotspot) -> void:
	_active_hotspot = hotspot
	_refresh_prompt()


func _on_hotspot_focus_exited(hotspot) -> void:
	if _active_hotspot == hotspot:
		_active_hotspot = null
	_refresh_prompt()


func _on_inventory_open_state_changed(is_open: bool) -> void:
	_player.movement_enabled = not is_open
	_refresh_prompt()


func _refresh_prompt() -> void:
	if _inventory_shell.is_open() or _active_hotspot == null:
		_prompt_panel.hide()
		return

	_prompt_panel.show()
	_prompt_label.text = "E / %s" % _active_hotspot.get("prompt_text")


func _show_status(text: String) -> void:
	_status_label.text = text
	_status_panel.show()
	_status_timer.start()


func _on_status_timeout() -> void:
	_status_panel.hide()
