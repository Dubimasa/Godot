#Fichier qui va afficher la scene quand un joueur a gagner

extends Node2D

#Bouton pour quitter la partie
func _on_Button_menu_pressed():
	get_tree().change_scene("res://scenes/menu.tscn")

#Bouton pour recommencer une partie
func _on_Button_recommencer_pressed():
	get_tree().change_scene("res://Jeu.tscn")
