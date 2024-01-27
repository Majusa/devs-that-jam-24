extends Node

var score : int;
var score_increment: int = 100;
var levels : Array;
var total_levels: int;
var levels_completed : int;
var high_scores : Array;

@export var difficulty : int;
@export var lives : int;
@export var LevelScenes : Dictionary = {
	"Main" : "res://scenes/main.tscn",
	"MainMenu" : "res://scenes/menu/main_menu.tscn",
	"TransitionScene" : "res://scenes/game/transition_scene/transition_scene.tscn",
	"FightTheDrawer" : "res://scenes/game/levels/fight_the_drawer/fight_the_drawer.tscn",
	"AccumulateTheFriendship" : "res://scenes/game/levels/accumulate_the_friendship/accumulate_the_friendship.tscn",
	"ThrowThePoet" : "res://scenes/game/levels/throw_the_poet/throw_the_poet.tscn",
	"StealTheBird" : "res://scenes/game/levels/steal_the_bird/steal_the_bird.tscn",
	"StrokeTheInjury" : "res://scenes/game/levels/stroke_the_injury/stroke_the_injury.tscn",
}

@export var LevelArray : Array;

func _ready():
	setup_game();

func setup_game():
	lives = 4;
	score = 0;
	levels_completed = 0;
	difficulty = 0;
	set_level_array();
	
func set_level_array():
	LevelArray = [
	"ThrowThePoet",
	"StealTheBird",
	"StrokeTheInjury",
	"FightTheDrawer",
	"AccumulateTheFriendship"
	]

func increase_score():
	score += score_increment;

func increase_levels_completed():
	levels_completed += 1;

func set_difficulty():
	match levels_completed:
		0,1,2,3:
			difficulty = 0;
		4,5,6,7:
			difficulty = 1;
		8,9,10,11:
			difficulty = 2;


	
