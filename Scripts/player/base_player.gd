class_name Player
extends CharacterBody2D
const POTION_PROJECTILE = preload("uid://diovcen13ugbx")
const POTION_WEAPON = preload("uid://gofe4noin6ss")
@onready var marker_2d: Marker2D = $Marker2D

@onready var basePlayerAnimations = $basePlayerAnimations
@onready var stateMachine = $StateMachine
@export var speed := 150
@export var  isThrowing : bool = false

var throwingPotion = false




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
	if Input.is_action_just_pressed("lmbclick"):
		_throw()

func _throw():
	if throwingPotion:
		return
	throwingPotion = true
	var startPosition = marker_2d.global_position
	var direction = -1 if basePlayerAnimations.flip_h else 1 
	var targetPosition = Vector2(get_global_mouse_position()) - global_position
	
	await get_tree().create_timer(1).timeout
	var potion = POTION_PROJECTILE.instantiate()
	potion.targetPosition = targetPosition
	
	get_parent().add_child(potion)
	potion.global_position = global_position
	

	
	throwingPotion = false
		
		


func _on_base_player_animations_animation_finished() -> void:
	isThrowing = false
	$StateMachine.currentState.enter()
