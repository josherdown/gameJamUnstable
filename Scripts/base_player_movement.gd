extends CharacterBody2D


const SPEED = 300.0



func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var yDirection := Input.get_axis("moveup", "movedown")
	var xDirection := Input.get_axis("moveleft", "moveright")
	
	if xDirection:
		velocity.x = xDirection * SPEED
	else:
		velocity.x = 0
	
	
	if yDirection:
		velocity.y = yDirection * SPEED
	else:
		velocity.y = 0	

	move_and_slide()
	
	
	

#extends CharacterBody2D
#
#var direction: Vector2
#var speed := 100
#
#func _physics_process(delta: float) -> void:
	#direction = Input.get_vector('left','right','up','down')
	#velocity = direction * speed
	#animation()
	#move_and_slide()
