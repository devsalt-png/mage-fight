extends Node

@onready var player_panel_manager: Node = %PlayerPanelManager


func _input(_event: InputEvent) -> void:
	if Input.is_action_pressed("Strike"):
		player_panel_manager._10_dmg()
	# THIS FUNCTION IS A TEST, DO NOT USE THIS IN THE GAME.
