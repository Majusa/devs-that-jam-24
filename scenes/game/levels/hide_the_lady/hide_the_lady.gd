extends Node2D

@onready var lady = $CharacterBody2D
var is_hover_lady = false
var is_picked_up = false
var velocity = Vector2()
var speed = 0.0
var mouse_position = null
const ACCELERATION = 50.0
var last_position = null
var is_hidden = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	mouse_position = get_global_mouse_position()
	if is_picked_up && Input.is_action_pressed("Click"):
		lady.global_position = lerp (lady.global_position, mouse_position, ACCELERATION * delta)
	if Input.is_action_just_released("Click"):
		is_picked_up = false
		if is_hidden:
			print("You win!")



func _on_character_body_2d_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("Click") && is_hover_lady:
		is_picked_up = true

func _on_character_body_2d_mouse_entered():
	is_hover_lady = true

func _on_character_body_2d_mouse_exited():
	is_hover_lady = false

func _on_area_2d_body_exited(body):
	is_hidden = true

func _on_area_2d_body_entered(body):
	is_hidden = false
