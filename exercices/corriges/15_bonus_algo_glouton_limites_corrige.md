# Corrigé — Exercice 15 (bonus) : Les limites des algorithmes gloutons

## Question 1

Tri par ratio décroissant : A (6), B (5), C (4).

- On prend A (poids 10, il reste 40 de capacité).
- On prend B (poids 20, il reste 20 de capacité).
- On tente C (poids 30) : ça ne rentre pas dans les 20 restants → on le
  laisse.

Valeur totale obtenue par le glouton : **60 + 100 = 160**.

## Question 2

En prenant B et C : poids total = 20 + 30 = 50 (exactement la capacité),
valeur totale = 100 + 120 = **220**.

C'est strictement mieux que la solution gloutonne (220 > 160) !

## Question 3

Un algorithme glouton fait, à chaque étape, le choix qui semble le
meilleur sur l'instant, sans jamais revenir en arrière ni explorer
d'autres possibilités. Cela ne garantit **pas** d'obtenir la meilleure
solution globale : ici, privilégier l'objet le plus « rentable » au
départ (A) empêche ensuite de faire rentrer la bien meilleure combinaison
B + C. Un algorithme glouton est donc rapide et simple à écrire, mais
n'est valable de manière garantie que pour certains problèmes précis (où
l'on peut démontrer que les choix locaux mènent à un optimum global) —
pas pour tous.

## Question 4

Dans le rendu de monnaie (avec un système de pièces usuel) et la
sélection d'activités, on peut démontrer que le choix glouton fait à
chaque étape ne « coûte » jamais d'opportunité par rapport à la solution
optimale : rendre la plus grande pièce possible ne réduit jamais les
possibilités pour la suite, et choisir l'activité qui finit le plus tôt
laisse toujours un maximum de temps disponible pour la suite.

Dans le sac à dos 0/1, un objet est **indivisible** : on ne peut pas
ajuster finement la quantité prise pour optimiser l'espace restant, donc
un choix glouton peut définitivement bloquer une meilleure combinaison
future — ce qui n'arrive pas dans les deux autres problèmes.
