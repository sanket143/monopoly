extends KinematicBody

var gravity = Vector3.DOWN * 12
var speed = 25
var jump_speed = 6
var spin = 0.2
var velocity = Vector3()
var jump = false

var MOUSE_SENSITIVITY = 0.3
var angle = 0


func _input(event):         
  if event is InputEventMouseMotion :
    rotate_y(deg2rad(-event.relative.x * MOUSE_SENSITIVITY))


func _physics_process(delta: float) -> void:
  velocity += gravity 
#  get_input()
  velocity = move_and_slide(velocity, Vector3.UP)
