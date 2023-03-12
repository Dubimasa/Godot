#Fichier permettant de gerer entierement le livre et la partie diagnostique du joueur

extends CanvasLayer

#Variable qui va contenir le Data Generator
var DataGenerator

#Variable qui va contenir le bouton d'instinct
var btn_instinct

#Variable qui contient la liste des maladies
var liste_maladies

#Compteur de bon diagnostique
var bon_diag=0

#Compteur de mauvais diagnostique
var mauvais_diag =0

#Variable qui va etre calculer pour avoir le max de page du livre
var MAX_PAGE;

#Constante du minimum de page
const MIN_PAGE = 0

#Variable page qui va etre initialiser a 0
var page = MIN_PAGE

#Variable de la maladie a afficher sur la page 1 et 2
var maladie1 = 0
var maladie2 = 1


var instinct_stock = 0

#Variable du nombre de patients a passer dans la journée
var nb_patients = 0

#Variable booleen de la fin de la journée
var end_of_day = false


#Fonction appeler au demarrage de l'application
#On va venir generer la liste de maladies pour pouvoir les implenter dans le livre
#On fixe le nombre de page max en fonction du nombres de maladies
func _ready():
	page_finder()
	DataGenerator = get_node("../GameManager")
	btn_instinct = get_node("../Bouton_instinct")
	liste_maladies = DataGenerator.get_child(0).liste_maladies
	for mala in range(liste_maladies.size()):
		get_node("Liste_Maladie").add_item(liste_maladies[mala].name,mala)
	MAX_PAGE = (liste_maladies.size())/2

#Cette fonction va verifier si on est a la premiere ou a la derniere page pour afficher differentes informations
#La premiere page va pouvoir permettre au joueur de diagnostiquer le patient
func page_finder():
	if(page == MIN_PAGE):
		get_node("Liste_Maladie").visible = true
		get_node("Label_ListeMaladies").visible = true
		get_node("Label_page1").visible = true
		get_node("ButtonDiagnositquer").visible = true
		get_node("button_previous").visible = false
		get_node("Maladie_1").visible = false
		get_node("Maladie_2").visible = false
	else:
		get_node("Liste_Maladie").visible = false
		get_node("Label_ListeMaladies").visible = false
		get_node("Label_page1").visible = false
		get_node("ButtonDiagnositquer").visible = false
		get_node("button_previous").visible = true
		get_node("Maladie_1").visible = true
		get_node("Maladie_2").visible = true
	if(page == MAX_PAGE): 
		get_node("button_next").visible = false
	else:
		get_node("button_next").visible = true

#Cette fonction sert a changer de page et faire les verification voulu avec le page_finder
func change_page(moins_ou_plus):
	
	if(moins_ou_plus == "-"):
		page =page - 1
		page_finder()
		if(page != 0):
			maladie1 = maladie1 -2
			maladie2 = maladie2 -2
		changer_maladie_page()
	else:
		page = page + 1
		page_finder()
		if(page != 1):
			maladie1 = maladie1 +2
			maladie2 = maladie2 +2
		print(maladie1)
		print(maladie2)
		changer_maladie_page()
			
#Cette fonction appele juste deux fois une fonction pour l'affichage
func changer_maladie_page():
		affichage_page("m1")
		affichage_page("m2")

#Cette fonction va afficher sur les deux pages actuel les maladies et leurs informations
func affichage_page(a):
	if a == "m1":
		get_node("Maladie_1").bbcode_text = "[u]" +liste_maladies[self.maladie1].name + "[/u]\n" + liste_maladies[self.maladie1].description
		get_node("Maladie_1").bbcode_text += "\n\n[u]Symptomes[/u] : "
		for x in liste_maladies[self.maladie1].symptomes:
			get_node("Maladie_1").bbcode_text += "\n" + x.name
		get_node("Maladie_1").bbcode_text += "\n\n[u]Antecedents[/u] : "
		#for y in liste_maladies[self.maladie1].antecedents:
		get_node("Maladie_1").bbcode_text += "\n" + liste_maladies[self.maladie1].antecedents.name + ": " + liste_maladies[self.maladie1].antecedents.description
		get_node("Maladie_1").bbcode_text += "\n\n[u]Contexte de vie[/u] : "
		get_node("Maladie_1").bbcode_text += "\n" + liste_maladies[self.maladie1].contexte.name + ": " + liste_maladies[self.maladie1].contexte.desc
	elif(a == "m2"):
		get_node("Maladie_2").bbcode_text = "[u]" +liste_maladies[self.maladie2].name + "[/u]\n" + liste_maladies[self.maladie2].description
		get_node("Maladie_2").bbcode_text += "\n\n[u]Symptomes[/u] : "
		for u in liste_maladies[self.maladie2].symptomes:
			get_node("Maladie_2").bbcode_text += "\n" + u.name
		get_node("Maladie_2").bbcode_text += "\n\n[u]Antecedents[/u] : "
		#for o in liste_maladies[self.maladie2].antecedents:
		get_node("Maladie_2").bbcode_text += "\n" + liste_maladies[self.maladie2].antecedents.name + ": " + liste_maladies[self.maladie2].antecedents.description
		get_node("Maladie_2").bbcode_text += "\n\n[u]Contexte de vie[/u] : "
		get_node("Maladie_2").bbcode_text += "\n" + liste_maladies[self.maladie2].contexte.name + ": " + liste_maladies[self.maladie2].contexte.desc

