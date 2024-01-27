extends Node
class_name SceneHandler
 
# A collection of scenes in the game. Scenes are added through the Inspector panel
@export var Scenes : Dictionary = {
	"Main" : "res://scenes/main.tscn",
	"MainMenu" : "res://scenes/menu/main_menu.tscn",
	"TransitionScene" : "res://scenes/game/transition_scene/transition_scene.tscn",
	"FightTheDrawer" : "res://scenes/game/levels/fight_the_drawer/fight_the_drawer.tscn",
	"AccumulateTheFriendship" : "res://scenes/game/levels/accumulate_the_friendship/accumulate_the_friendship.tscn",
	"ThrowThePoet" : "res://scenes/game/levels/throw_the_poet/throw_the_poet.tscn",
	"StealTheBird" : "res://scenes/game/levels/steal_the_bird/steal_the_bird.tscn",
	"StrokeTheInjury" : "res://scenes/game/levels/stroke_the_injury/stroke_the_injury.tscn",
}



#@export var Scenes : Dictionary = Global.LevelScenes

#@export var TransitionScene : Dictionary = {
	#StringName("TransitionScene") : StringName("res://scenes/game/transition_scene/transition_scene.tscn")
#}

# Alias of the currently selected scene
var m_CurrentSceneAlias : String = ""
 
# Description: Find the initial scene as defined in the project settings
func _ready() -> void:
	var mainScene : String = ProjectSettings.get_setting("application/run/main_scene")
	#print(mainScene)
	m_CurrentSceneAlias = Scenes.find_key(mainScene)

func PickScene(LevelArray : Array):
	randomize()
	var random_index = randi_range(0,LevelArray.size()-1)
	var next_scene = LevelArray[random_index]
	LevelArray.remove_at(random_index)
	return next_scene
	
	
# Description: Switch to the requested scene based on its alias
# Parameter sceneAlias: The scene alias of the scene to switch to
func SwitchScene(sceneAlias : String) -> void:
	SceneManager.change_scene(Scenes[sceneAlias])

# Description: Restart the current scene
func RestartScene() -> void:
	get_tree().reload_current_scene()
	 
# Description: Quit the game
func QuitGame() -> void:
	get_tree().quit()

# Description: Return the number of scenes in the collection
func GetSceneCount() -> int:
	return Scenes.size()
	 
# Description: Returns the alias of the current scene
func GetCurrentSceneAlias() -> String:
	return m_CurrentSceneAlias

# Description: Add a new scene to the scene collection
# Parameter sceneAlias: The alias used for finding the scene in the collection
# Parameter scenePath: The full path to the scene file in the file system
func AddScene(sceneAlias : String, scenePath : String) -> void:
	Scenes[sceneAlias] = scenePath
	 
# Description: Remove an existing scene from the scene collection
# Parameter sceneAlias: The scene alias of the scene to remove from the collection
func RemoveScene(sceneAlias : String) -> void:
	Scenes.erase(sceneAlias)
