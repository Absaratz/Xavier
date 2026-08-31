# Corrigé — Exercice 11 (bonus) : Complexité algorithmique

## Question 1

- `recherche_sequentielle` : jusqu'à **1000 comparaisons** dans le pire cas
  (l'élément cherché est en dernière position, ou absent).
- `recherche_dichotomique` : à chaque étape la zone est divisée par 2 ;
  2¹⁰ = 1024, donc environ **10 comparaisons** au maximum suffisent.
- Sur une grande liste triée, la recherche **dichotomique** est largement
  préférable : sa complexité est logarithmique, alors que la recherche
  séquentielle est linéaire.

## Question 2

- **Extrait A** : complexité **constante**. `valeurs[0]` est un accès
  direct par indice, qui prend le même temps quelle que soit la taille de
  la liste.
- **Extrait B** : complexité **quadratique**. Il y a deux boucles `for`
  imbriquées qui parcourent chacune les `n` éléments : le nombre
  d'itérations est de l'ordre de `n × n = n²`.

## Question 3

`n*(n-1)/2` est un polynôme de degré 2 en `n`, donc le tri par sélection a
une complexité de l'ordre de **n² (quadratique)**.

Si on double la taille de la liste (`n` devient `2n`), le nombre
d'opérations est multiplié par environ `(2n)² / n² = 4` : le temps
d'exécution est donc environ **multiplié par 4**, pas par 2.
