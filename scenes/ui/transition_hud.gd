extends CanvasLayer

@onready var LivesContainer : HBoxContainer = $CanvasLayer/MarginContainer/HBoxContainer/LivesContainer
@onready var CurrentLives : int = Global.lives

func _ready():
	LivesContainer.set_max_lives(CurrentLives)
