extends Node


var score : int;
var levels : Array;
var total_levels: int;
var levels_completed : int;
var high_scores : Array;

@export var difficulty : int;
@export var lives : int;
@export var LevelScenes : Dictionary = {
	StringName("Main") : StringName("res://scenes/main.tscn"),
	StringName("MainMenu") : StringName("res://scenes/menu/main_menu.tscn"),
	StringName("TransitionScene") : StringName("res://scenes/game/transition_scene/transition_scene.tscn"),
	StringName("FightTheDrawer") : StringName("res://scenes/game/levels/fight_the_drawer/fight_the_drawer.tscn"),
	StringName("AccumulateTheFriendship") : StringName("res://scenes/game/levels/accumulate_the_friendship/accumulate_the_friendship.tscn"),
	StringName("ThrowThePoet") : StringName("res://scenes/game/levels/throw_the_poet/throw_the_poet.tscn")
}

var m_CurrentSceneAlias : String = ""

func _ready():
	lives = 4;
	difficulty = 0;
	score = 0;
	levels_completed = 0;
	
func set_difficulty():
	match levels_completed:
		0,1,2,3:
			difficulty = 0;
		4,5,6,7:
			difficulty = 1;
		8,9,10,11:
			difficulty = 2;

