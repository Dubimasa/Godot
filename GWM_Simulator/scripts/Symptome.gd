#Le fichier permettant la définition de la structure d'un symptôme

extends Resource

#Le nom d'un symptôme
export(String) var name

#Fonction définissant l'attribut d'un symptôme
func _init(nam=""):
	name = nam