#Cette fonction change la visibilité de la scene pour pouvori ouvrir et fermer le livre
func change_visibility():
	if(visible == true):
		self.visible = false
	else:
		self.visible = true

#Cette fonction est relier a un signal du bouton pour pouvoir diagnostiquer une maladie
func _on_ButtonDiagnositquer_pressed():
	nb_patients += 1
	btn_instinct.increment_instinct(-instinct_stock)
	var numMaladie = get_node("Liste_Maladie").get_selected_id()
	var maladieSelect = get_node("Liste_Maladie").get_item_text(numMaladie)
	var patient = get_node("../patient").patient
	get_node("../affiche").Q1_donne = false
	get_node("../affiche").Q2_donne = false
	get_node("../affiche").Q3_donne = false
	get_node("../affiche").Q4_donne = false
	print(patient[1].name)
	get_node("../horloge").verif_end_of_day_personnes()
	if(patient[1].name == maladieSelect):
		self.bon_diag += 1
		self.change_visibility()
		btn_instinct.increment_instinct(7)
		get_node("../horloge").incremente_temps(10)
		if (end_of_day ==true):
			#end_of_day = false
			get_node("Liste_Maladie").select(0)
			get_node("../fond_pour_animation").visible = true
			get_node("../patient").visible = false
			get_node("../Valid").visible = true
			get_node("../Valid").set_frame(0)
			get_node("../Valid").play("validation_sans_patient")
			#reset_diags()
			get_node("../patient").next_patient() # Ça va peut-être poser problème en fonction de comment la fin de journée sera codée
		else:
			get_node("../horloge").add_personne_passe()
			get_node("Liste_Maladie").select(0)
			get_node("../fond_pour_animation").visible = true
			get_node("../patient").visible = false
			get_node("../patient").next_patient()
			get_node("../Valid").visible = true
			get_node("../Valid").set_frame(0)
			get_node("../Valid").play("validation")
	else:
		self.mauvais_diag += 1
		self.change_visibility()
		btn_instinct.increment_instinct(-10)
		get_node("../horloge").incremente_temps(10)
		if (end_of_day == true):
			#end_of_day = false
			get_node("Liste_Maladie").select(0)
			get_node("../fond_pour_animation").visible = true
			get_node("../patient").visible = false
			get_node("../Valid").visible = true
			get_node("../Valid").set_frame(0)
			get_node("../Valid").play("decline_sans_patient")
			#reset_diags()
			get_node("../patient").next_patient() #
		else:
			get_node("../horloge").add_personne_passe()
			get_node("Liste_Maladie").select(0)
			get_node("../fond_pour_animation").visible = true
			get_node("../patient").visible = false
			get_node("../patient").next_patient()
			get_node("../Valid").visible = true
			get_node("../Valid").set_frame(0)
			get_node("../Valid").play("decline")
	
	instinct_stock = 0

#Cette fonction passe a la page suivante
func _on_button_next_pressed():
	change_page("+")
	get_node("../horloge").incremente_temps(2)

#Cette fonction passe a la page precedente
func _on_button_previous_pressed():
	change_page("-")
	get_node("../horloge").incremente_temps(2)

#Cette fonction est relié a un signal pour attendre la fin de l'animation entre les patients
func _on_Valid_animation_finished():
	get_node("../Valid").visible = false
	get_node("../patient").visible = true
	get_node("../fond_pour_animation").visible = false
	if(end_of_day == true):
		get_node("../Journee").fin_jour(nb_patients, bon_diag, mauvais_diag, get_node("../horloge").get_nbr_patient_not_passed())
		reset_diags()
	end_of_day = false

#Cette fonction est fais pour quitter le livre
func _on_bouton_quiiter_pressed():
	self.change_visibility()

#Cette fonction est faite pour revenir a la page pour diagnostiquer le patient
func _on_button_accueil_pressed():
	page =0
	page_finder()
	maladie1 = 0
	maladie2 = 1

#Cette fonction sert a arreter une journ
func stop_day():
	end_of_day = true

#Cette fonction va reset les diagnostiques pour les nouvelles journées
func reset_diags():
	nb_patients = 0
	bon_diag = 0
	mauvais_diag = 0
