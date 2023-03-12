#Le fichier qui permet de gérer le clic sur le bouton pour quitter la partie en cours

extends Node2D


#Appelée lorsque le node entre dans l'arbre de scènes pour la première fois, rend le bouton invisible
func _ready():
	self.visible = false


#Appelée lors du clic sur le bouton "revenir en arrière", permet d'annuler l'action s'il s'agissait d'une erreur
func _on_Button_revenir_pressed():
	self.visible = false

#Appelée lors du clic sur le bouton "Quitter la partie", permet de valider l'action et de quitter la partie en cours vers le menu principal
func _on_Button_quitter_pressed():
	get_tree().change_scene("res://scenes/menu.tscn")

#Appelée lors du clic sur le bouton quitter dans la fenêtre de jeu, permet d'afficher un choix (valider ou revenir en arrière)
func _on_button_quitter_pressed():
	self.visible = true
