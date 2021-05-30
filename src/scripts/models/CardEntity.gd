extends Node

class_name CardEntity

var color
var text_color
var title
var x
var z
var id
var type
var rotation
var filepath

func _init(data):
    self.title = data.title
    self.text_color = Global.COLORS[data.text_color]
    self.color = Global.COLORS[data.color]
    self.type = data.type

    if "filename" in data:
        print("res://assets/cards/" + data.filename)
        self.filepath = "res://assets/cards/" + data.filename
