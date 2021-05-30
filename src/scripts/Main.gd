extends Node

func _ready() -> void:
  Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

"""Caputure and free mouse with the gameplay"""
func _input(event):
    if event.is_action_pressed("ui_cancel") and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
        Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

    if event.is_action_pressed("mouse_left") and Input.get_mouse_mode() == Input.MOUSE_MODE_VISIBLE:
        Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
