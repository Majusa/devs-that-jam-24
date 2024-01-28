extends Node2D

var main_menu : String = "Main_Menu"

func _on_texture_button_pressed():
	Global.setup_game()
	SceneHandlage.SwitchScene(main_menu)
