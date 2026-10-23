@tool
extends EditorPlugin

const CLOCK_SCRIPT = preload(
    "res://addons/world_clock/src/clock_ticker.gd"
)
const CLOCK_ICON = preload("res://addons/world_clock/icon/world_clock_icon.svg")

func _enter_tree() -> void:
	add_custom_type("WorldClock", "Node", CLOCK_SCRIPT, CLOCK_ICON)

func _exit_tree() -> void:
	remove_custom_type("WorldClock")
