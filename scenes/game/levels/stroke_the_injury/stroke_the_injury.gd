extends Node2D
#TODO - fix animation state change 
var is_hover_injury = false
var is_stroking = false
var stroke_timer = 0.0
var is_playing_nod = false
var is_playing_shake = false
var level_won_check = false;
var max_stroke_speed = 800;
var min_stroke_speed = 0;
@export var victory_time = 3.0
@onready var anim_player = $Area2D/CollisionPolygon2D/InjuryBody/AnimationPlayer
@onready var stroke = $Stroke
@onready var toohard = $TooHard
var can_play_stroke = true
var can_play_toohard = true

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.game_start_timer.timeout.connect(_on_game_timer_timeout)
	print("TIME LEFT: ", Global.game_start_timer.time_left)	
	Global.game_start_timer.start()
	print("INJURY : Game timer Started")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print(Global.game_start_timer.time_left)
	if Input.get_last_mouse_velocity().length() > max_stroke_speed:
		#print("NOT STROKING")
		is_stroking = false
		if Input.is_action_pressed("Click") && is_hover_injury:
			_play_shake()
			if can_play_toohard:
				can_play_toohard = false
				toohard.play()
	elif  Input.get_last_mouse_velocity().length() == min_stroke_speed:
		#print("STOPPED")
		is_stroking = false
	else: 
		is_stroking = true
	if Input.is_action_pressed("Click") && is_stroking && is_hover_injury:
		print("Stroking")
		stroke_timer += delta
		print(stroke_timer)
		_play_nod()
		if can_play_stroke:
			can_play_stroke = false
			stroke.play()
	else:
		stroke_timer = 0
	if stroke_timer >= victory_time && level_won_check == false:
		level_won_check = true;
		print("you win")
		#print(Global.win_level_signal.get_connections())
		Global.win_level_signal.emit()


func _on_area_2d_mouse_entered():
	is_hover_injury = true
	print("hover")


func _on_area_2d_mouse_exited():
	print("stop hover")
	is_hover_injury = false
	
func _play_shake():
	if is_playing_shake == false:
		is_playing_shake = true
		anim_player.speed_scale = 10
		anim_player.play("Shake")

func _play_nod():
	if is_playing_nod == false:
		is_playing_nod = true
		anim_player.speed_scale = 1
		anim_player.play("Nod")


func _on_animation_player_animation_finished(anim_name):
	is_playing_nod = false
	is_playing_shake = false

func _on_game_timer_timeout():
	print("The mummy was not happy with your services...")
	Global.lose_level_signal.emit()


func _on_stroke_finished():
	can_play_stroke = true


func _on_too_hard_finished():
	can_play_toohard = true
