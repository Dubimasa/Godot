#Le fichier permettant de gérer la scène des options du jeu

extends Node2D


# Appelée lorsque le node entre l'arbre de scènes pour la première fois et vérifie si la fenêtre est en plein écran ou non
func _ready():
	estPE()


#Fonction permettant de changer le statut de l'option plein écran
func estPE():
	if(OS.window_fullscreen == false):
		get_node("Button_pe").text = "Off"
	else:
		get_node("Button_pe").text = "On"

#Appelée lors du clic sur le bouton pour revenir au menu principal du jeu, utilisation évidente
func _on_TextureButton_pressed():
	get_tree().change_scene("res://scenes/menu.tscn")

#Fonction permettant de passer la fenêtre en plein écran ou inversement
func _on_Button_pe_pressed():
	OS.window_fullscreen = !OS.window_fullscreen
	estPE()

func _on_Button_credit_pressed():
	get_tree().change_scene("res://scenes/Credit.tscn")
