@tool
extends EditorPlugin

const AUTOLOAD_NAME = "WorldClock"
const AUTOLOAD_PATH = "res://addons/world_clock/src/clock_ticker.gd"

func _enable_plugin() -> void:
	add_autoload_singleton(AUTOLOAD_NAME, AUTOLOAD_PATH)
	pass


func _disable_plugin() -> void:
	remove_autoload_singleton(AUTOLOAD_NAME)
	pass


func _enter_tree() -> void:
	# Initialization of the plugin goes here.
	pass


func _exit_tree() -> void:
	# Clean-up of the plugin goes here.
	pass
