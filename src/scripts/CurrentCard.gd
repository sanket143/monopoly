extends Control

onready var BoardData = get_node("/root/BoardData")
onready var cards = BoardData.cards;
onready var sprite: Sprite = $CardSprite

var texture = ImageTexture.new()
var image = Image.new()

func _ready() -> void:
    visible = false

func _on_Board_show_card(data) -> void:
    var card = cards[data["card"]]

    if card.filepath != null:
        image.load(card.filepath)
        texture.create_from_image(image)

        sprite.texture = texture

        if data["visible"]:
            $AnimationPlayer.play("slide_in")

        else:
            $AnimationPlayer.play("slide_out")

