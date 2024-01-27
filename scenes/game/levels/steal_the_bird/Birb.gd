extends CharacterBody2D
@onready var screen_bound_x = DisplayServer.window_get_size().x
@onready var screen_bound_y = DisplayServer.window_get_size().y
var speed = randf_range(1500, 2500)
var value = randf_range(-1, 1)
var direction = Vector2(value,value).normalized()
var speed_variation_rate = 0.5
var direction_variation_rate = 0.5
var random_change = 0
var is_hover_bird = false
var is_being_picked_up = false
var mouse_position = null
const ACCELERATION = 50.0
var last_position = null




# Called when the node enters the scene tree for the first time.
func _ready():
	# Randomize start position
	randomize()
	var x_range = Vector2(200, screen_bound_x - 200)
	var y_range = Vector2(200, screen_bound_y - 200)
	var random_x = randi() % int(x_range[1]- x_range[0]) + 1 + x_range[0] 
	var random_y =  randi() % int(y_range[1]-y_range[0]) + 1 + y_range[0]
	var random_pos = Vector2(random_x, random_y)
	position = random_pos
	#Randomize movement


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_being_picked_up && Input.is_action_pressed("Click"):
		global_position = lerp (global_position, get_global_mouse_position(), ACCELERATION * delta)
		## TODO  - speed up flapping
		#look_at(mouse_position)
		#last_position = global_position
	else:
		is_being_picked_up = false
		if position.x > screen_bound_x || position.x < 0:
			#print("out of bounds x")
			direction.x = direction.x * -1
			direction.y = randf_range(-1,1)
			speed = randf_range(1500, 2500)
			random_change = 0
		
		if position.y > screen_bound_y || position.y < 0:
			#print("out of bounds y")
			direction.y = direction.y * -1
			direction.x = randf_range(-1,1)
			speed = randf_range(1500, 2500)
			random_change = 0
		
		random_change = random_change + 1
		if random_change > 49:
			randomize_speed_and_direction()
			random_change = 0
		
		position += direction * speed * delta


func randomize_speed_and_direction():
	if randf() < speed_variation_rate:
		speed = randf_range(1500, 2500)

	if randf() < direction_variation_rate:
		direction = Vector2(direction.x - 0.5, direction.y - 0.5).normalized()


func _on_mouse_entered():
	is_hover_bird = true



func _on_mouse_exited():
	is_hover_bird = false



func _on_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("Click") && is_hover_bird:
		is_being_picked_up = true




func _on_area_2d_body_entered(body):
	if is_being_picked_up == true:
		print("You win!")
