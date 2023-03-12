<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# Personne.gd

**Extends:** [Resource](../Resource)

## Description

Le fichier permettant la définition de la structure d'une personne

## Property Descriptions

### name

```gdscript
export var name = ""
```

Le prénom d'un patient

### lastname

```gdscript
export var lastname = ""
```

Le nom d'un patient

### imgpath

```gdscript
export var imgpath = ""
```

Le chemin vers l'image (en partant de 'res://', le dossier racine de notre jeu)

## Method Descriptions

### \_init

```gdscript
func _init(nam = "", lastnam = "", img = "")
```

Fonction définissant les attributs d'une personne (prénom, nom et image)