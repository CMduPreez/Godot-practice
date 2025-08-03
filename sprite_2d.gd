extends Sprite2D
# Tells Godot this script controls a Sprite2D node
# Inherits all built-in Sprite2D functionality

func _ready():
	# Special function that runs automatically when the node first appears
	# The underscore means it's a built-in Godot function
	print("Sprite is ready!")
	# Prints text to Output panel (bottom of Godot) - useful for debugging

func _input(event):
	# Special function that runs every time player does something 
	# (mouse click, key press, etc.)
	# The 'event' parameter contains details about what happened
	
	# Check if left mouse button was clicked
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		# Breaking down this condition:
		# - event is InputEventMouseButton: checks if it was a mouse button (not keyboard)
		# - event.pressed: checks if button was pressed down (not released)
		# - event.button_index == MOUSE_BUTTON_LEFT: checks it was left mouse button
		
		# Get the exact pixel coordinates where mouse was clicked
		var mouse_pos = get_global_mouse_position()
		
		# Get the rectangle area that our sprite occupies (its boundaries)
		var sprite_rect = get_rect()
		
		# Adjust rectangle position to match where sprite actually is on screen
		# This math accounts for how Godot positions sprites
		sprite_rect.position += global_position - sprite_rect.size / 2
		
		# Check if the mouse click happened inside the sprite's rectangle area
		if sprite_rect.has_point(mouse_pos):
			# Move sprite to random position:
			# Vector2() creates a 2D coordinate (x, y)
			# randf() generates random decimal between 0 and 1
			# * 800 and * 600 multiply to get random positions within 800x600 pixels
			global_position = Vector2(randf() * 800, randf() * 600)
			
			# Print confirmation message showing the new coordinates
			print("Sprite clicked! New position: ", global_position)
