<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# DataGenerator.gd

**Extends:** [Node](../Node)

## Description

Script générant les données du jeu à partir de resources enregistrées localement

## Constants Descriptions

### Maladie

```gdscript
const Maladie: GDScript = preload("res://scripts/Maladie.gd")
```

Variable contenant le chemin vers le script de création des maladies

## Property Descriptions

### rng

```gdscript
var rng
```

Variable pour la génération de nombre aléatoires

### liste\_maladies

```gdscript
var liste_maladies
```

Liste des maladies

### liste\_symptomes

```gdscript
var liste_symptomes
```

Liste des symptomes

### liste\_antecedents

```gdscript
var liste_antecedents
```

Liste des antecedents

### liste\_personnes

```gdscript
var liste_personnes
```

Liste des personnes

### liste\_contextes

```gdscript
var liste_contextes
```

Liste des contextes

### dir

```gdscript
var dir
```

Variable acceuillant le dossier en cours d'extraction

## Method Descriptions

### generate\_antecedents

```gdscript
func generate_antecedents()
```

Génère les antécédents à partir des resources Godot locales
Un antécédent possède un nom et une description

### generate\_symptomes

```gdscript
func generate_symptomes()
```

Génère les symptomes à partir des resources Godot locales
Un symptome possède un nom

### generate\_maladies

```gdscript
func generate_maladies()
```

Génère les maladies et les enregistre localement
Un maladies possède un nom, une description, une liste de symptomes, un antécédent et un contexte de vie

### generate\_personnes

```gdscript
func generate_personnes()
```

Génère les personnes à partir des resources Godot locales
Une personne possède un nom et un prénom

### generate\_patients

```gdscript
func generate_patients()
```

Génère les patients à partir des resources du script
Un patient est composé d'une personne et d'une maladie

### generate\_contextes

```gdscript
func generate_contextes()
```

Génère les contextes à partir des resources Godot locales
Un antécédent possède un nom et une description