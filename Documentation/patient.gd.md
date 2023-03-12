<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# patient.gd

**Extends:** [Node2D](../Node2D)

## Description

Fichier permettant de gérer l'affichage des patients et de leurs bulles de parole

## Property Descriptions

### rng

```gdscript
var rng
```

Variable utilisée pour choisir un patient au hasard

### liste\_patients

```gdscript
var liste_patients
```

Variable dans laquelle on va récupérer la liste de patients

### taille

```gdscript
var taille
```

Variable contenant la taille de la liste de patients

### rand

```gdscript
var rand
```

Variable utilisée pour choisir un patient au hasard

### texture

```gdscript
var texture
```

Variable utilisée pour afficher l'image du patient

### image

```gdscript
var image
```

Variable représentant l'image du patient

### patient

```gdscript
var patient
```

Variable représentant la ressource Patient

### pensee

```gdscript
var pensee
```

Variable représentant la bulle de pensée du médecin utilisée lors de l'examination d'un patient

### lst\_patients\_passes

```gdscript
var lst_patients_passes
```

Variable utilisée pour ne pas faire passer deux fois le même patient en une journée

## Method Descriptions

### next\_patient

```gdscript
func next_patient()
```

Fonction permettant d'afficher un personnage au hasard de la liste des personnages de la journée. Empêche également d'avoir deux fois le même patient dans la même journée et vide les bulles de paroles et de pensée

### repondre

```gdscript
func repondre(texte)
```

Appelée pour qu'un patient dise ce que l'on passe en argument

### parole\_visible

```gdscript
func parole_visible()
```

Appelée pour rendre la bulle de parole d'un patient visible

### parole\_invisible

```gdscript
func parole_invisible()
```

Appelée pour rendre la bulle de parole d'un patient invisible

### clean\_bulles

```gdscript
func clean_bulles()
```

Appelée pour vider les bulles des patients et la bulle de pensée du médecin