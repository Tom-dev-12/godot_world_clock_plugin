# godot_world_clock_plugin
A world clock system for the Godot game engine which manages in game time
Please do let me know if you have any feedback, issues or questions about this plugin

Made in Godot 4.7.1

it is reccomended that you download this tool from the godot asset libary 

set up:
-Install plugin from the godot asset libary via this link https://godotengine.org/asset-library/asset/5566 or in the asset store in the godot game engine
-Once installed got to project -> project settings -> plugins
-Then find Wolrd Clock Manager and enable it 

Once installed:
-add the World Clock node into the scene
-adjust the time settings as you wish
-run the scene and then use the plugins signals and properties to intergrate into your game

Here is some example code of a very basic setup of what the plugin offers:

        extends Node
        
        @onready var clock = $WorldClock
        
        func _ready() -> void:
        	clock.hour_changed.connect(_on_hour_changed)
        	clock.day_changed.connect(_on_day_changed)
        	clock.season_changed.connect(_on_season_changed)
        
        	print("Clock test started")
        
        func _on_hour_changed(hour: int) -> void:
        	print("Hour changed: ", hour)
        
        func _on_day_changed(day: int) -> void:
        	print("Day changed: ", clock.days.keys()[day])
        
        func _on_season_changed(season: int) -> void:
        	print("Season changed: ", clock.seasons.keys()[season])

This plugin is currently in early development and has more features and improvements planned
And feel welcome to contribute to this plugin







