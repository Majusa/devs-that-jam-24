extends Node2D

@onready var anim_player1 = $AnimationPlayer1 # Left hand
@onready var anim_player2 = $AnimationPlayer2 # Right hand
@onready var anim_player3 = $AnimationPlayer3 # Drawer 

@onready var health = 10
@onready var drawer_health = 5
var attack_timer = 0.0
var attack_timing = 0.2

var left_can_attack =  true
var right_can_attack = true


# Called when the node enters the scene tree for the first time.
func _ready():
	anim_player1.speed_scale = 5
	anim_player2.speed_scale = 5
	anim_player3.speed_scale = 7


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Click") && left_can_attack:
		left_can_attack = false
		anim_player1.play("LeftPunch")
		drawer_health = drawer_health - 1
		if drawer_health <= 0:
			_win()
	if Input.is_action_just_pressed("Right Click") && right_can_attack:
		right_can_attack = false
		anim_player2.play("RightPunch")
		drawer_health = drawer_health - 1
		if drawer_health <= 0:
			_win()

	attack_timer += delta

	if attack_timer >= attack_timing:
		attack_timer = 0.0
		anim_player3.play("DrawerAttack")
		health = health - 1
		if health <= 0:
			_lose()

func _lose():
	print("You lose!")

func _win():
	print("You win!")


func _on_animation_player_1_animation_finished(anim_name):
	left_can_attack =  true


func _on_animation_player_2_animation_finished(anim_name):
	right_can_attack = true
