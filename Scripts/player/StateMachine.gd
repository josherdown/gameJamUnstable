extends Node

@export 
var startingState: State
var currentState: State


#initalizes the state machine by giving each child a reference to the parent and the starting scene
func init(parent: Player) -> void:
	for child in get_children():
		child.parent = parent
		
	changeState(startingState)
	
func changeState(newState: State) -> void:
	if currentState:
		currentState.exit()
	
	currentState = newState
	currentState.enter()
	
func process_physics(delta: float) -> void:
	var newState = currentState.process_physics(delta)
	if newState:
		changeState(newState)
	
func process_input(event: InputEvent) -> void:
	var newState = currentState.process_input(event)
	if newState:
		changeState(newState)

func process_frame(delta: float) -> void:
	var newState = currentState.process_frame(delta)
	if newState:
		changeState(newState)

		
