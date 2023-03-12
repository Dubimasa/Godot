<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# Maladie.gd

**Extends:** [Resource](../Resource)

## Description

Le fichier permettant la définition de la structure d'une maladie

## Property Descriptions

### name

```gdscript
export var name = ""
```

Le nom d'une maladie

### description

```gdscript
export var description = ""
```

La description d'une maladie

### antecedents

```gdscript
export var antecedents = "[Object:null]"
```

L'antécédent correspondant à une maladie

### symptomes

```gdscript
export var symptomes = []
```

Les symptômes correspondant à une maladie

### contexte

```gdscript
export var contexte = "[Object:null]"
```

Le contexte de vie correspondant à une maladie

## Method Descriptions

### \_init

```gdscript
func _init(nam = "", desc = "", ante, sympt, cont)
```

Fonction définissant les attributs d'une maladie (avec entre autres les ressources Contexte, Antécédant et Symptômes définies auparavant)