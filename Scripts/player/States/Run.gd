extends State

@export
var idleState: State


@onready 
var base_player_animations: AnimatedSprite2D = $"../../basePlayerAnimations"

func enter() -> void:
	if parent.isThrowing == false:	
		base_player_animations.play("Run")
	print("run")
	
	
func process_input(event: InputEvent) -> State:
	if Input.is_action_pressed("moveup") == true:
		return null
	if Input.is_action_pressed("movedown") == true:
		return null
	if Input.is_action_pressed("moveleft") == true:
		return null
	if Input.is_action_pressed("moveright") == true:
		return null
	else:
		return idleState
	return null
	
