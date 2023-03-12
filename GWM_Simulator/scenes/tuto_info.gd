#Le fichier permettant de gérer les actions faites sur la page de tutoriel

extends Node2D


#Appelée lorsque le node entre dans l'arbre de scènes pour la première fois, rend la scène de tuto visible
func _ready():
	self.visible = false


#Fonction permettant de quitter le tutoriel vers la partie en cours lors du click sur la croix rouge prévue à cet effet
func _on_button_quitter_pressed():
	self.visible = false
