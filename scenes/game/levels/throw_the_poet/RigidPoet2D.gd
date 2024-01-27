extends RigidBody2D

@onready var sprite_body = $CollisionPolygon2D/PoetBody
@onready var sprite_head = $CollisionPolygon2D/PoetBody/PoetHead
@onready var container = get_parent()

var velocity = Vector2()
var speed = 0.0
var mouse_position = null
const ACCELERATION = 50.0
var is_being_picked_up = false
var is_hover_poet = false
var last_position = null


# Called when the node enters the scene tree for the first time.
func _ready():
	# Generate random position for spawn
	randomize()
	var x_range = Vector2(200, 1800)
	var y_range = Vector2(900, 920)

	var random_x = randi() % int(x_range[1]- x_range[0]) + 1 + x_range[0] 
	var random_y =  randi() % int(y_range[1]-y_range[0]) + 1 + y_range[0]
	var random_pos = Vector2(random_x, random_y)
	global_position = random_pos
	
	# Flip sprite if spawning left side of screen
	if global_position.x < 960:
		sprite_body.flip_h = true
		sprite_head.flip_h = true
		
	
		
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	mouse_position = get_global_mouse_position()
	if is_being_picked_up && Input.is_action_pressed("Click"):
		global_position = lerp (global_position, mouse_position, ACCELERATION * delta)
		look_at(mouse_position)
		last_position = global_position
	if Input.is_action_just_released("Click") && is_being_picked_up:
		is_being_picked_up = false
		print(last_position)
		print(global_position)
		apply_impulse(Input.get_last_mouse_velocity()*0.25, last_position)
		angular_velocity = 10


func _on_mouse_entered():
	is_hover_poet = true
	print("Oh no, leave me alone!")


func _on_mouse_exited():
	is_hover_poet = false
	print("Thank heavens he left, I hope he doesn't come back!")


func _on_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("Click") && is_hover_poet:
		is_being_picked_up = true
		print("How dare you, I'm hard at work contemplating the wonders of nature!")


func _on_collision_area_left_body_entered(body):
	if !is_being_picked_up:
		print("Fakka uuuuuu!") # Replace with function body.
