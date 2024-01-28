extends Node

@onready var timer : Timer = Timer.new()
@onready var label : Label = $Label
@onready var next_game_label : Label = $NextGameLabel
@onready var next_scene : String;
@onready var random_text : Array = [
	"Pontificating...",
	"Prestidigitating...",
	"Pioneering...",
	"Prescribing...",
	"Projecting...",
	"Permitting...",
	"Presuming...",
	"Protesting...",
	"Proclaiming..."
]

func _ready():
	get_next_scene()
	set_random_label_text()
	set_next_game_label_text(next_scene)
	add_child(timer)
	timer.one_shot = true
	timer.autostart = true
	timer.wait_time = 3.0
	timer.timeout.connect(_on_timer_timeout)
	timer.start()

func _on_timer_timeout():
	SceneHandlage.SwitchScene(next_scene)

func get_next_scene():
	if Global.LevelArray.size() > 0 :
		next_scene = SceneHandlage.PickScene(Global.LevelArray)
	else:
		next_scene = "Win_Game"

	
func set_random_label_text():
	randomize()
	var random_index = randi_range(0,random_text.size()-1)
	var transition_text : String = random_text[random_index]
	$Label.text = transition_text

func set_next_game_label_text(input_scene : String):
	var verb_the_noun = input_scene.split("_")
	var label_text = " ".join(verb_the_noun)
	next_game_label.text = label_text
	
