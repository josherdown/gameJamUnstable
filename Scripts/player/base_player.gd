class_name Player
extends CharacterBody2D

@onready var basePlayerAnimations = $basePlayerAnimations
@onready var stateMachine = $StateMachine
@export var speed := 150

var  isThrowing : bool = false



func _ready() -> void:
	#initializes the state machine with references to player allowing it to move and react accordingly
	stateMachine.init(self)
	
func _unhandled_input(event: InputEvent) -> void:
	stateMachine.process_input(event)

func _physics_process(delta: float) -> void:
	stateMachine.process_physics(delta)
	
func _process(delta: float) -> void:
	stateMachine.process_frame(delta)
	position += Input.get_vector("moveleft","moveright", "moveup", "movedown") * speed * delta
	if Input.is_action_just_pressed("lmbclick") == true and isThrowing == false:
		isThrowing = true
		basePlayerAnimations.play("Throw")
		print("throw")
	
		


func _on_base_player_animations_animation_finished() -> void:
	isThrowing = false
	$StateMachine.currentState.enter()
