<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# affiche.gd

**Extends:** [Node2D](../Node2D)

## Description

Ce fichier permet de gérer et de répondre aux clics sur les questions que le médecin pose au patient

## Property Descriptions

### symptome

```gdscript
var symptome
```

La variable représentant le premier ou les deux premiers symptômes correspondants à une maladie

### antecedent

```gdscript
var antecedent
```

La variable représentant l'antécédant correspondant à une maladie

### contexte

```gdscript
var contexte
```

La variable représentant le contexte de vie correspondant à une maladie

### symptome\_cache

```gdscript
var symptome_cache
```

Le dernier symptôme d'une maladie, caché et demandant plus de temps à dévoiler

### patient

```gdscript
var patient
```

Variable dans laquelle on va stocker les appels aux méthodes de la classe patient

### nb\_symptomes

```gdscript
var nb_symptomes
```

Variable représentant le nombre de symptômes de chaque maladie

### symptome\_clicked

```gdscript
var symptome_clicked
```

Variable représentant le statut de la question sur les symptômes (déjà cliquée ou non)

### antecedant\_clicked

```gdscript
var antecedant_clicked
```

Variable représentant le statut de la question sur les antécédants (déjà cliquée ou non)

### contexte\_clicked

```gdscript
var contexte_clicked
```

Variable représentant le statut de la question sur les contextes de vie (déjà cliquée ou non)

### Q1\_donne

```gdscript
var Q1_donne
```

Variables Q1_donne à Q4_donne : pour déterminer si une question a déjà été posée

### Q2\_donne

```gdscript
var Q2_donne
```

### Q3\_donne

```gdscript
var Q3_donne
```

### Q4\_donne

```gdscript
var Q4_donne
```

## Method Descriptions

### count\_clicked

```gdscript
func count_clicked()
```

Appelée pour savoir combien de boutons ont été cliqués au moins une fois

### unlock\_q4

```gdscript
func unlock_q4()
```

Appelée pour débloquer la question 4

### lock\_q4

```gdscript
func lock_q4()
```

Appelée pour bloquer la question 4

### reset\_counters

```gdscript
func reset_counters()
```

Appelée lors du bloquage de la question 4, sert à remettre à zéro les compteurs de clics