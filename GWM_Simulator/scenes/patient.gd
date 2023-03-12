#Fichier permettant de gérer l'affichage des patients et de leurs bulles de parole

extends Node2D

#Variable utilisée pour choisir un patient au hasard
var rng = RandomNumberGenerator.new()

#Variable dans laquelle on va récupérer la liste de patients
var liste_patients

#Variable contenant la taille de la liste de patients
var taille

#Variable utilisée pour choisir un patient au hasard
var rand

#Variable utilisée pour afficher l'image du patient
var texture

#Variable représentant l'image du patient
var image

#Variable représentant la ressource Patient
var patient

#Variable représentant la bulle de pensée du médecin utilisée lors de l'examination d'un patient
var pensee

#Variable utilisée pour ne pas faire passer deux fois le même patient en une journée
var lst_patients_passes = []


#Appelée lorsque le node entre dans l'arbre de scènes pour la première fois, permet d'initialiser les variables et d'afficher un premier patient
func _ready():
	liste_patients = get_node("../GameManager").liste_patients
	taille = liste_patients.size()
	texture = ImageTexture.new()
	image = Image.new()
	pensee = get_node("../Pensee_Medecin")
	next_patient()

#Fonction permettant d'afficher un personnage au hasard de la liste des personnages de la journée. Empêche également d'avoir deux fois le même patient dans la même journée et vide les bulles de paroles et de pensée
func next_patient():
	liste_patients = get_node("../GameManager").liste_patients
	rng.randomize()
	rand = rng.randi_range(0,taille - 1)
	if (lst_patients_passes.size() == 0):
		patient = liste_patients[rand]
		lst_patients_passes.append(patient)
	else :
		patient = liste_patients[rand]
		while (lst_patients_passes.has(patient)):
			rand = rng.randi_range(0,taille - 1)
			patient = liste_patients[rand]
		lst_patients_passes.append(patient)
	
	var stream_texture = load(patient[0].imgpath)
	image = stream_texture.get_data()
	texture.create_from_image(image)
	$patient.texture = texture
	clean_bulles()
	get_node("../affiche").lock_q4()


#Appelée pour qu'un patient dise ce que l'on passe en argument
func repondre(texte):
	$Parole/bulle.text = texte

#Appelée pour rendre la bulle de parole d'un patient visible
func parole_visible():
	$Parole.visible = true

#Appelée pour rendre la bulle de parole d'un patient invisible
func parole_invisible():
	$Parole.visible = false

#Appelée pour vider les bulles des patients et la bulle de pensée du médecin
func clean_bulles():
	$Parole/bulle.text=""
	parole_invisible()
	pensee.clean_pensee()
