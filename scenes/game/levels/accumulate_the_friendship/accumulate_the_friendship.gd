extends Node2D

@onready var man1 = $StaticBody2D
@onready var man2 = $StaticBody2D2
@onready var man3 = $StaticBody2D3
@onready var man4 = $StaticBody2D4
@onready var man5 = $StaticBody2D5
@onready var man6 = $StaticBody2D6
@onready var man7 = $StaticBody2D7
@onready var man8 = $StaticBody2D8
@onready var man9 = $StaticBody2D9
@onready var man10 = $StaticBody2D10

@onready var anim_1 = $StaticBody2D/AnimationPlayer1
@onready var anim_2 = $StaticBody2D2/AnimationPlayer2
@onready var anim_3 = $StaticBody2D3/AnimationPlayer3
@onready var anim_4 = $StaticBody2D4/AnimationPlayer4
@onready var anim_5 = $StaticBody2D5/AnimationPlayer5
@onready var anim_6 = $StaticBody2D6/AnimationPlayer6
@onready var anim_7 = $StaticBody2D7/AnimationPlayer7
@onready var anim_8 = $StaticBody2D8/AnimationPlayer8
@onready var anim_9 = $StaticBody2D9/AnimationPlayer9
@onready var anim_10 = $StaticBody2D10/AnimationPlayer10

@onready var picked_up_sound = $PickedUp
@onready var jailed_sound = $Jailed
@onready var woo_sound = $Woo

var mouse_hover_jail = false

var can_pick = true

var is_1_picked = false
var is_2_picked = false
var is_3_picked = false
var is_4_picked = false
var is_5_picked = false
var is_6_picked = false
var is_7_picked = false
var is_8_picked = false
var is_9_picked = false
var is_10_picked = false

var is_1_hovered = false
var is_2_hovered = false
var is_3_hovered = false
var is_4_hovered = false
var is_5_hovered = false
var is_6_hovered = false
var is_7_hovered = false
var is_8_hovered = false
var is_9_hovered = false
var is_10_hovered = false

var mouse_position = null
var speed_anim = 2.8

var win_number = 4.0
var friend_count = 0.0



