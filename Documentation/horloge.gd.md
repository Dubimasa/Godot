<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# horloge.gd

**Extends:** [Node2D](../Node2D)

## Description

Fichier gérant l'horloge et le compteur de patients

## Property Descriptions

### heure\_max

```gdscript
var heure_max
```

Variable représentant l'heure maximum d'une journée

### heure\_stop\_travail

```gdscript
var heure_stop_travail
```

Variable représentant l'heure de fermeture du cabinet

### heures

```gdscript
var heures
```

Variable représentant l'heure courante (sa valeur par défaut étant l'heure d'ouverture du cabinet)

### minutes

```gdscript
var minutes
```

Variable représentant les minutes

### nbr\_personnes

```gdscript
var nbr_personnes
```

Variable représentant le nombres de patients à passer

### nbr\_personnes\_passe

```gdscript
var nbr_personnes_passe
```

Variable représentant le nombres de patients ayant déja passé

## Method Descriptions

### incremente\_temps

```gdscript
func incremente_temps(temps_a_rajouter)
```

Fonction qui incrémente l'horloge d'un montant donné en paramètre à la fonction, et qui envoie un signal à une méthode de la scène livre_ouvert lors de la fin d'une journée de travail

### temps\_00

```gdscript
func temps_00(val)
```

Fonction utilisée pour homogénéiser le format d'affichage du temps

### set\_time

```gdscript
func set_time(heure, minute)
```

Fonction utilisée pour affecter des valeurs précises à l'horloge (également utilisée par incremente_temps())

### set\_nbr\_personne

```gdscript
func set_nbr_personne(nb_personne)
```

Fonction utilisée pour affecter des valeurs précises au compteur de patients

### set\_nbr\_personne\_passe

```gdscript
func set_nbr_personne_passe(nb_personne)
```

Fonction utilisée pour affecter des valeurs précises au compteur de patients

### add\_personne\_passe

```gdscript
func add_personne_passe()
```

Fonction appelée pour incrémenter le nombre de patients reçus dans le cabinet

### verif\_end\_of\_day\_personnes

```gdscript
func verif_end_of_day_personnes()
```

### get\_nbr\_patient\_not\_passed

```gdscript
func get_nbr_patient_not_passed()
```

Appelée pour récupérer le nombre de personnes qui n'ont pas été diagnostiquées dans la journée (par manque de temps)