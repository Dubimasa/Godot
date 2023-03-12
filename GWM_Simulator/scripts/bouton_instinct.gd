#Fichier définissant le comportement du bouton d'instinct

extends Node2D

#Pourcentage d'instinct, min: 0, max: 75
var instinct_percentage

#Générateur de nombres aléatoires
var rng = RandomNumberGenerator.new()

#Booleen determinant si la partie doit se terminer
var game_over

#Constructeur, initialise l'aléatoire et fixe le pourcentage de base à 20
func _ready():
	rng.randomize()
	game_over = false
	instinct_percentage = 20

#Appelé à chaque frame, actualise l'affichage du pourcentage d'instinct
func _process(delta):
	update_percentage()

#Retourne un booleen représentant la fin du jeu, qui se produit si l'instinct atteint 0%
func check_game_over():
	if(instinct_percentage <= 0):
		game_over = true
	
	return game_over

#Incremente l'instinct d'une valeur (int percent) passée en paramètre
func increment_instinct(var percent=0):
	instinct_percentage += percent
	if(instinct_percentage > 75):
		instinct_percentage = 75
	elif(instinct_percentage < 0):
		instinct_percentage = 0
	
	return instinct_percentage

#Choisit un entier aléatoire entre 0 et 100, si inférieur au pourcentage d'instinct 
func diagnostic_success():
	var success = false;
	var livre_ouvert = get_node("../enc_ouv")
	
	if(rng.randi_range(0,100) < instinct_percentage):
		success = true
	
	livre_ouvert.nb_patients += 1
	increment_instinct(-livre_ouvert.instinct_stock)
	get_node("../affiche").Q1_donne = false
	get_node("../affiche").Q2_donne = false
	get_node("../affiche").Q3_donne = false
	get_node("../affiche").Q4_donne = false
	get_node("../horloge").verif_end_of_day_personnes()
	if(success):
		livre_ouvert.bon_diag += 1
		increment_instinct(7)
		get_node("../horloge").incremente_temps(10)
		if (livre_ouvert.end_of_day == true):
			livre_ouvert.get_node("Liste_Maladie").select(0)
			get_node("../fond_pour_animation").visible = true
			get_node("../patient").visible = false
			get_node("../Valid").visible = true
			get_node("../Valid").set_frame(0)
			get_node("../Valid").play("validation_sans_patient")
			get_node("../patient").next_patient()
		else:
			get_node("../horloge").add_personne_passe()
			livre_ouvert.get_node("Liste_Maladie").select(0)
			get_node("../fond_pour_animation").visible = true
			get_node("../patient").visible = false
			get_node("../patient").next_patient()
			get_node("../Valid").visible = true
			get_node("../Valid").set_frame(0)
			get_node("../Valid").play("validation")
	else:
		livre_ouvert.mauvais_diag += 1
		increment_instinct(-10)
		get_node("../horloge").incremente_temps(10)
		if (livre_ouvert.end_of_day == true):
			livre_ouvert.get_node("Liste_Maladie").select(0)
			get_node("../fond_pour_animation").visible = true
			get_node("../patient").visible = false
			get_node("../Valid").visible = true
			get_node("../Valid").set_frame(0)
			get_node("../Valid").play("decline_sans_patient")
			get_node("../patient").next_patient() #
		else:
			get_node("../horloge").add_personne_passe()
			livre_ouvert.get_node("Liste_Maladie").select(0)
			get_node("../fond_pour_animation").visible = true
			get_node("../patient").visible = false
			get_node("../patient").next_patient()
			get_node("../Valid").visible = true
			get_node("../Valid").set_frame(0)
			get_node("../Valid").play("decline")
	
	livre_ouvert.instinct_stock = 0

#Met à jour l'affichage du pourcentage
func update_percentage():
	$label_percent.text = str(instinct_percentage) + "%"

#Gère la visibilité de l'animation de diagnostic après son exécution, et active la fin de la journée s'il y en a besoin
func _on_Valid_animation_finished():
	var livre_ouvert = get_node("../enc_ouv")
	get_node("../Valid").visible = false
	get_node("../patient").visible = true
	get_node("../fond_pour_animation").visible = false
	if(livre_ouvert.end_of_day == true):
		get_node("../Journee").fin_jour(livre_ouvert.nb_patients, livre_ouvert.bon_diag, livre_ouvert.mauvais_diag, get_node("../horloge").get_nbr_patient_not_passed())
		livre_ouvert.reset_diags()
	livre_ouvert.end_of_day = false
