#Script générant les données du jeu à partir de resources enregistrées localement

extends Node

#Variable contenant le chemin vers le script de création des maladies
const Maladie=preload("res://scripts/Maladie.gd")

#Variable pour la génération de nombre aléatoires
var rng = RandomNumberGenerator.new()

#Liste des maladies
var liste_maladies = []
#Liste des symptomes
var liste_symptomes = {}
#Liste des antecedents
var liste_antecedents = {}
#Liste des personnes
var liste_personnes = []
#Liste des contextes
var liste_contextes = {}
#Variable acceuillant le dossier en cours d'extraction
var dir

#Appelé à l'initialisation du script
#Initialise le générateur aléatoire
#Génère les antecedents, symptomes, contextes, maladies, personnes
func _ready():
	rng.randomize()
	#print("| generation antecedents |")
	liste_antecedents = generate_antecedents()
	#print("| generation symptomes |")
	liste_symptomes = generate_symptomes()
	#print("| generation contextes |")
	liste_contextes = generate_contextes()
	#print("| generation maladies |")
	liste_maladies = generate_maladies()
	#print("| generation personnes |")
	liste_personnes = generate_personnes()

#Génère les antécédents à partir des resources Godot locales
#Un antécédent possède un nom et une description
func generate_antecedents():
	var antecedents = {}
	dir = Directory.new()
	var dirpath = "resources/Antecedents/"
	
	if(dir.open("res://"+dirpath) == OK):
		dir.list_dir_begin()
	else:
		print("An error occurred when trying to access the path.")
		return -1
	
	var file_name = dir.get_next()
	while file_name != "":
		if dir.current_is_dir():
			#print("dir:"+file_name)
			file_name = dir.get_next()
		else:
			#print("file:"+file_name)
			var ante = load(dirpath+file_name)
			antecedents[ante.name]=ante
			#print(antecedents[ante.name].name)
			file_name = dir.get_next()
	
	return antecedents

#Génère les symptomes à partir des resources Godot locales
#Un symptome possède un nom
func generate_symptomes():
	var symptomes = {}
	dir = Directory.new()
	var dirpath = "resources/Symptomes/"
	
	if(dir.open("res://"+dirpath) == OK):
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				#print("dir:"+file_name)
				file_name = dir.get_next()
			else:
				#print("file:"+file_name)
				var symp = load(dirpath+file_name)
				symptomes[symp.name]=symp
				#print(symptomes[symp.name].name)
				file_name = dir.get_next()
	else:
		print("An error occurred when trying to access the path.")
	
	return symptomes

