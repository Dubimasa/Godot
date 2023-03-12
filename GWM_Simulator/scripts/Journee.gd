#Fichier permettant d'afficher le résumé d'une journée

extends Node2D

#Variable permettant de compter le nombre de jours passés à soigner des patients
var jour = 1

#Variable utilisée pour stocker le nombre de patients qui veulent se faire soigner par journée
var nb_patients = 3

#Fonction permettant d'afficher sur le résumé de la journée les informations sur le nombre de bons et de mauvais diagnostics ainsi que de personnes non reçues par manque de temps, et rend visible la scène de fin de journée (régénère également la liste de patients)
func fin_jour(nb_patients_passe, nb_patients_soignes, nb_patients_morts,nb_patients_non_diagnositique):
	$fin_journee/nbr_rendu.text = str(jour)
	print(jour)
	jour += 1
	print(jour)
	$fin_journee/nbr_operee.text = str(nb_patients_passe)
	$fin_journee/nbr_save.text = str(nb_patients_soignes)
	$fin_journee/nbr_mal_operee.text = str(nb_patients_morts)
	$fin_journee/nbr_non_operee.text = str(nb_patients_non_diagnositique)
	end_visible()
	get_node("../GameManager").regenerate_patients()
	if (!(get_node("../horloge").nbr_personnes == 11)):
		nb_patients += 2
	get_node("../horloge").set_nbr_personne(nb_patients)
	get_node("../patient").lst_patients_passes = []

#Fonction appelée pour rendre la scène de fin de journée visible
func end_visible():
	$fin_journee.visible = true

#Fonction appelée pour rendre la scène de fin de journée invisible
func end_unvisible():
	$fin_journee.visible = false
