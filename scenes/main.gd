extends Node

@onready var Globals : Node = $Global
@onready var GameStartTimer : Timer = $GameTimer
@onready var DelayTimer : Timer = $DelayTimer
@onready var MainMenu : Control = $MainMenu
@onready var TransitionHud : CanvasLayer = $TransitionHud


@onready var delay : float;


var level_instance : Node2D
var transition_scene : String = "res://scenes/game/transition_scene/transition_scene.tscn"

func _ready():
	TransitionHud.hide()
	#Global.win_level.connect(_on_win_signal_receive)
	#Global.lose_level.connect(_on_lose_signal_receive)
	#set_delay_timer()

#func set_delay_timer():
	#DelayTimer.one_shot = true
	#DelayTimer.autostart = true
	#DelayTimer.wait_time = 2.0
#
#func set_game_timer():
	#GameStartTimer.one_shot = true;
	#GameStartTimer.autostart = true;
	#GameStartTimer.wait_time = 10.0;
	
#func _on_lose_signal_receive():
	#print("level lost")
	#lose_level();
#
#func _on_win_signal_receive():
	#print("level won")
	#win_level();

#func increase_score():
	#Global.score += Global.score_win;
#
#func decrease_life():
	#if Global.lives > 0:
		#print("You lost a life buddy!")
		#Global.lives -= 1;
	#else:
		#game_over()
		#pass
	
#func game_over():
	## Trigger game over scene
	#SceneHandlage.SwitchScene("GameOver")
	## Game over scene should contain a scene change back to main and reset game 
	#pass
#
#func win_level():
	#Global.increase_score()
	## cause a wait timeout
	#SceneHandlage.SwitchScene(transition_scene)
	#pass
#
#func lose_level():
	#decrease_life()
	## cause a wait timeout
	#SceneHandlage.SwitchScene(transition_scene)	
	#pass
	
#func load_level(level_name : String):
	#unload_level()
	#var level_path = "res://scenes/game/levels/%s.tscn" % level_name
	#var level_resource = load(level_path)
#
#func unload_level():
	#if (is_instance_valid(level_instance)):
		#level_instance.queue_free()
	#level_instance = null



