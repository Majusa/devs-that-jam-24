extends Node2D

@onready var timer : Timer = Timer.new()
@onready var nextScene : String;

func _ready():
	add_child(timer)
	timer.one_shot = true
	timer.autostart = true
	timer.wait_time = 3.0
	timer.timeout.connect(_on_timer_timeout)
	timer.start()

func _on_timer_timeout():
	if Global.LevelArray.size() > 0 :
		nextScene = SceneHandlage.PickScene(Global.LevelArray)
	else:
		nextScene = "WinGame"
	SceneHandlage.SwitchScene(nextScene)
	
