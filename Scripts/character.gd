extends Node3D

@export_range(0, 90) var max_look_angle: float
@export_range(0, 1) var look_speed: float:
	get:
		return look_speed * .01


func _ready() -> void:
	# TODO: Move this to a Game Manager with a State Machine
	Input.mouse_mode = Input.MouseMode.MOUSE_MODE_CAPTURED


func _input(event: InputEvent) -> void:
	event = event as InputEventMouseMotion
	if !event:
		return

	rotate_x(event.relative.y * look_speed)
	rotate_y(-event.relative.x * look_speed)

	rotation.z = 0
	rotation_degrees.x = clampf(rotation_degrees.x, -max_look_angle, max_look_angle)
	rotation_degrees.y = clampf(rotation_degrees.y, -max_look_angle, max_look_angle)
