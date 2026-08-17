extends Node2D
class_name HealthComponent

var health: float
@export var maxHealth: float = 10


func _ready() -> void:
	health = maxHealth


func takeDamage(attack:Attack):
	health -= attack.attackDamage
	
	
	# probs replace with death animation later down the line
	# GET_PARENT() TWICE ASSUMING THAT HEALTHCOMPONENT NODE IS A CHILD TO A GENERAL COMPONENTS NODE, OF WHICH IS A CHILD TO THE ENTITY
	if health <= 0:
		get_parent().get_parent().queue_free() 
