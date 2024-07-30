extends Area2D

var travelled_distance = 0
var direction = Vector2.ZERO

func _ready():
	# Calculate the direction towards the mouse position
	var mouse_position = get_global_mouse_position()
	direction = (mouse_position - global_position).normalized()
	# Set the rotation of the bullet to match the direction
	rotation = direction.angle()
	
func _physics_process(delta):
	const SPEED = 1000
	const RANGE = 1200
	
	position += direction * SPEED * delta
	
	travelled_distance += SPEED * delta
	if travelled_distance > RANGE:
		queue_free()

func _on_body_entered(body):
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage()
