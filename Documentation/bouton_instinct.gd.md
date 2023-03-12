<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# bouton\_instinct.gd

**Extends:** [Node2D](../Node2D)

## Description

Fichier définissant le comportement du bouton d'instinct

## Property Descriptions

### instinct\_percentage

```gdscript
var instinct_percentage
```

Pourcentage d'instinct, min: 0, max: 75

### rng

```gdscript
var rng
```

Générateur de nombres aléatoires

### game\_over

```gdscript
var game_over
```

Booleen determinant si la partie doit se terminer

## Method Descriptions

### check\_game\_over

```gdscript
func check_game_over()
```

Retourne un booleen représentant la fin du jeu, qui se produit si l'instinct atteint 0%

### increment\_instinct

```gdscript
func increment_instinct(percent = 0)
```

Incremente l'instinct d'une valeur (int percent) passée en paramètre

### diagnostic\_success

```gdscript
func diagnostic_success()
```

Choisit un entier aléatoire entre 0 et 100, si inférieur au pourcentage d'instinct

### update\_percentage

```gdscript
func update_percentage()
```

Met à jour l'affichage du pourcentage