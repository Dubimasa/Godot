extends Node2D

#Bouton pour revenir aux parametres
func _on_button_retour_pressed():
	get_tree().change_scene("res://scenes/parametre.tscn")

#Bouton pour acceder a la licence godot (va ouvrir un navigateur)
func _on_Button_licence_pressed():
	OS.shell_open("https://docs.godotengine.org/en/stable/about/complying_with_licenses.html")
