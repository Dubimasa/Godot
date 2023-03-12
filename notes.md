Chaque patient aura une image, un nom et un contexte de vie définis manuellement 
- Leur maladie est random
- Chaque jour, une liste random de patient est tiré dans le tableau sql des patients(nom,lien_image,contexte_vie);

S'il y a le temps : rajouter le son de necoArc à son arrivée


Pour la fin de journée : 
Quand il est plus de midi, le détecter et stopper l'apparition de patients, et si l'apparition a été stoppée, activer la fin de journée et remettre à zéro la journée, incrémenter le nombre de jours passés et le nombre de clients soignés ou non dans la journée (mais pas au total. Entretemps, rendre le patient invisible pendant que le résultat de la journée est affiché)



Le nombre de patient vus (var nb_patients) est incrémenté par next_patient().
A faire (par Dorian) : Incrémenter (dans la scène patient) les variables nb_patients_soignes ou nb_patients_morts lors d'un bon ou mauvais diagnostic (dans la scène livre_ouvert).
Implémenter une fonction stop_day(nb_patients, nb_patients_soignés, nb_patients_morts) dans livre_ouvert pour faire en sorte que le patient en cours soit le dernier de la journée.
Passer les trois arguments de stop_day à la fonction fin_journee(nb_patients, nb_patients_soignés, nb_patients_morts) de la scène Journee