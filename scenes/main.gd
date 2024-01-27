extends Node

@onready var Globals : Node = $Global
@onready var GameStartTimer : Timer = $Timer
@onready var MainMenu : Control = $MainMenu

var level_instance : Node2D

func _ready():
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



