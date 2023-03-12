# Description de certains aspects du jeu sérieux **Great Wise Médecin Simulator**

## Objectifs pédagogiques

### **Objectif principal :** 

Le joueur devra comprendre l'utilité de l'anamnèse, consistant à questionner le patient chez le médecin afin d'identifier les maladies potentielles à partir de l'historique de vie du patient (antécédent médicaux, mauvaises habitudes ou hygiène de vie). C'est cet importante phase qui permet de gagner en précision lors du diagnostic final.

### **Notions présentes dans le jeu :**

Voici une liste de notions contenues dans l'objectif pédagogique que nous voulons faire comprendre aux joueurs :
- Le questionnement des patients est essentiel pour déterminer le mal qui les ronge
- Des évènements qui peuvent paraître anodins à première vue peuvent être déterminants lors de l'identification d'une maladie
- Un instinct développé permet de mieux cibler les maladies possibles pour un patient
- Il est important pour un médecin de bien gérer son temps de manière à pouvoir traiter le plus de patients et le mieux possible
- Utiliser son instinct pour diagnostiquer peut permettre un gain de temps, mais c'est un pari qui peut s'avérer perdant

## Interactions entre les utilisateurs et le jeu

### **Description rapide du jeu :**

Le joueur incarne le **Great Wise Médecin**, arrivant dans son nouveau cabinet médical, il est de son devoir de réaliser le plus de diagnostics médicaux corrects que possible au cours de ses demi-journées *(faut pas abuser non plus)* de travail. Pour cela, il devra questionner ses patients au sujet de leurs symptômes ainsi que de leurs antécédents et de leur contexte de vie, qu'il pourra alors comparer avec les maladies connues, présentées dans sa fidèle encyclopédie médicale. Il pourra également presser un bouton d'instinct, qui lui donnera le diagnostic correct avec une probabilité visible et modulée au fil du jeu.

Son but sera de tenir son poste de médecin tout au long de sa première semaine de travail, les patients arriveront de plus en plus nombreux au fil des jours. Attention cependant lors d'un mauvais diagnostic, l'instinct du **Great Wise Médecin** flanche. Et si son instinct atteint la valeur la plus faible, le joueur sera démis de ses fonctions en raison de son inefficacité et perdra alors la partie.

### **Actions en jeu :**

*DeC : Sur la durée du diagnostic en cours*

| Action du joueur | Retour de la part du jeu | Temps consommé (minutes) | Incrément sur la probabilité de succès de l'instinct (%)
|-|-|-|-|
| Poser un question sur les symptomes du patient | Un/Deux symptome(s) du patient | 5 | 5 (DeC) |
| Poser un question sur les antécédents du patient | Un antécédent du patient | 10 | 5 (DeC) |
| Poser un question sur le contexte de vie du patient | Le contexte de vie du patient | 15 | 5 (DeC) |
| Inspecter le patient | Un symptome caché du patient | 20 | 5 (DeC) |
| Ouvrir l'encyclopédie des maladies | Affiche la liste navigable des maladies | - | - |
| Tourner une page de l'encyclopédie | Affiche une autre double-page de maladies | 2 | - |
| Diagnostiquer une maladie | Termine la consultation en cours et indique au joueur si son diagnostic est correct | 10 | Diagnostic incorrect : -10 \| Correct : 7 |
| Utiliser le bouton d'instinct |  Termine la consultation en cours et indique au joueur si son diagnostic est correct | 10 | Diagnostic incorrect : -10 \| Correct : 7 |


Précisions sur les fonctionnalités :
- Lors du diagnostic d'une maladie, si il est plus de midi ou si tous les patients du jour ont été soignés, affiche un résumé des soins réalisés pour la journée, depuis lequel on peut quitter le jeu ou avancer au jour suivant