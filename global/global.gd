extends Node

var score : int;
var score_increment: int = 100;
var levels : Array;
var total_levels: int;
var levels_completed : int;
var high_scores : Array;

var can_transition : bool;
var game_won : bool;
var game_lost : bool;

var transition_scene : String = "res://scenes/game/transition_scene/transition_scene.tscn"

signal win_level_signal;
signal lose_level_signal;

@onready var delay_timer : Timer = Timer.new()
@onready var delay_timer_length : float = 1.0;

@onready var game_start_timer : Timer = Timer.new()
@onready var game_start_timer_length : float = 10.0;

@export var difficulty : int;
@export var lives : int;
@export var LevelScenes : Dictionary = {
	# Logic Screens
	"Main" : "res://scenes/main.tscn",
	"Main_Menu" : "res://scenes/menu/main_menu.tscn",
	"Game_Over" : "res://scenes/game/game_over/game_over.tscn",
	"Win_Game" : "res://scenes/game/win_game/win_game.tscn",
	"Transition_Scene" : "res://scenes/game/transition_scene/transition_scene.tscn",
	# Levels innit
	"Fight_The_Drawer" : "res://scenes/game/levels/fight_the_drawer/fight_the_drawer.tscn",
	"Accumulate_The_Friendship" : "res://scenes/game/levels/accumulate_the_friendship/accumulate_the_friendship.tscn",
	"Throw_The_Poet" : "res://scenes/game/levels/throw_the_poet/throw_the_poet.tscn",
	"Steal_The_Bird" : "res://scenes/game/levels/steal_the_bird/steal_the_bird.tscn",
	"Stroke_The_Injury" : "res://scenes/game/levels/stroke_the_injury/stroke_the_injury.tscn",
	"Practice_The_Anxiety" : "res://scenes/game/levels/practice_the_anxiety/practice_the_anxiety.tscn",
	"Hide_The_Lady" : "res://scenes/game/levels/hide_the_lady/hide_the_lady.tscn",
	"Reveal_The_Village" : "res://scenes/game/levels/reveal_the_village/reveal_the_village.tscn",
	"Survive_The_Child" : "res://scenes/game/levels/survive_the_child/survive_the_child.tscn"
}

@export var LevelArray : Array;


func _ready():
	setup_game();
	win_level_signal.connect(_on_win_level_signal_received)
	lose_level_signal.connect(_on_lose_level_signal_received)

func setup_game():
	can_transition = true;
	game_won = false;
	game_lost = false;
	lives = 4;
	score = 0;
	levels_completed = 0;
	difficulty = 0;
	add_child(delay_timer)
	add_child(game_start_timer)
	set_level_array();
	set_delay_timer();
	set_game_timer();
	
func set_level_array():
	LevelArray = [
	"Throw_The_Poet",
	"Steal_The_Bird",
	"Stroke_The_Injury",
	"Accumulate_The_Friendship",
	"Practice_The_Anxiety",
	"Hide_The_Lady",
	"Reveal_The_Village",
	"Fight_The_Drawer",
	"Survive_The_Child"
	]

func increase_score():
	score += score_increment;

func decrease_life():
	if lives > 0:
		print("GLOBAL: Lost a life")
		lives -= 1;
		print("GLOBAL: Lives remaining: ", lives)
	else:
		print("GLOBAL: No lives remaining ")
		game_lost = true;
		print("GLOBAL: Game_Lost bool is: ", game_lost)		

func increase_levels_completed():
	levels_completed += 1;

func set_delay_timer():
	delay_timer.one_shot = true
	delay_timer.wait_time = delay_timer_length
	delay_timer.timeout.connect(_on_delay_timer_timeout)

func set_game_timer():
	game_start_timer.one_shot = true;
	game_start_timer.wait_time = game_start_timer_length;
	#game_start_timer.timeout.connect(_on_game_start_timer_timeout)

func _on_delay_timer_timeout():
	print("GLOBAL: Delay timer timed out")
	increase_levels_completed()
	print("GLOBAL: Games Played: ", levels_completed)
	check_levels_left()
	if game_lost == false:
		print("GLOBAL: GAME NOT LOST _on_delay_timer: is switching scene")
		SceneHandlage.SwitchScene("Transition_Scene");
	elif game_won == false:
		print("GLOBAL: GAME NOT WON _on_delay_timer: is switching scene")
		SceneHandlage.SwitchScene("Transition_Scene");
	else:	
		print("GLOBAL: _on_delay_timer: game has been won or lost, no more transitions")
		pass;
	
	
#func _on_game_start_timer_timeout():
	## when timer runs out, run lose condition
	#pass

func _on_win_level_signal_received():
	print("GLOBAL: level won signal received")
	set_game_timer()
	win_level();
	
	
func _on_lose_level_signal_received():
	print("GLOBAL: level lost signal received")
	set_game_timer()
	lose_level();

func win_level():
	print("GLOBAL: win_level() triggered")
	increase_score()
	# cause a wait timeout
	check_state()
	print("Timer starting....")
	#delay_timer.start()
		
func lose_level():
	print("GLOBAL: level_lost() triggered")
	decrease_life()
	check_state()
	#TODO cause a wait timeout
	#delay_timer.start()

func game_over():
	print("GLOBAL: game_over() triggered")
	SceneHandlage.SwitchScene("Game_Over")
	#TODO Game over scene should display the score,contain a scene 
	# change button back to main menu and reset game if clicked

func win_game():
	print("GLOBAL: Game won, switching scene..")
	game_won = true;
	SceneHandlage.SwitchScene("Win_Game")

func check_state():
	print("GLOBAL: check_state() triggered")
	print("GLOBAL: Lives as per check state: ", lives)
	if lives == 0:
		print("GLOBAL: check_state() setting game_LOST to true and triggering game over")
		delay_timer.stop()
		game_lost = true;
		print("GLOBAL: game_lost state is: ", game_lost)
		game_over()
	elif Global.LevelArray.size() == 0:
		print("GLOBAL: check_state() setting game_WON to true and triggering game over")
		delay_timer.stop()
		game_won = true;
		win_game()
	elif lives > 0 && can_transition == true:
		delay_timer.start()
		print("GLOBAL: Keep on keepin on bud, you got this!")
	else:	
		print("GLOBAL: Wait, how did you get here?! Imposter, get out! Check your checking loop!")
		

func check_levels_left():
	var levels_left = Global.LevelArray.size()
	print("GLOBAL: Levels Left: ", levels_left)
#func set_difficulty():
	#match levels_completed:
		#0,1,2,3:
			#difficulty = 0;
		#4,5,6,7:
			#difficulty = 1;
		#8,9,10,11:
			#difficulty = 2;