#Génère les maladies et les enregistre localement
#Un maladies possède un nom, une description, une liste de symptomes, un antécédent et un contexte de vie
func generate_maladies():
	var maladies = []
	#var dirpath = "resources/Maladies/"
	
	#var maladie = Maladie.new("Gachaddiction","Degradation progressive du corps et de l'esprit",
	#liste_antecedents.get("Genshin Impact"),[liste_symptomes.get("Mal de tête")],liste_contextes.get("Casanier");
	maladies.append(Maladie.new("Turboviolence",
	"Être ultra violent",
	liste_antecedents.get("Grosse rage"),
	[liste_symptomes.get("Tiroir à pisse"),
	liste_symptomes.get("Vote à droite")],
	liste_contextes.get("Joueur de LoL")))
	
	maladies.append(Maladie.new("Démence",
	"Pov : ta grand-mère",
	liste_antecedents.get("Ingérer de l'amiante"),
	[liste_symptomes.get("Gachaddiction"),
	liste_symptomes.get("Se sent observé")],
	liste_contextes.get("Joueur de LoL")))
	
	maladies.append(Maladie.new("Amnésie",
	"J'ai oublié la définition.",
	liste_antecedents.get("Cours de Maths"),
	[liste_symptomes.get("Perte de mémoire"),
	liste_symptomes.get("Peur des imposteurs")],
	liste_contextes.get("Gamer")))
	
	maladies.append(Maladie.new("Overdose de sel",
	"Tu connais Sardoche ?",
	liste_antecedents.get("Grosse rage"),
	[liste_symptomes.get("Gachaddiction"),
	liste_symptomes.get("Effondrement intestinal")],
	liste_contextes.get("Joueur de LoL")))
	
	maladies.append(Maladie.new("L'H-llergie",
	"Trivial",
	liste_antecedents.get("Cours de Maths"),
	[liste_symptomes.get("Se sent observé"),
	liste_symptomes.get("Vote à droite")],
	liste_contextes.get("Etudiant en BUT INFO")))
	
	maladies.append(Maladie.new("L’uglyBastardification",
	"When you become a fat ugly cuckholding man",
	liste_antecedents.get("Genshin Impact"),
	[liste_symptomes.get("Être moche"),
	liste_symptomes.get("Mauvaise haleine")],
	liste_contextes.get("Etudiant en BUT INFO")))
	
	maladies.append(Maladie.new("L’anatidaephobia",
	"La peur de se faire observer en permanence par un canard (oui, ça existe)",
	liste_antecedents.get("Blague Nulle"),
	[liste_symptomes.get("Se sent observé"),
	liste_symptomes.get("Peur de la solitude")],
	liste_contextes.get("Gamer")))
	
	maladies.append(Maladie.new("Mogusphobia",
	"Jouez à Among us VR",
	liste_antecedents.get("Pas une lumière"),
	[liste_symptomes.get("Peur de la solitude"),
	liste_symptomes.get("Peur des imposteurs")],
	liste_contextes.get("Utilisateur de Twitter")))
	
	maladies.append(Maladie.new("Nerdified",
	"Hum, actually, according to studies it's not an illness",
	liste_antecedents.get("Genshin Impact"),
	[liste_symptomes.get("Être moche"),
	liste_symptomes.get("Tiroir à pisse"),
	liste_symptomes.get("Mauvaise haleine")],
	liste_contextes.get("Casanier")))
	
	maladies.append(Maladie.new("Ratiophobie",
	"Quand tu est Elon Musk",
	liste_antecedents.get("Blague Nulle"),
	[liste_symptomes.get("Peur de la solitude"),
	liste_symptomes.get("Peur des imposteurs")],
	liste_contextes.get("Utilisateur de Twitter")))
	
	maladies.append(Maladie.new("Simping",
	"Quand tu développes un engouement envers des femmes, leur permettant de prendre contrôle sur ton esprit et te faire faire des choses pour elles que tu ne ferais pas normalement",
	liste_antecedents.get("Ingérer de l'amiante"),
	[liste_symptomes.get("Peur de la solitude"),
	liste_symptomes.get("Tiroir à pisse")],
	liste_contextes.get("Casanier")))
	
	maladies.append(Maladie.new("O'Tacos",
	"Tu as un estomac faible ? Ne t'en approche pas",
	liste_antecedents.get("Ingérer de l'amiante"),
	[liste_symptomes.get("Effondrement intestinal"),
	liste_symptomes.get("Mauvaise haleine")],
	liste_contextes.get("Gamer")))
	
	maladies.append(Maladie.new("BFMTV Enjoyer",
	"Overload d'informations débiles",
	liste_antecedents.get("Pas une lumière"),
	[liste_symptomes.get("Perte de mémoire"),
	liste_symptomes.get("Vote à droite")],
	liste_contextes.get("Utilisateur de Twitter")))
	
	maladies.append(Maladie.new("La coulante",
	"Dis adieu à tes WC",
	liste_antecedents.get("Cours de Maths"),
	[liste_symptomes.get("Perte de mémoire"),
	liste_symptomes.get("Effondrement intestinal")],
	liste_contextes.get("Etudiant en BUT INFO")))
	
	return maladies

#Génère les personnes à partir des resources Godot locales
#Une personne possède un nom et un prénom
func generate_personnes():
	var personnes = []
	dir = Directory.new()
	var dirpath = "resources/Personnes/"
	
	if(dir.open("res://"+dirpath) == OK):
		dir.list_dir_begin()
	else:
		print("An error occurred when trying to access the path.")
		return -1
	
	var file_name = dir.get_next()
	while file_name != "":
		if dir.current_is_dir():
			#print("dir:"+file_name)
			file_name = dir.get_next()
		else:
			#print("file:"+file_name)
			var pers = load(dirpath+file_name)
			personnes.append(pers)
			#print(pers.name)
			file_name = dir.get_next()
	
	return personnes


#Génère les patients à partir des resources du script
#Un patient est composé d'une personne et d'une maladie
func generate_patients():
	var patients=[]
	
	for p in liste_personnes:
		var nb_maladie = rng.randi_range(0,liste_maladies.size()-1)
		patients.append([p,liste_maladies[nb_maladie]])
		var mala = liste_maladies[nb_maladie].name
		print("Gen patients: " + p.name + " " + mala)
	
	return patients

#Génère les contextes à partir des resources Godot locales
#Un antécédent possède un nom et une description
func generate_contextes():
	var contextes = {}
	dir = Directory.new()
	var dirpath = "resources/Contextes/"
	
	if(dir.open("res://"+dirpath) == OK):
		dir.list_dir_begin()
	else:
		print("An error occurred when trying to access the path.")
		return -1
	
	var file_name = dir.get_next()
	while file_name != "":
		if dir.current_is_dir():
			print("dir:"+file_name)
			file_name = dir.get_next()
		else:
			print("file:"+file_name)
			var con = load(dirpath+file_name)
			contextes[con.name]=con
			print(contextes[con.name].name)
			file_name = dir.get_next()
	return contextes
