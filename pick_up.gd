extends Area2D

@onready var player = get_node("/root/Game/Player")

func _physics_process(delta):
	var entity_in_range = get_overlapping_bodies()
	if entity_in_range.size() > 0:
		queue_free()
		player.increase_health()
