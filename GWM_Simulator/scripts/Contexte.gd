#Le fichier permettant la définition de la structure d'un contexte de vie

extends Resource

#La description d'un contexte de vie
export(String) var desc
#Le nom d'un contexte de vie
export(String) var name

#Fonction définissant les attributs d'un contexte de vie
func _init(nam="", description=""):
	name = nam
	desc = description

#Appelée pour récupérer le nom du contexte de vie
func getName():
	return name
