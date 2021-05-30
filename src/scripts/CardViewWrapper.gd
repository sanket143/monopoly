extends Control

func _ready() -> void:
    visible = false

func _on_Board_show_card(data) -> void:
    visible = data["visible"]
