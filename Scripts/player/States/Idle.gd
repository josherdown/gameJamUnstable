extends State

@export
var runState: State
@export
var movement =  Input.get_vector("moveleft","moveright", "moveup", "movedown")
@onready var base_player_animations: AnimatedSprite2D = $"../../basePlayerAnimations"



	
func enter() -> void:
	if parent.isThrowing == false:
		base_player_animations.play("Idle")
	print("idle")

func process_input(event: InputEvent) -> State:
	if Input.is_action_pressed("moveup") == true:
		return runState
	if Input.is_action_pressed("movedown") == true:
		return runState
	if Input.is_action_pressed("moveleft") == true:
		return runState
	if Input.is_action_pressed("moveright") == true:
		return runState
		
	return null