# Called when the node enters the scene tree for the first time.
func _ready():
	Global.game_start_timer.timeout.connect(_on_game_timer_timeout)
	print("TIME LEFT: ", Global.game_start_timer.time_left)	
	Global.game_start_timer.start()
	
	anim_1.speed_scale =  speed_anim
	anim_2.speed_scale =  speed_anim
	anim_3.speed_scale =  speed_anim
	anim_4.speed_scale =  speed_anim
	anim_5.speed_scale =  speed_anim
	anim_6.speed_scale =  speed_anim
	anim_7.speed_scale =  speed_anim
	anim_8.speed_scale =  speed_anim
	anim_9.speed_scale =  speed_anim
	anim_10.speed_scale =  speed_anim
	
	anim_1.play("Walk1")
	anim_2.play("Walk2")
	anim_3.play("Walk3")
	anim_4.play("Walk4")
	anim_5.play("Walk5")
	anim_6.play("Walk6")
	anim_7.play("Walk7")
	anim_8.play("Walk8")
	anim_9.play("Walk9")
	anim_10.play("Walk10")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	mouse_position = get_global_mouse_position()
	if Input.is_action_just_released("Click"):
		if is_1_picked && mouse_hover_jail == false:
			is_1_picked = false
			anim_1.play("Walk1")
			woo_sound.play()
		elif is_1_picked && mouse_hover_jail == true:
			is_1_picked = false
			man1.global_position = man1.global_position
			man1.input_pickable = false
			_get_friend()
		if is_2_picked && mouse_hover_jail == false:
			is_2_picked = false
			anim_2.play("Walk2")
			woo_sound.play()
		elif is_2_picked && mouse_hover_jail == true:
			is_2_picked = false
			man2.global_position = man2.global_position
			_get_friend()
			man2.input_pickable = false
		if is_3_picked && mouse_hover_jail == false:
			is_3_picked = false
			anim_3.play("Walk3")
			woo_sound.play()
		elif is_3_picked && mouse_hover_jail == true:
			is_3_picked = false
			man3.global_position = man3.global_position
			_get_friend()
			man3.input_pickable = false
		if is_4_picked && mouse_hover_jail == false:
			is_4_picked = false
			anim_4.play("Walk4")
			woo_sound.play()
		elif is_4_picked && mouse_hover_jail == true:
			is_4_picked = false
			man4.global_position = man4.global_position
			_get_friend()
			man4.input_pickable = false
		if is_5_picked && mouse_hover_jail == false:
			is_5_picked = false
			anim_5.play("Walk5")
			woo_sound.play()
		elif is_5_picked && mouse_hover_jail == true:
			is_5_picked = false
			man5.global_position = man5.global_position
			_get_friend()
			man5.input_pickable = false
		if is_6_picked && mouse_hover_jail == false:
			is_6_picked = false
			anim_6.play("Walk6")
			woo_sound.play()
		elif is_6_picked && mouse_hover_jail == true:
			is_6_picked = false
			man6.global_position = man6.global_position
			_get_friend()
			man6.input_pickable = false
		if is_7_picked && mouse_hover_jail == false:
			is_7_picked = false
			anim_7.play("Walk7")
			woo_sound.play()
		elif is_7_picked && mouse_hover_jail == true:
			is_7_picked = false
			man7.global_position = man7.global_position
			_get_friend()
			man7.input_pickable = false
		if is_8_picked && mouse_hover_jail == false:
			is_8_picked = false
			anim_8.play("Walk8")
			woo_sound.play()
		elif is_8_picked && mouse_hover_jail == true:
			is_8_picked = false
			man8.global_position = man8.global_position
			_get_friend()
			man8.input_pickable = false
		if is_9_picked && mouse_hover_jail == false:
			is_9_picked = false
			anim_9.play("Walk9")
			woo_sound.play()
		elif is_9_picked && mouse_hover_jail == true:
			is_9_picked = false
			man9.global_position = man9.global_position
			_get_friend()
			man9.input_pickable = false
		if is_10_picked && mouse_hover_jail == false:
			is_10_picked = false
			anim_10.play("Walk10")
			woo_sound.play()
		elif is_10_picked && mouse_hover_jail == true:
			is_10_picked = false
			man10.global_position = man10.global_position
			_get_friend()
			man10.input_pickable = false
		can_pick = true
	
	if is_1_picked:
		anim_1.stop()
		man1.global_position = mouse_position
	if is_2_picked:
		anim_2.stop()
		man2.global_position = mouse_position
	if is_3_picked:
		anim_3.stop()
		man3.global_position = mouse_position
	if is_4_picked:
		anim_4.stop()
		man4.global_position = mouse_position
	if is_5_picked:
		anim_5.stop()
		man5.global_position = mouse_position
	if is_6_picked:
		anim_6.stop()
		man6.global_position = mouse_position
	if is_7_picked:
		anim_7.stop()
		man7.global_position = mouse_position
	if is_8_picked:
		anim_8.stop()
		man8.global_position = mouse_position
	if is_9_picked:
		anim_9.stop()
		man9.global_position = mouse_position
	if is_10_picked:
		anim_10.stop()
		man10.global_position = mouse_position


func _on_static_body_2d_mouse_entered():
	is_1_hovered = true


func _on_static_body_2d_mouse_exited():
	is_1_hovered = false


func _on_static_body_2d_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("Click") && can_pick && is_1_hovered:
		picked_up_sound.play()
		is_1_picked = true
		can_pick = false


func _on_static_body_2d_2_mouse_entered():
	is_2_hovered = true


func _on_static_body_2d_2_mouse_exited():
	is_2_hovered = false


func _on_static_body_2d_2_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("Click") && can_pick && is_2_hovered:
		picked_up_sound.play()
		is_2_picked = true
		can_pick = false


