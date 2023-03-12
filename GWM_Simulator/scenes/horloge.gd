#Fichier gérant l'horloge et le compteur de patients 

extends Node2D


#Variable représentant l'heure maximum d'une journée
var heure_max = 24
#Variable représentant l'heure de fermeture du cabinet
var heure_stop_travail = 12
#Variable représentant l'heure courante (sa valeur par défaut étant l'heure d'ouverture du cabinet)
var heures = 8
#Variable représentant les minutes
var minutes = 0
#Variable représentant le nombres de patients à passer
var nbr_personnes
#Variable représentant le nombres de patients ayant déja passé
var nbr_personnes_passe = 1

# Appelée quand le node entre dans l'arbre de scènes pour la première fois, initialise la variable nbr_personnes et affiche ce nombre sur le compteur de patients
func _ready():
	nbr_personnes = 3
	$nbr_personne.text = str(nbr_personnes)

#Fonction qui incrémente l'horloge d'un montant donné en paramètre à la fonction, et qui envoie un signal à une méthode de la scène livre_ouvert lors de la fin d'une journée de travail
func incremente_temps(temps_a_rajouter):
	set_time(heures, minutes + temps_a_rajouter)
	if (minutes > 59):
		minutes = minutes % 60
		heures += 1
	$temps.text = temps_00(heures) + " : " + temps_00(minutes)
	if (heures >= 12):
		get_node("../enc_ouv").stop_day()

#Fonction utilisée pour homogénéiser le format d'affichage du temps
func temps_00(val):
	if(val < 10):
		return "0" + str(val)
	else:
		return str(val)

#Fonction utilisée pour affecter des valeurs précises à l'horloge (également utilisée par incremente_temps())
func set_time(heure, minute):
	heures = heure
	minutes = minute

#Fonction utilisée pour affecter des valeurs précises au compteur de patients
func set_nbr_personne(nb_personne):
	nbr_personnes = nb_personne
	$nbr_personne.text = str(nb_personne)
	
#Fonction utilisée pour affecter des valeurs précises au compteur de patients
func set_nbr_personne_passe(nb_personne):
	nbr_personnes_passe = nb_personne
	$nbr_personne_passe.text = str(nb_personne)

#Fonction appelée pour incrémenter le nombre de patients reçus dans le cabinet 
func add_personne_passe():
	nbr_personnes_passe +=  1
	set_nbr_personne_passe(nbr_personnes_passe)

func verif_end_of_day_personnes():
	if(nbr_personnes_passe == nbr_personnes):
		get_node("../enc_ouv").stop_day()
		nbr_personnes_passe -= 1
#Appelée pour récupérer le nombre de personnes qui n'ont pas été diagnostiquées dans la journée (par manque de temps)
func get_nbr_patient_not_passed():
	return nbr_personnes - nbr_personnes_passe
