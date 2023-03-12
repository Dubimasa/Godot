#Ce fichier permet de gérer et de répondre aux clics sur les questions que le médecin pose au patient

extends Node2D

#La variable représentant le premier ou les deux premiers symptômes correspondants à une maladie
var symptome

#La variable représentant l'antécédant correspondant à une maladie
var antecedent

#La variable représentant le contexte de vie correspondant à une maladie
var contexte

#Le dernier symptôme d'une maladie, caché et demandant plus de temps à dévoiler
var symptome_cache

#Variable dans laquelle on va stocker les appels aux méthodes de la classe patient
var patient

#Variable représentant le nombre de symptômes de chaque maladie
var nb_symptomes

#Variable représentant le statut de la question sur les symptômes (déjà cliquée ou non)
var symptome_clicked = false

#Variable représentant le statut de la question sur les antécédants (déjà cliquée ou non)
var antecedant_clicked = false

#Variable représentant le statut de la question sur les contextes de vie (déjà cliquée ou non)
var contexte_clicked = false

#Variables Q1_donne à Q4_donne : pour déterminer si une question a déjà été posée
var Q1_donne = false
var Q2_donne = false
var Q3_donne = false
var Q4_donne = false

#Appelée lorsqu'on pose au patient une question sur ses symptômes, et fait répondre le patient et incrémenter le temps de l'horloge. Permet également de débloquer la question sur le symptôme caché  si une autre question a déjà été posée
func _on_Q1_pressed():
	get_node("../patient").parole_visible()
	get_node("../Pensee_Medecin").pensee_invisible()
	if(!Q1_donne):
		get_node("../enc_ouv").instinct_stock += 5
		get_node("../Bouton_instinct").increment_instinct(5)
		get_node("../horloge").incremente_temps(5)
		Q1_donne = true
	patient = get_node("../patient").patient
	nb_symptomes = patient[1].symptomes.size()
	symptome = ""
	symptome += patient[1].symptomes[0].name
	if (nb_symptomes == 3):
		symptome += ", " + patient[1].symptomes[1].name
	get_node("../patient").repondre("Mon symptome est le suivant : " + symptome)
	symptome_clicked = true
	count_clicked()

#Appelée lorsqu'on pose au patient une question sur ses antécédants, et fait répondre le patient et incrémenter le temps de l'horloge. Permet également de débloquer la question sur le symptôme caché  si une autre question a déjà été posée
func _on_Q2_pressed():
	get_node("../patient").parole_visible()
	get_node("../Pensee_Medecin").pensee_invisible()
	if(!Q2_donne):
		get_node("../enc_ouv").instinct_stock += 5
		get_node("../Bouton_instinct").increment_instinct(5)
		get_node("../horloge").incremente_temps(10)
		Q2_donne = true
	patient = get_node("../patient").patient
	antecedent = patient[1].antecedents.name
	get_node("../patient").repondre("J'ai deja contracté " + antecedent)
	antecedant_clicked = true
	count_clicked()

#Appelée lorsqu'on pose au patient une question sur son contexte de vie, et fait répondre le patient et incrémenter le temps de l'horloge. Permet également de débloquer la question sur le symptôme caché  si une autre question a déjà été posée
func _on_Q3_pressed():
	get_node("../patient").parole_visible()
	get_node("../Pensee_Medecin").pensee_invisible()
	if(!Q3_donne):
		get_node("../enc_ouv").instinct_stock += 5
		get_node("../Bouton_instinct").increment_instinct(5)
		get_node("../horloge").incremente_temps(15)
		Q3_donne = true
	patient = get_node("../patient").patient
	contexte = patient[1].contexte.name
	get_node("../patient").repondre("Dans le passé, j'ai été " + contexte)
	contexte_clicked = true
	count_clicked()

#Appelée lorsque l'on examine le patient, et fait en sorte que le médecin pense au symptôme caché et incrémente le temps de l'horloge (question bloquée, se débloque quand au moins deux autres questions ont été posées)
func _on_Q4_pressed():
	if ($Affiche/Q4/lock.visible):
		null
	else:
		if(!Q4_donne):
			get_node("../enc_ouv").instinct_stock += 5
			get_node("../Bouton_instinct").increment_instinct(5)
			get_node("../horloge").incremente_temps(20)
			Q4_donne = true
		get_node("../patient").parole_invisible()
		get_node("../Pensee_Medecin").pensee_visible()
		patient = get_node("../patient").patient
		nb_symptomes = patient[1].symptomes.size()
		if (nb_symptomes == 3):
			symptome_cache = patient[1].symptomes[2].name
		else :
			symptome_cache = patient[1].symptomes[1].name
		get_node("../Pensee_Medecin").penser(symptome_cache)

#Appelée pour savoir combien de boutons ont été cliqués au moins une fois
func count_clicked():
	var count = 0
	if (antecedant_clicked):
		count += 1
	if (symptome_clicked):
		count += 1
	if (contexte_clicked):
		count += 1
	if (count >= 2):
		unlock_q4()

#Appelée pour débloquer la question 4
func unlock_q4():
	$Affiche/Q4/lock.visible = false

#Appelée pour bloquer la question 4
func lock_q4():
	$Affiche/Q4/lock.visible = true
	reset_counters()

#Appelée lors du bloquage de la question 4, sert à remettre à zéro les compteurs de clics
func reset_counters():
	contexte_clicked = 0
	symptome_clicked = 0
	antecedant_clicked = 0
