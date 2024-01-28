extends Node

var score : int;
var score_increment: int = 100;
var levels : Array;
var total_levels: int;
var levels_completed : int;
var high_scores : Array;

var delay_timer : Timer = Timer.new()
var delay_timer_length : float = 1.0;

var game_start_timer : Timer = Timer.new()
var game_start_timer_length : float = 10.0;

var transition_scene : String = "res://scenes/game/transition_scene/transition_scene.tscn"

signal win_level_signal;
signal lose_level_signal;

@export var difficulty : int;
@export var lives : int;
@export var LevelScenes : Dictionary = {
	# Logic Screens
	"Main" : "res://scenes/main.tscn",
	"MainMenu" : "res://scenes/menu/main_menu.tscn",
	"GameOver" : "res://scenes/game/game_over/game_over.tscn",
	"WinGame" : "res://scenes/game/win_game/win_game.tscn",
	# Levels innit
	"TransitionScene" : "res://scenes/game/transition_scene/transition_scene.tscn",
	"FightTheDrawer" : "res://scenes/game/levels/fight_the_drawer/fight_the_drawer.tscn",
	#"AccumulateTheFriendship" : "res://scenes/game/levels/accumulate_the_friendship/accumulate_the_friendship.tscn",
	"ThrowThePoet" : "res://scenes/game/levels/throw_the_poet/throw_the_poet.tscn",
	"StealTheBird" : "res://scenes/game/levels/steal_the_bird/steal_the_bird.tscn",
	"StrokeTheInjury" : "res://scenes/game/levels/stroke_the_injury/stroke_the_injury.tscn",
	"PracticeTheAnxiety" : "res://scenes/game/levels/practice_the_anxiety/practice_the_anxiety.tscn",
	"HideTheLady" : "res://scenes/game/levels/hide_the_lady/hide_the_lady.tscn",
	"RevealTheVillage" : "res://scenes/game/levels/reveal_the_village/reveal_the_village.tscn",

}

@export var LevelArray : Array;


func _ready():
	setup_game();
	win_level_signal.connect(_on_win_level_signal_received)
	lose_level_signal.connect(_on_lose_level_signal_received)

func setup_game():
	lives = 4;
	score = 0;
	levels_completed = 0;
	difficulty = 0;
	set_level_array();
	set_delay_timer();
	set_game_timer();
	
func set_level_array():
	LevelArray = [
	"ThrowThePoet",
	"StealTheBird",
	"StrokeTheInjury",
	"FightTheDrawer",
	#"AccumulateTheFriendship",
	"PracticeTheAnxiety",
	"HideTheLady",
	"RevealTheVillage"
	]

func increase_score():
	score += score_increment;

func decrease_life():
	if lives > 0:
		print("You lost a life buddy!")
		lives -= 1;
	else:
		game_over()

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

func set_delay_timer():
	delay_timer.one_shot = true
	delay_timer.autostart = true
	delay_timer.wait_time = delay_timer_length
	delay_timer.timeout.connect(_on_delay_timer_timeout)

func set_game_timer():
	game_start_timer.one_shot = true;
	game_start_timer.autostart = true;
	game_start_timer.wait_time = game_start_timer_length;
	#game_start_timer.timeout.connect(_on_game_start_timer_timeout)

func _on_delay_timer_timeout():
	SceneHandlage.SwitchScene("TransitionScene");
	
#func _on_game_start_timer_timeout():
	## when timer runs out, run lose condition
	#pass

func _on_win_level_signal_received():
	print("level won!")
	set_delay_timer()
	set_game_timer()
	win_level();
	
	
func _on_lose_level_signal_received():
	print("level lost!")
	set_delay_timer()
	set_game_timer()
	lose_level();

func win_level():
	print("level won! (win_level)")
	increase_score()
	# cause a wait timeout
	check_state()
	delay_timer.start()

func win_game():
	print("well done kant")
	SceneHandlage.SwitchScene("WinGame")

		
func lose_level():
	print("level lost")
	check_state()
	decrease_life()
	check_state()
	#TODO cause a wait timeout
	delay_timer.start()

func game_over():
	SceneHandlage.SwitchScene("GameOver")
	#TODO Game over scene should display the score,contain a scene 
	# change button back to main menu and reset game if clicked

func check_state():
	if LevelArray.size() == 0:
		win_game()
	elif lives == 0:
		game_over()
	elif lives > 0 && LevelArray.size() >0:
		print("Keep on keepin on bud, you got this!")
	else:	
		print("Wait, how did you get here?! Imposter, get out! Check your checking loop!")
		
		
