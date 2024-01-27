extends Node2D
#TODO - fix animation state change 
var is_hover_injury = false
var is_stroking = false
var stroke_timer = 0.0
var is_playing_nod = false
var is_playing_shake = false
@export var victory_time = 3.0
@onready var anim_player = $Area2D/CollisionPolygon2D/InjuryBody/AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.get_last_mouse_velocity().length() > 400:
		#print("NOT STROKING")
		is_stroking = false
		if Input.is_action_pressed("Click") && is_hover_injury:

			_play_shake()
	elif  Input.get_last_mouse_velocity().length() == 0:
		#print("STOPPED")
		is_stroking = false
	else: 
		is_stroking = true
	if Input.is_action_pressed("Click") && is_stroking && is_hover_injury:
		print("Stroking")
		stroke_timer += delta
		print(stroke_timer)
		_play_nod()
	else:
		stroke_timer = 0
	if stroke_timer >= victory_time:
		print("you win")


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

