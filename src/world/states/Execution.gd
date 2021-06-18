extends Node

var fsm: StateMachine

func enter() -> void:
    print("Hello from Execution")
    yield(get_tree().create_timer(2.0), "timeout")
    exit()

func exit() -> void:
    fsm.back()
