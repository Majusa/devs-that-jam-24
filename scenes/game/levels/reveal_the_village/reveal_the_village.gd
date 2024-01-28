extends Node2D

@onready var anim_player = $AnimationPlayer
@onready var anim_player2 = $AnimationPlayer2
@onready var anim_player3 = $AnimationPlayer3
@onready var anim_player4 = $AnimationPlayer4

var rope_count = 0.0
var can_click_rope = true


# Called when the node enters the scene tree for the first time.
func _ready():
	anim_player.speed_scale = 3
	anim_player2.speed_scale = 3
	anim_player3.speed_scale = 3
	anim_player4.speed_scale = 3


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_rope_pull_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("Click") && can_click_rope:
		can_click_rope = false
		rope_count = rope_count + 1.0
		if rope_count == 1.0:
			anim_player4.play("RopePull")
			anim_player.play("RedCurtainPull")
		elif rope_count == 2.0:
			anim_player4.play("RopePull")
			anim_player2.play("YellowCurtainPull")
		elif rope_count == 3.0:
			anim_player4.play("RopePull")
			anim_player3.play("BlueCurtainPull")
			_win()
		else:
			pass


func _on_animation_player_animation_finished(anim_name):
	can_click_rope = true


func _on_animation_player_2_animation_finished(anim_name):
	can_click_rope = true


func _on_animation_player_3_animation_finished(anim_name):
	can_click_rope = true

func _win():
	print("You win!")
