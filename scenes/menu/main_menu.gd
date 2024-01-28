extends Control

func _ready():
	pass

func _on_play_pressed():
	SceneHandlage.SwitchScene("Transition_Scene")


func _on_quit_pressed():
	SceneHandlage.QuitGame()


func _on_test_random_pressed():
	SceneHandlage.PickScene(Global.LevelArray)
	pass # Replace with function body.


func _on_play_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("Click"):
		SceneHandlage.SwitchScene("Transition_Scene")

func _on_quit_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("Click"):
		SceneHandlage.QuitGame()
	
