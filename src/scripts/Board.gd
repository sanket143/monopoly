extends Spatial

onready var CardBody = preload("res://src/scenes/CardBody.tscn")
onready var Card = preload("res://src/scenes/Card.tscn")
onready var View = preload("res://src/objects/View.tscn")
onready var BoardData = get_node("/root/BoardData")
onready var cards = BoardData.cards;

signal show_card(card)

export var card_width = 32
export var card_height = 51.2 # 49.2
export var min_from_center = 144

func add_card(card) -> void:
  var viewport = View.instance()
  var card_instance = viewport.get_node("Card")
  var card_body_instance = CardBody.instance();
  var surface_instance = card_body_instance.get_node("Surface")
  var material = surface_instance.get_active_material(0).duplicate()
  var rect: ColorRect = card_instance.get_node("Fill")
  var label: Label = card_instance.get_node("Fill/Label")

  rect.color = Color(card.color)
  label.set("custom_colors/font_color", card.text_color)
  label.text = card.title

  card_body_instance.add_child(viewport)

  card_body_instance.translation.x = card.x
  card_body_instance.translation.z = card.z
  card_body_instance.rotate_y(deg2rad(card.rotation))

  material.albedo_texture = viewport.get_texture()
  surface_instance.set_surface_material(0, material)
  card_body_instance.id = card.id
  card_body_instance.connect("player_on_card", self, "_on_player_steps_on_card")
  self.add_child(card_body_instance)

func generate_cards() -> void:
    var angle = 0
    var x = 1
    var z = 1

    for index in cards.size():
        var card = cards[index]
        if card == null:
            continue

        if card.type == Global.CardType.PROPERTY || index % 10 != 0:
            var temp_index = index / 10;
            var card_number = index % 10 - 1;

            if temp_index == 0:
                angle = 90
                x = min_from_center + card_height / 2
                z = -min_from_center + (card_width / 2) + card_number * card_width

            elif temp_index == 1:
                angle = 0
                x = min_from_center - card_number * card_width - (card_width / 2)
                z = min_from_center + card_height / 2

            elif temp_index == 2:
                angle = -90
                x = -min_from_center - card_height / 2
                z = min_from_center - (card_width / 2) - card_number * card_width

            elif temp_index == 3:
                angle = -180
                x = -min_from_center + card_number * card_width + (card_width / 2)
                z = -min_from_center - card_height / 2

            else:
                continue

            card.rotation = angle
            card.x = x
            card.z = z
            card.id = index

            add_card(card)

func _ready() -> void:
  generate_cards()

func _on_player_steps_on_card(entered: bool, card_id) -> void:
    emit_signal("show_card", {
        "visible": entered,
        "card": card_id
    })
