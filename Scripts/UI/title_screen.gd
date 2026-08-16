extends Control



func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main_game.tscn")


func _on_settings_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/UI/settings.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()
