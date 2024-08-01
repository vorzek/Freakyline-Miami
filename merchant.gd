extends CharacterBody2D

@onready var player = get_node("/root/Game/Player")
var player_in_area = false

# Called when the node enters the scene tree for the first time.
func _ready():
	%BikerIdle.play_idle_animation()


# Called every frame. 'delta' is the elapsed time since the previous frame.

func _physics_process(delta):
	if player_in_area == true:
		if Input.is_action_just_pressed("interact"):
			%TextBubble.visible = true
		


func _on_interaction_range_area_entered(area:Area2D):
	print("body entered")
	player_in_area = true
		

func _on_interaction_range_area_exited(area:Area2D):
	print("body exited")
	player_in_area = false
	%TextBubble.visible = false