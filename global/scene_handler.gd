extends Node
class_name SceneHandler

#@onready var transition_timer : Timer = Timer.new()
#@onready var transition_timer_length : float = 1.0;

# Alias of the currently selected scene
var m_CurrentSceneAlias : String = ""
 
# Description: Find the initial scene as defined in the project settings
func _ready() -> void:
	#add_child(transition_timer)	
	#reset_transition_timer();
	#transition_timer.timeout.connect(_on_transition_timer_timeout)
	var mainScene : String = ProjectSettings.get_setting("application/run/main_scene")
	#print(mainScene)
	m_CurrentSceneAlias = Global.LevelScenes.find_key(mainScene)
	
func PickScene(LevelArray : Array):
	var next_scene : String;
	#if Global.LevelArray.size() == 0:
		#print("SCENE_HANDLER: Setting transition bool to false...")
		#Global.can_transition = false;
		#print("SCENE_HANDLER: can_transition bool value: ", Global.can_transition)
		#next_scene = "WinGame"
	#else:
	print("SCENE_HANDLER: Array Size: ", LevelArray.size())
	randomize()
	var random_index = randi_range(0,LevelArray.size()-1)
	print("SCENE_HANDLER: random index is: ", random_index)
	next_scene = LevelArray[random_index]
	print("SCENE_HANDLER: next scene is: ", next_scene)
	LevelArray.remove_at(random_index)
	
	return next_scene
	
# Description: Switch to the requested scene based on its alias
# Parameter sceneAlias: The scene alias of the scene to switch to
func SwitchScene(sceneAlias : String) -> void:
	SceneManager.change_scene(Global.LevelScenes[sceneAlias])

#func ArrayChecker(sceneAlias : String):
	#if Global.LevelArray.size() == 0:
		#Global.can_transition = false;
		#Global.win_game()
	#else:
		#SwitchScene(sceneAlias)

# Description: Quit the game
func QuitGame() -> void:
	get_tree().quit()

#func reset_transition_timer():
	#transition_timer.one_shot = true
	#transition_timer.wait_time = transition_timer_length
	
## Description: Restart the current scene
#func RestartScene() -> void:
	#get_tree().reload_current_scene()
	 

## Description: Return the number of scenes in the collection
#func GetSceneCount() -> int:
	#return Global.LevelScenes.size()
	 #
## Description: Returns the alias of the current scene
#func GetCurrentSceneAlias() -> String:
	#return m_CurrentSceneAlias
#
## Description: Add a new scene to the scene collection
## Parameter sceneAlias: The alias used for finding the scene in the collection
## Parameter scenePath: The full path to the scene file in the file system
#func AddScene(sceneAlias : String, scenePath : String) -> void:
	#Global.LevelScenes[sceneAlias] = scenePath
	 #
## Description: Remove an existing scene from the scene collection
## Parameter sceneAlias: The scene alias of the scene to remove from the collection
#func RemoveScene(sceneAlias : String) -> void:
	#Global.LevelScenes.erase(sceneAlias)
