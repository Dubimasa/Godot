#Le fichier permettant la définition de la structure d'une maladie

extends Resource

#Le nom d'une maladie
export(String) var name

#La description d'une maladie
export(String) var description

#L'antécédent correspondant à une maladie
export(Resource) var antecedents

#Les symptômes correspondant à une maladie
export(Array,Resource) var symptomes

#Le contexte de vie correspondant à une maladie
export(Resource) var contexte

#Fonction définissant les attributs d'une maladie (avec entre autres les ressources Contexte, Antécédant et Symptômes définies auparavant)
func _init(nam="",desc="",ante=Resource,sympt=[Resource], cont=Resource):
	name = nam
	description = desc
	antecedents = ante
	symptomes = sympt
	contexte = cont
