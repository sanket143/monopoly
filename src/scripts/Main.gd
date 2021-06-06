extends Node

onready var cards = BoardData.cards;

var rng = RandomNumberGenerator.new()
var player = 0
var index = 1

func _ready() -> void:
  Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

"""Caputure and free mouse with the gameplay"""
func _input(event):
    if event.is_action_pressed("ui_cancel") and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
        Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

    if event.is_action_pressed("mouse_left") and Input.get_mouse_mode() == Input.MOUSE_MODE_VISIBLE:
        Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _on_DiceSpawn_move_player(dice_total_number: int) -> void:
    var cookie = $Cookies/Cookie

    index += dice_total_number
    index = index % cards.size()

    var card = cards[index]
    cookie.translation.z = card.z
    cookie.translation.x = card.x

