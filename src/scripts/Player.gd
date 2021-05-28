extends KinematicBody

var velocity = Vector3()

var speed = 30
var h_acceleration = 6
var gravity = 50
var jump = 40
var full_contact = false

var direction = Vector3()
var h_velocity = Vector3()
var movement = Vector3()
var gravity_vec = Vector3()


var mouse_sensitivity = 0.3

onready var head = $Head
onready var ground_check = $GroundCheck

func _physics_process(delta: float) -> void:
  direction = Vector3()

  if not is_on_floor():
    gravity_vec += Vector3.DOWN * gravity * delta 
  elif is_on_floor() and ground_check.is_colliding():
    gravity_vec = -get_floor_normal() * gravity
  else:
    gravity_vec = -get_floor_normal()
    
  if Input.is_action_just_pressed("jump") and (is_on_floor() or ground_check.is_colliding()):
    gravity_vec = Vector3.UP * jump

  if Input.is_action_pressed("move_forward"):
    direction += -transform.basis.z * speed

  if Input.is_action_pressed("move_back"):
    direction += transform.basis.z * speed

  if Input.is_action_pressed("strafe_right"):
    direction += transform.basis.x * speed

  if Input.is_action_pressed("strafe_left"):
    direction += -transform.basis.x * speed

  direction = direction.normalized()
  h_velocity = h_velocity.linear_interpolate(direction * speed, h_acceleration * delta)
  
  movement.z = h_velocity.z + gravity_vec.z
  movement.x = h_velocity.x + gravity_vec.x
  movement.y = gravity_vec.y
  
  movement = move_and_slide(movement, Vector3.UP)
  
func _input(event: InputEvent) -> void:
  if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
    rotate_y(deg2rad(-event.relative.x * mouse_sensitivity))
    head.rotate_x(deg2rad(-event.relative.y * mouse_sensitivity))
    head.rotation.x = clamp(head.rotation.x, deg2rad(-89), deg2rad(89))
