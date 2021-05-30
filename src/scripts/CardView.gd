extends ColorRect

func _on_Board_show_card(data) -> void:
    var card = data["card"]
    var rect = $TitleRect
    var label = $TitleRect/Title

    rect.color = Color(card.color)
    label.text = card.title
    label.set("custom_colors/font_color", card.text_color)
