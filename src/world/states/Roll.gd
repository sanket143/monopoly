extends Node

var fsm: StateMachine

func enter() -> void:
    print("Hello from Roll")
    yield(get_tree().create_timer(2, 0), "timeout")
    exit("Execution")

func exit(next_state) -> void:
    fsm.change_to(next_state)
