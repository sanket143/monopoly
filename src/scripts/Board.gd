extends Spatial

onready var CardBody = preload("res://src/scenes/CardBody.tscn")
onready var Card = preload("res://src/scenes/Card.tscn")

var min_from_center = 50
var rng = RandomNumberGenerator.new()
var colors = [
  "#FFC107",
  "#F44336",
  "#FF5722",
  "#9C27B0",
  "#E91E63",
  "#8BC34A",
  "#4CAF50",
  "#009688",
  "#00BCD4",
  "#3F51B5"
]

func add_card(x: float, z: float, color: int, rotation: float):
  var viewport = Viewport.new()
  var card_instance = Card.instance()
  var card_body_instance = CardBody.instance();
  var surface_instance = card_body_instance.get_node("Surface")
  var material = surface_instance.get_active_material(0).duplicate()
  var rect: ColorRect = card_instance.get_node("Fill")
  rect.color = Color(colors[color])
  viewport.size.x = 100
  viewport.size.y = 160

  viewport.add_child(card_instance)
  card_body_instance.add_child(viewport)
  
  card_body_instance.translation.x = x
  card_body_instance.translation.z = z
  card_body_instance.rotate_y(deg2rad(rotation))
  
  material.albedo_texture = viewport.get_texture()
  surface_instance.set_surface_material(0, material)
  
  self.add_child(card_body_instance)

func _ready() -> void:
  for i in 10:
    add_card(min_from_center + 8, -min_from_center + 5 + i * 10, i, 90)
  for i in 10:
    add_card(-min_from_center - 8, -min_from_center + 5 + i * 10, i, 90)
  for i in 10:
    add_card(-min_from_center + i * 10 + 5, min_from_center + 8, i, 0)
  for i in 10:
    add_card(-min_from_center + i * 10 + 5, -min_from_center - 8, i, 0)
