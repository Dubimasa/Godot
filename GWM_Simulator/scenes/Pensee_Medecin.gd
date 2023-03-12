#Fichier utilisé pour gérer la bulle de pensée du médecin

extends Node2D


#Fonction appelée pour faire en sorte que le médecin pense (qu'il informe le joueur du symptôme caché)
func penser(symptome):
	$examination/pensee.text = "Ce patient a un symptome en plus dont il n'a pas parle : " + symptome

#Fonction appelée pour rendre la bulle de pensée du médecin visible
func pensee_visible():
	$examination.visible = true

#Fonction appelée pour rendre la bulle de pensée du médecin invisible
func pensee_invisible():
	$examination.visible = false

#Fonction appelée pour vider la bulle de pensée du médecin et la rendre invisible
func clean_pensee():
	$examination/pensee.text=""
	pensee_invisible()
