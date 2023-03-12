#Fichier gérant le clic sur l'encyclopédie fermée

extends Node2D


#Fonction permettant d'afficher le contenu de l'encyclopédie au joueur
func _on_livre_pressed():
	get_node("../enc_ouv").change_visibility()
