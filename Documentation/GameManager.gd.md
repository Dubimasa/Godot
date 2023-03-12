<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# GameManager.gd

**Extends:** [Node](../Node)

## Description

Fichier permettant, par un appel à DataGenerator, de récupérer une liste de patients aléatoires auxquels on a affecté une maladie

## Property Descriptions

### liste\_patients

```gdscript
var liste_patients
```

La liste de patient en question, utilisée lorsqu'on a besoin de récupérer des données concernant le patient ou sa maladie

### DataGenerator

```gdscript
var DataGenerator
```

Variable à laquelle on va affecter les appels à DataGenerator

### game\_is\_over

```gdscript
var game_is_over
```

Variable indiquant que le jeu est terminé

## Method Descriptions

### regenerate\_patients

```gdscript
func regenerate_patients()
```

Fonction permettant de générer la liste de patients et de l'affecter à la variable prévue à cet effet

### game\_over

```gdscript
func game_over()
```

Fonction affichant l'écran de défaite