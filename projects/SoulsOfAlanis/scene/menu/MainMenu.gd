extends Control

export (PackedScene) var CREDIT_SCENE = null
export (PackedScene) var StartScene = null#preload("res://scene/control/root.tscn").instance()

func _ready():
	return

func _on_Credits_pressed():
	get_tree().change_scene_to(CREDIT_SCENE)
	return

func _on_Exit_pressed():
	get_tree().quit()
	return

func _on_NewGame_pressed():
	$FadeIn.show()
	$FadeIn.fade_in()
	return

func _on_FadeIn_fade_finished():
	get_tree().change_scene_to(StartScene)
	return
