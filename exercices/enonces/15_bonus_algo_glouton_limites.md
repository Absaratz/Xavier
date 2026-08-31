# Exercice 15 (BONUS — ouverture Terminale) — Les limites des algorithmes gloutons

Difficulté : ★★★ · Durée estimée : 10-15 min
À utiliser si : juste après l'exercice 14, pour montrer qu'un algorithme
glouton ne trouve pas toujours la meilleure solution — un point important
du programme de Terminale.

## Contexte : le problème du sac à dos (0/1)

On dispose d'un sac à dos de capacité (poids maximum) donnée, et d'une
liste d'objets, chacun caractérisé par une valeur et un poids. On veut
choisir des objets (chacun est pris **en entier ou pas du tout**, d'où le
nom "0/1") sans dépasser la capacité, en maximisant la valeur totale.

Une stratégie gloutonne naturelle : trier les objets par ratio
valeur/poids décroissant, et les prendre un par un tant qu'ils rentrent
encore dans le sac.

## Objets de l'exemple

| Objet | Valeur | Poids | Ratio valeur/poids |
|---|---|---|---|
| A | 60  | 10 | 6 |
| B | 100 | 20 | 5 |
| C | 120 | 30 | 4 |

Capacité du sac : 50.

## Questions

1. Déroule à la main la stratégie gloutonne (tri par ratio décroissant, on
   prend un objet tant qu'il rentre). Quels objets sont choisis ? Quelle
   est la valeur totale obtenue ?
2. En testant à la main les combinaisons possibles, trouve une
   répartition qui respecte la capacité de 50 et fait mieux que la
   solution gloutonne. Quelle est sa valeur totale ?
3. Que peux-tu en conclure sur la fiabilité des algorithmes gloutons en
   général ?
4. (pour aller plus loin) Reprends un des deux problèmes de l'exercice 14
   (rendu de monnaie, sélection d'activités) : pourquoi la stratégie
   gloutonne y fonctionne parfaitement, contrairement au sac à dos 0/1 ?
   (Indice : dans le sac à dos 0/1, impossible de "prendre juste un
   morceau" d'un objet pour combler exactement l'espace restant.)

## Corrigé

Voir `exercices/corriges/15_bonus_algo_glouton_limites_corrige.md`.
