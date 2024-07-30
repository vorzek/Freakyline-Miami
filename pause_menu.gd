extends CanvasLayer

# The _ready function is called once when the node is added to the scene.
func _ready():
	hide()  # Initially hide the pause menu.

# The _process function is called every frame.
func _physics_process(delta):
	if Input.is_action_just_pressed("quit"):
		_toggle_pause()

func _toggle_pause():
	if get_tree().paused:
		_resume_game()
	else:
		_pause_game()

func _pause_game():
	get_tree().paused = true
	show()

func _resume_game():
	get_tree().paused = false
	hide()


func _on_button_pressed():
	get_tree().quit()
