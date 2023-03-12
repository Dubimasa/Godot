#Le fichier permettant la définition de la structure d'une personne

extends Resource

#Le prénom d'un patient
export(String) var name

#Le nom d'un patient
export(String) var lastname

#Le chemin vers l'image (en partant de 'res://', le dossier racine de notre jeu)
export(String) var imgpath

#Fonction définissant les attributs d'une personne (prénom, nom et image)
func _init(nam="",lastnam="",img=""):
	name = nam
	lastname = lastnam
	imgpath = img
