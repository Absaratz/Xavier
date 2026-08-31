# Exercice 11 (BONUS — ouverture Terminale) — Complexité algorithmique

Difficulté : ★★★ · Durée estimée : 15 min
À utiliser si : bon complément après l'exercice 5 (recherche/tri), pour
introduire une notion clé de Terminale.

## Rappel express

La **complexité** d'un algorithme mesure (grossièrement) le nombre
d'opérations qu'il effectue en fonction de la taille `n` de ses données
d'entrée. On compare surtout l'ordre de grandeur :

- **constante** : le nombre d'opérations ne dépend pas de `n`
- **linéaire** : le nombre d'opérations est proportionnel à `n`
- **quadratique** : proportionnel à `n²`
- **logarithmique** : proportionnel à `log(n)` (très efficace)

## Questions

1. On a écrit en exercice 5 `recherche_sequentielle` et
   `recherche_dichotomique`. Pour une liste de 1000 éléments triés :
   - Combien de comparaisons au maximum peut faire `recherche_sequentielle` ?
   - Combien de comparaisons au maximum peut faire `recherche_dichotomique` ?
     (indice : à chaque étape, la zone de recherche est divisée par 2 ;
     combien de fois peut-on diviser 1000 par 2 avant d'obtenir 1 ?)
   - Quel algorithme est-il préférable d'utiliser sur une grande liste triée ?

2. Voici deux extraits de code. Pour chacun, indique si le nombre
   d'opérations est constant, linéaire ou quadratique en fonction de la
   taille `n` de la liste `valeurs`, et justifie en une phrase.

   ```python
   # Extrait A
   def premier_element(valeurs):
       return valeurs[0]
   ```

   ```python
   # Extrait B
   def contient_doublon(valeurs):
       n = len(valeurs)
       for i in range(n):
           for j in range(n):
               if i != j and valeurs[i] == valeurs[j]:
                   return True
       return False
   ```

3. Le tri par sélection (exercice 5) compare, pour une liste de taille `n`,
   à peu près `n + (n-1) + (n-2) + ... + 1` éléments. Sachant que cette
   somme vaut `n*(n-1)/2`, quel est l'ordre de grandeur de la complexité du
   tri par sélection ? Si on double la taille de la liste, le temps
   d'exécution est-il environ multiplié par 2 ou par 4 ?

## Corrigé

Voir `exercices/corriges/11_bonus_complexite_corrige.md`.
