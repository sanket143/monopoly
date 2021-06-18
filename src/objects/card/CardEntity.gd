extends Node

class_name CardEntity

var color
var text_color
var title
var x
var z
var id
var type
var cost
var site_rent
var rents
var raw_color
var rotation
var filepath
var card_position
var house_cost
var hotel_cost

func _init(data):
    self.title = data.title
    self.text_color = Global.COLORS[data.text_color]
    self.color = Global.COLORS[data.color]
    self.raw_color = data.color
    self.type = data.type
    self.card_position = data.card_position

    if "filename" in data:
        self.filepath = "res://assets/cards/" + data.filename

    if "cost" in data:
        self.cost = data.cost

    if "site" in data:
        self.site_rent = data.site

    if "rents" in data:
        self.rents = data.rents

    if "house_cost" in data:
        self.house_cost = data.house_cost

    if "hotel_cost" in data:
        self.hotel_cost = data.hotel_cost
