extends Node2D

@onready var anim_player1 = $AnimationPlayer
@onready var anim_player2 = $AnimationPlayer2
@onready var knock = $Knock
@onready var scream  = $Scream

var can_knock = true

var win_number = 3.0
var knock_number = 0.0


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.game_start_timer.timeout.connect(_on_game_timer_timeout)
	print("TIME LEFT: ", Global.game_start_timer.time_left)	
	Global.game_start_timer.start()
	print("ANXIETY : Game timer Started")
	anim_player2.speed_scale = 12
	anim_player1.speed_scale = 20


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_static_body_2d_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("Click") && can_knock:
		can_knock = false
		print("clicked door")
		anim_player2.play("DoorKnock")
		knock.play()
		anim_player1.play("Scream")
		scream.play()
		knock_number = knock_number + 1.0
		if knock_number >= win_number:
			print("You win!")
			win()

func win():
	Global.win_level_signal.emit()
	
func _on_animation_player_animation_finished(anim_name):
	can_knock = true

func _on_game_timer_timeout():
	print("Where's the village?")
	Global.lose_level_signal.emit()
