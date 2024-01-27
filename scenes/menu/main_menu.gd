extends Control

func _ready():
	pass

func _on_play_pressed():
	SceneHandlage.SwitchScene("TransitionScene")


func _on_quit_pressed():
	SceneHandlage.QuitGame()


func _on_test_random_pressed():
	SceneHandlage.PickScene(Global.LevelArray)
	pass # Replace with function body.
