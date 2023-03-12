#Le fichier permettant de gérer les inputs sur la scène de game over

extends Node2D

#Appelée pour passer à la scène de jeu et recommencer une partie
func _on_Button_recommencer_pressed():
	get_tree().change_scene("res://Jeu.tscn")

#Appelée pour passer à la scène de menu principal
func _on_Button_quitter_pressed():
	get_tree().change_scene("res://scenes/menu.tscn")
