#Le fichier permettant la définition de la structure d'un antécédant

extends Resource

export(String) var name
export(String) var description

#Fonction définissant les attributs d'un antécédant
func _init(nam="",desc=""):
	name = nam
	description = desc

#Appelée pour récupérer le nom de l'antécédent
func getName():
	return name
