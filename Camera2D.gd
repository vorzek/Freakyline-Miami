extends Camera2D
# Map dimensions (replace with your actual map size)
var map_width = 2000
var map_height = 1500

func _ready():
	# Connect to the window resize signal
	get_viewport().connect("size_changed", self, "_on_window_resized")
	# Initialize camera limits
	_update_camera_limits()

func _on_window_resized():
	_update_camera_limits()

func _update_camera_limits():
	# Get the size of the window
	var window_size = get_viewport().size

	# Calculate half of the window size
	var half_window_width = window_size.x / 2
	var half_window_height = window_size.y / 2

	# Update the camera limits
	limit_left = half_window_width
	limit_right = map_width - half_window_width
	limit_top = half_window_height
	limit_bottom = map_height - half_window_height

	# Ensure the limits are not negative
	limit_left = max(limit_left, 0)
	limit_right = max(limit_right, 0)
	limit_top = max(limit_top, 0)
	limit_bottom = max(limit_bottom, 0)
