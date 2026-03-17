class_name BunkerHotspot
extends Area2D

signal focus_entered(hotspot)
signal focus_exited(hotspot)

@export var action_id: StringName = &""
@export var prompt_text: String = "Interact"
@export var status_text: String = ""
@export var is_functional := false


func _ready() -> void:
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)


func _on_body_entered(body: Node) -> void:
	if body is CharacterBody2D:
		focus_entered.emit(self)


func _on_body_exited(body: Node) -> void:
	if body is CharacterBody2D:
		focus_exited.emit(self)
