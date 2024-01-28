extends Node

@onready var Globals : Node = $Global
@onready var GameStartTimer : Timer = $GameTimer
@onready var DelayTimer : Timer = $DelayTimer
@onready var MainMenu : Control = $MainMenu
@onready var TransitionHud : CanvasLayer = $TransitionHud

var level_instance : Node2D

func _ready():
	TransitionHud.hide()
	DelayTimer.one_shot = true
	DelayTimer.autostart = true
	DelayTimer.wait_time = 2.0
	

func _on_timer_signal_receive():
	pass

func _on_win_signal_receive():
	# Take remaining hearts and 
	pass

func increase_score():
	Global.score += Global.score_win;

func decrease_life():
	if Global.lives > 0:
		Global.lives -= 1;
	else:
		game_over()
		pass
	
func game_over():
	# Trigger game over scene
	# Game over scene should contain a scene change back to main and reset all arrays 
	pass

func win_level():
	# increment score
	Global.increase_score()
	# cause a wait timeout
	# load transition scene
	SceneHandlage.SwitchScene(SceneHandlage.PickScene(Global.LevelArray))
	pass

func lose_level():
	decrease_life()
	# cause a wait timeout
	
	pass
	
#func load_level(level_name : String):
	#unload_level()
	#var level_path = "res://scenes/game/levels/%s.tscn" % level_name
	#var level_resource = load(level_path)
#
#func unload_level():
	#if (is_instance_valid(level_instance)):
		#level_instance.queue_free()
	#level_instance = null