func _on_static_body_2d_3_mouse_entered():
	is_3_hovered = true


func _on_static_body_2d_3_mouse_exited():
	is_3_hovered = false


func _on_static_body_2d_3_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("Click") && can_pick && is_3_hovered:
		picked_up_sound.play()
		is_3_picked = true
		can_pick = false


func _on_static_body_2d_4_mouse_entered():
	is_4_hovered = true


func _on_static_body_2d_4_mouse_exited():
	is_4_hovered = false


func _on_static_body_2d_4_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("Click") && can_pick && is_4_hovered:
		picked_up_sound.play()
		is_4_picked = true
		can_pick = false


func _on_static_body_2d_5_mouse_entered():
	is_5_hovered = true


func _on_static_body_2d_5_mouse_exited():
	is_5_hovered = false


func _on_static_body_2d_5_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("Click") && can_pick && is_5_hovered:
		picked_up_sound.play()
		is_5_picked = true
		can_pick = false


func _on_static_body_2d_6_mouse_entered():
	is_6_hovered = true


func _on_static_body_2d_6_mouse_exited():
	is_6_hovered = false


func _on_static_body_2d_6_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("Click") && can_pick && is_6_hovered:
		picked_up_sound.play()
		is_6_picked = true
		can_pick = false


func _on_static_body_2d_7_mouse_entered():
	is_7_hovered = true


func _on_static_body_2d_7_mouse_exited():
	is_7_hovered = false


func _on_static_body_2d_7_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("Click") && can_pick && is_7_hovered:
		picked_up_sound.play()
		is_7_picked = true
		can_pick = false


func _on_static_body_2d_8_mouse_entered():
	is_8_hovered = true


func _on_static_body_2d_8_mouse_exited():
	is_8_hovered = false


func _on_static_body_2d_8_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("Click") && can_pick && is_8_hovered:
		picked_up_sound.play()
		is_8_picked = true
		can_pick = false


func _on_static_body_2d_9_mouse_entered():
	is_9_hovered = true


func _on_static_body_2d_9_mouse_exited():
	is_9_hovered = false


func _on_static_body_2d_9_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("Click") && can_pick && is_9_hovered:
		picked_up_sound.play()
		is_9_picked = true
		can_pick = false


func _on_static_body_2d_10_mouse_entered():
	is_10_hovered = true


func _on_static_body_2d_10_mouse_exited():
	is_10_hovered = false


func _on_static_body_2d_10_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("Click") && can_pick && is_10_hovered:
		picked_up_sound.play()
		is_10_picked = true
		can_pick = false


func _on_animation_player_1_animation_finished(anim_name):
	anim_1.play("Walk1")


func _on_animation_player_2_animation_finished(anim_name):
	anim_2.play("Walk2")


func _on_animation_player_3_animation_finished(anim_name):
	anim_3.play("Walk3")


func _on_animation_player_4_animation_finished(anim_name):
	anim_4.play("Walk4")


func _on_animation_player_5_animation_finished(anim_name):
	anim_5.play("Walk5")


func _on_animation_player_6_animation_finished(anim_name):
	anim_6.play("Walk6")


func _on_animation_player_7_animation_finished(anim_name):
	anim_7.play("Walk7")


func _on_animation_player_8_animation_finished(anim_name):
	anim_8.play("Walk8")


func _on_animation_player_9_animation_finished(anim_name):
	anim_9.play("Walk9")


func _on_animation_player_10_animation_finished(anim_name):
	anim_10.play("Walk10")


func _on_area_2d_mouse_entered():
	mouse_hover_jail = true


func _on_area_2d_mouse_exited():
	mouse_hover_jail = false
	
func _get_friend():
	friend_count = friend_count + 1.0
	jailed_sound.play()
	if friend_count >= win_number:
		print("you win!")
		Global.win_level_signal.emit()

func _on_game_timer_timeout():
	print("What is this, can you not fight??")
	Global.lose_level_signal.emit()
