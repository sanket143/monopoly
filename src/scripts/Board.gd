extends Spatial

onready var CornerCardBody = preload("res://src/scenes/Cards/CornerCardBody.tscn")
onready var CardBody = preload("res://src/scenes/Cards/CardBody.tscn")
onready var View = preload("res://src/objects/View.tscn")
onready var BoardData = get_node("/root/BoardData")
onready var cards = BoardData.cards;

signal show_card(card)

export var card_width = 32
export var card_height = 51.2
var min_from_center = (4.5 * card_width + card_height / 2)

func add_card(card) -> void:
    if card.card_position == Global.CardPosition.EDGE:
        var viewport = View.instance()
        var card_instance = viewport.get_node("Card")
        var card_body_instance = CardBody.instance();
        var surface_instance = card_body_instance.get_node("Surface")
        var material = surface_instance.get_active_material(0).duplicate()
        var rect: ColorRect = card_instance.get_node("Fill")
        var label: Label = card_instance.get_node("Fill/Label")
        var cost: Label = card_instance.get_node("Fill/Cost")

        rect.color = Color(card.color)
        label.set("custom_colors/font_color", card.text_color)
        label.text = card.title

        if card.cost:
            var card_cost = "$" + str(card.cost)
            cost.set("custom_colors/font_color", card.text_color)
            cost.text = card_cost

        card_body_instance.add_child(viewport)

        card_body_instance.translation.x = card.x
        card_body_instance.translation.z = card.z
        card_body_instance.rotate_y(deg2rad(card.rotation))

        material.albedo_texture = viewport.get_texture()
        surface_instance.set_surface_material(0, material)
        card_body_instance.id = card.id
        card_body_instance.connect("player_on_card", self, "_on_player_steps_on_card")
        $Cards.add_child(card_body_instance)
    elif card.card_position == Global.CardPosition.CORNER:
        var img = Image.new()
        var img_texture = ImageTexture.new()
        var card_body_instance = CornerCardBody.instance()
        var surface_instance = card_body_instance.get_node("Surface")
        var material = surface_instance.get_active_material(0).duplicate()

        img.load(card.filepath)
        img_texture.create_from_image(img, 0)
        material.albedo_texture = img_texture

        card_body_instance.translation.x = card.x
        card_body_instance.translation.z = card.z
        card_body_instance.rotate_y(deg2rad(card.rotation))
        card_body_instance.id = card.id
        surface_instance.set_surface_material(0, material)

        $Cards.add_child(card_body_instance)

func generate_cards() -> void:
    var angle = 0
    var x = -min_from_center
    var z = -min_from_center

    for index in cards.size():
        var card = cards[index]

        card.rotation = 0
        card.id = index
        card.x = x
        card.z = z

        if card.type == Global.CardType.PROPERTY || index % 10 != 0:
            var temp_index = index / 10;
            var card_number = index % 10 - 1;

            if temp_index == 0:
                angle = 180
                x += card_width

            elif temp_index == 1:
                angle = 90
                z += card_width

            elif temp_index == 2:
                angle = 0
                x -= card_width

            elif temp_index == 3:
                angle = -90
                z -= card_width

            else:
                continue

            card.rotation = angle

            add_card(card)

        elif card.type == Global.CardType.START:
            card.rotation = -90
            add_card(card)
            x += (card_height + card_width) / 2

        elif card.type == Global.CardType.JAIL:
            x += (card_height / 2 - card_width / 2)
            card.rotation = -180
            card.x = x
            add_card(card)
            z += (card_height + card_width) / 2

        elif card.type == Global.CardType.PARKING:
            z += (card_height / 2 - card_width / 2)
            card.rotation = 90
            card.z = z
            add_card(card)
            x -= (card_height + card_width) / 2

        elif card.type == Global.CardType.GO_TO_JAIL:
            x -= (card_height / 2 - card_width / 2)
            card.x = x
            add_card(card)
            z -= (card_height + card_width) / 2

func _ready() -> void:
    generate_cards()

func _on_player_steps_on_card(entered: bool, card_id) -> void:
    emit_signal("show_card", {
        "visible": entered,
        "card": card_id
    })
