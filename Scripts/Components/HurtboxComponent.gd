extends Node2D
class_name HurtboxComponent

@export var healthComponent: HealthComponent


func damaged(attack:Attack):
	if healthComponent:
		healthComponent.takeDamage(attack)
