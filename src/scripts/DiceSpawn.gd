extends Spatial

onready var Dice = preload("res://src/objects/Dice.tscn")

var rng = RandomNumberGenerator.new()
var no_of_dice = 2
var no_of_committed_dice = 0
var dice_total_number = 0

func spawn_dice() -> void:
    var dice = Dice.instance()
    rng.randomize()
    dice.rotate_x(rng.randi_range(-100, 100))
    dice.rotate_y(rng.randi_range(-100, 100))
    dice.rotate_z(rng.randi_range(-100, 100))
    dice.linear_velocity.x = rng.randi_range(-100, 100)
    dice.linear_velocity.z = rng.randi_range(-100, 100)
    dice.connect("commit", self, "_on_dice_commit")
    add_child(dice)

func reset_dice_data() -> void:
    no_of_committed_dice = 0
    dice_total_number = 0

func _input(event) -> void:
    if event.is_action_pressed("roll"):
        reset_dice_data()
        for n in get_children():
            remove_child(n)
            n.queue_free()
            
        for i in range(no_of_dice):
            spawn_dice()

func _on_dice_commit(number: int) -> void:
    no_of_committed_dice += 1
    dice_total_number += number

    if no_of_committed_dice == no_of_dice:
        print("ME:", dice_total_number)
