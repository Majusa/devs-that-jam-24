extends Node2D

@onready var TeddyBody = $TeddyBody
@onready var GlassesBody = $GlassesBody
@onready var BackpackBody = $BackpackBody
@onready var HandbagBody = $HandbagBody
@onready var ShoeBody = $ShoeBody
@onready var anim_player = $AnimationPlayer

var is_hover_teddy = false
var is_hover_glasses = false
var is_hover_backpack = false
var is_hover_handbag = false
var is_hover_shoe = false
var can_pickup = true

var teddy_picked = false
var glasses_picked = false
var backpack_picked = false
var handbag_picked = false
var shoe_picked = false

var mouse_position = null

var required_score = 5.0
var current_score = 0.0


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.game_start_timer.timeout.connect(_on_game_timer_timeout)
	print("TIME LEFT: ", Global.game_start_timer.time_left)	
	Global.game_start_timer.start()
	
	anim_player.speed_scale = 4
	anim_player.play("Crying")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	mouse_position = get_global_mouse_position()
	
	if teddy_picked == true:
		TeddyBody.global_position = mouse_position
	if glasses_picked == true:
		GlassesBody.global_position = mouse_position
	if backpack_picked == true:
		BackpackBody.global_position = mouse_position
	if handbag_picked == true:
		HandbagBody.global_position = mouse_position
	if shoe_picked == true:
		ShoeBody.global_position = mouse_position
	if Input.is_action_just_released("Click"):
		teddy_picked = false
		glasses_picked = false
		backpack_picked = false
		handbag_picked = false
		shoe_picked = false
		can_pickup = true

# Teddy
func _on_static_body_2d_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("Click") && can_pickup && is_hover_teddy:
		teddy_picked = true
		can_pickup = false

func _on_static_body_2d_mouse_entered():
	is_hover_teddy = true


func _on_static_body_2d_mouse_exited():
	is_hover_teddy = false

# Glasses
func _on_static_body_2d_2_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("Click") && can_pickup && is_hover_glasses:
		glasses_picked = true
		can_pickup = false

func _on_static_body_2d_2_mouse_entered():
	is_hover_glasses = true


func _on_static_body_2d_2_mouse_exited():
	is_hover_glasses = false

# Backpack
func _on_static_body_2d_3_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("Click") && can_pickup && is_hover_backpack:
		backpack_picked = true
		can_pickup = false

func _on_static_body_2d_3_mouse_entered():
	is_hover_backpack = true


func _on_static_body_2d_3_mouse_exited():
	is_hover_backpack = false

# Handbag
func _on_static_body_2d_4_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("Click") && can_pickup && is_hover_handbag:
		handbag_picked = true
		can_pickup = false

func _on_static_body_2d_4_mouse_entered():
	is_hover_handbag = true


func _on_static_body_2d_4_mouse_exited():
	is_hover_handbag = false

# Shoe
func _on_static_body_2d_5_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("Click") && can_pickup && is_hover_shoe:
		shoe_picked = true
		can_pickup = false

func _on_static_body_2d_5_mouse_entered():
	is_hover_shoe = true


func _on_static_body_2d_5_mouse_exited():
	is_hover_shoe = false


func _on_character_body_2d_mouse_entered():
	if teddy_picked == true:
		current_score = current_score + 1.0
		_check_score()
		TeddyBody.visible = not visible
	if glasses_picked == true:
		current_score = current_score + 1.0
		_check_score()
		GlassesBody.visible = not visible
	if backpack_picked == true:
		current_score = current_score + 1.0
		_check_score()
		BackpackBody.visible = not visible
	if handbag_picked == true:
		current_score = current_score + 1.0
		_check_score()
		HandbagBody.visible = not visible
	if shoe_picked == true:
		current_score = current_score + 1.0
		_check_score()
		ShoeBody.visible = not visible

func _on_animation_player_animation_finished(anim_name):
	anim_player.play("Crying")

func _check_score():
	if current_score >= required_score:
		print("you win!")
		Global.win_level_signal.emit()

func _on_game_timer_timeout():
	print("What is this, can you not fight??")
	Global.lose_level_signal.emit()
