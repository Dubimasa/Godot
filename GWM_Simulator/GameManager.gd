#Fichier permettant, par un appel à DataGenerator, de récupérer une liste de patients aléatoires auxquels on a affecté une maladie

extends Node


#La liste de patient en question, utilisée lorsqu'on a besoin de récupérer des données concernant le patient ou sa maladie
var liste_patients = []
#Variable à laquelle on va affecter les appels à DataGenerator
var DataGenerator
#Variable indiquant que le jeu est terminé
var game_is_over

# Appelée quand le node entre dans l'arbre de scènes pour la première fois, initialise les variables DataGenerator et game_is_over et regénère la liste de patients
func _ready():
	DataGenerator = $DataGenerator
	game_is_over = false
	regenerate_patients()

#Appelé à chaque frame, regarde si la partie est terminée et appelle la fin de partie si c'est le cas
func _process(delta):
	var btn_instinct = get_node("../Bouton_instinct")
	if(btn_instinct.check_game_over() && !game_is_over):
		game_is_over = true
		game_over()

#Fonction permettant de générer la liste de patients et de l'affecter à la variable prévue à cet effet
func regenerate_patients():
	liste_patients = DataGenerator.generate_patients()

#Fonction affichant l'écran de défaite
func game_over():
	get_tree().change_scene("res://scenes/game_over.tscn")
