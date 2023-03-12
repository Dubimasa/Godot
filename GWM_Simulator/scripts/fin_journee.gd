#Le fichier permettant de gérer les inputs sur le résumé d'une journée

extends Node2D


#Appelée lors du clic sur le bouton "Journée suivante" dans le résumé d'une journée, remets le temps à sa valeur initiale et cache le résumé journalier. Si le joueur a survécu 5 jours, active l'écran de win
func _on_jour_prochain_pressed():
	get_node("../../horloge").set_time(8, 0)
	get_node("../../horloge").incremente_temps(0)
	get_node("../../horloge").set_nbr_personne_passe(1)
	print("-----" + str(get_node("../").jour) + "-----")
	if (get_node("../").jour > 5):
		print("here")
		get_tree().change_scene("res://scenes/Win.tscn")
	else:
		get_node("../").end_unvisible()

#Appelée lors du clic sur le bouton quitter du résumé d'une journée, renvoie vers le menu principal
func _on_Quitter_pressed():
	get_tree().change_scene("res://scenes/menu.tscn")
