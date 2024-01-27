extends Node
class_name SceneHandler

#@export var TransitionScene : Dictionary = {
	#StringName("TransitionScene") : StringName("res://scenes/game/transition_scene/transition_scene.tscn")
#}

# Alias of the currently selected scene
var m_CurrentSceneAlias : String = ""
 
# Description: Find the initial scene as defined in the project settings
func _ready() -> void:
	var mainScene : String = ProjectSettings.get_setting("application/run/main_scene")
	#print(mainScene)
	m_CurrentSceneAlias = Global.LevelScenes.find_key(mainScene)

func PickScene(LevelArray : Array):
	randomize()
	var random_index = randi_range(0,LevelArray.size()-1)
	var next_scene = LevelArray[random_index]
	LevelArray.remove_at(random_index)
	return next_scene
	
	
# Description: Switch to the requested scene based on its alias
# Parameter sceneAlias: The scene alias of the scene to switch to
func SwitchScene(sceneAlias : String) -> void:
	SceneManager.change_scene(Global.LevelScenes[sceneAlias])

# Description: Restart the current scene
func RestartScene() -> void:
	get_tree().reload_current_scene()
	 
# Description: Quit the game
func QuitGame() -> void:
	get_tree().quit()

# Description: Return the number of scenes in the collection
func GetSceneCount() -> int:
	return Global.LevelScenes.size()
	 
# Description: Returns the alias of the current scene
func GetCurrentSceneAlias() -> String:
	return m_CurrentSceneAlias

# Description: Add a new scene to the scene collection
# Parameter sceneAlias: The alias used for finding the scene in the collection
# Parameter scenePath: The full path to the scene file in the file system
func AddScene(sceneAlias : String, scenePath : String) -> void:
	Global.LevelScenes[sceneAlias] = scenePath
	 
# Description: Remove an existing scene from the scene collection
# Parameter sceneAlias: The scene alias of the scene to remove from the collection
func RemoveScene(sceneAlias : String) -> void:
	Global.LevelScenes.erase(sceneAlias)
