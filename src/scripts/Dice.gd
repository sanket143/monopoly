extends RigidBody

signal commit

var committed = false

func _process(delta: float) -> void:
    if angular_velocity == Vector3.ZERO and not committed:
        var number_vectors = [
            Vector3(1, 0, 0),
            Vector3(0, 0, 1)
        ]

        for index in range(number_vectors.size()):
            number_vectors[index] = rotation_degrees.dot(number_vectors[index])

        var vec_x = number_vectors[0]
        var vec_z = number_vectors[1]
        var number = 0

        if vec_x > -46 && vec_x < 45:
            if vec_z > 44 && vec_z < 135:
                number = 1
            elif vec_z > -46 && vec_z < 45:
                number = 2
            elif vec_z > 134 && vec_z < 225:
                number = 5
            elif vec_z > -226 && vec_z < -135:
                number = 5
            elif vec_z > -136 && vec_z < -45:
                number = 6
        elif vec_z > -46 && vec_z < 45:
            if vec_x > 44 && vec_x < 135:
                number = 3
            elif vec_x > -136 && vec_x < -45:
                number = 4

        emit_signal("commit", number)
        committed = true
