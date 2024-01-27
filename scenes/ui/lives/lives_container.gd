extends HBoxContainer

@onready var LivesGuiClass = preload("res://scenes/ui/lives/lives.tscn")

func set_max_lives(lives : int):
	for i in range(lives):
		var life = LivesGuiClass.instantiate()
		add_child(life)
