#Le fichier utilisé pour gérer les clics sur les boutons de la page d'accueil du jeu.

extends Node2D


#Appelée quand le bouton "Commencer une partie" est pressé, permet de passer à la scène de jeu
func _on_button_commencer_pressed():
	get_tree().change_scene("res://Jeu.tscn")

#Appelée quand le bouton "Quitter" est pressé, permet de fermer la fenêtre de jeu
func _on_button_quitter_pressed():
	get_tree().quit()

#Appelée quand le bouton "Paramètres" est pressé, permet de passer à la scène des réglages du jeu
func _on_button_parametre_pressed():
	get_tree().change_scene("res://scenes/parametre.tscn")
