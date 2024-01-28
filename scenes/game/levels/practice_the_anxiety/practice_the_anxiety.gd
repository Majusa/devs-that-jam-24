extends Node2D

@onready var anim_player1 = $AnimationPlayer
@onready var anim_player2 = $AnimationPlayer2

var can_knock = true

var win_number = 3.0
var knock_number = 0.0


# Called when the node enters the scene tree for the first time.
func _ready():
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
		anim_player1.play("Scream")
		knock_number = knock_number + 1.0
		if knock_number >= win_number:
			print("You win!")


func _on_animation_player_animation_finished(anim_name):
	can_knock = true
