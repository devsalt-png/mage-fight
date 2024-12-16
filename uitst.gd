extends Node

@onready var player_panel_manager: Node = %PlayerPanelManager
@onready var display_player_name: Label = %DisplayPlayerName
@onready var enter_player_name: LineEdit = %EnterPlayerName

var username = " "

func _input(_event: InputEvent) -> void:
		if Input.is_action_pressed("Strike"):
			player_panel_manager.dmg_sent()


func _on_enter_player_name_text_changed(new_text: String) -> void:
	username = enter_player_name.text
	display_player_name.text = "Player " + str(username)
