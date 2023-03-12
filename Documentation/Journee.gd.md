<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# Journee.gd

**Extends:** [Node2D](../Node2D)

## Description

Fichier permettant d'afficher le résumé d'une journée

## Property Descriptions

### jour

```gdscript
var jour
```

Variable permettant de compter le nombre de jours passés à soigner des patients

### nb\_patients

```gdscript
var nb_patients
```

Variable utilisée pour stocker le nombre de patients qui veulent se faire soigner par journée

## Method Descriptions

### fin\_jour

```gdscript
func fin_jour(nb_patients_passe, nb_patients_soignes, nb_patients_morts, nb_patients_non_diagnositique)
```

Fonction permettant d'afficher sur le résumé de la journée les informations sur le nombre de bons et de mauvais diagnostics ainsi que de personnes non reçues par manque de temps, et rend visible la scène de fin de journée (régénère également la liste de patients)

### end\_visible

```gdscript
func end_visible()
```

Fonction appelée pour rendre la scène de fin de journée visible

### end\_unvisible

```gdscript
func end_unvisible()
```

Fonction appelée pour rendre la scène de fin de journée invisible