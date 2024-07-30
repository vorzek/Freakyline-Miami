extends Area2D

var travelled_distance = 0
var direction = Vector2.ZERO
var random_angle = randf_range(-0.3,0.3)

func _ready():
	print("shooting shotgunbullet")
	# check direction towards mouse
	var mouse_position = get_global_mouse_position()
	direction = (mouse_position - global_position).normalized()
	# match rotation to direction
	rotation = direction.angle()

func _physics_process(delta):
	const SPEED = 500
	const RANGE = 1200
	
	position += direction.rotated(random_angle).normalized() * SPEED * delta
	
	travelled_distance += SPEED * delta
	if travelled_distance > RANGE:
		queue_free()

func _on_body_entered(body):
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage()
