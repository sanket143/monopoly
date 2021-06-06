extends Spatial

signal player_on_card(entered, card)

var id

func _on_Player_area_entered(area: Area) -> void:
    var viewport = get_node("Viewport")
    if viewport:
        var card_instance = viewport.get_node("Card")
        var label = card_instance.get_node("Fill/Label")

        emit_signal("player_on_card", true, id)

func _on_Player_area_exited(area: Area) -> void:
    var viewport = get_node("Viewport")
    if viewport:
        var card_instance = viewport.get_node("Card")
        var label = card_instance.get_node("Fill/Label")

        emit_signal("player_on_card", false, id)
