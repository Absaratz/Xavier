# Mémo — Bases de Première NSI

À garder sous les yeux pendant les exercices.

## 1. Types et variables

```python
age = 17          # int
prix = 4.5        # float
prenom = "Léa"    # str
majeur = False    # bool
```

- Affectation : `variable = expression` (à droite, on évalue ; à gauche, on stocke).
- Conversions : `int("3")`, `float(3)`, `str(3)`, `bool(0)`.
- Opérateurs arithmétiques : `+ - * / // % **` (`//` = division entière, `%` = reste).
- Opérateurs de comparaison : `== != < <= > >=` → renvoient un `bool`.
- Opérateurs booléens : `and`, `or`, `not`.

## 2. Instructions conditionnelles

```python
if note >= 10:
    resultat = "admis"
elif note >= 8:
    resultat = "rattrapage"
else:
    resultat = "recalé"
```

## 3. Boucles

```python
for i in range(5):        # boucle bornée : 0,1,2,3,4
    print(i)

i = 0
while i < 5:               # boucle non bornée : condition évaluée avant chaque tour
    i = i + 1
```

- Boucle **bornée** : on connaît à l'avance le nombre de répétitions (`for ... in range(...)`).
- Boucle **non bornée** : on répète tant qu'une condition est vraie (`while`), attention aux boucles infinies !

## 4. Listes (tableaux)

```python
notes = [12, 8, 15, 10]
notes[0]          # 12 (premier élément, indices à partir de 0)
notes[-1]         # 10 (dernier élément)
notes[1:3]        # [8, 15] (slicing)
len(notes)        # 4
notes.append(17)  # ajoute à la fin
9 in notes        # False (test d'appartenance)

for n in notes:            # parcours par valeur
    print(n)

for i in range(len(notes)): # parcours par indice
    print(i, notes[i])
```

## 5. Chaînes de caractères

```python
mot = "python"
mot[0]         # 'p'
mot[-1]        # 'n'
len(mot)       # 6
mot.upper()    # 'PYTHON'
mot + "!"      # concaténation
```

## 6. n-uplets (tuples) et dictionnaires

```python
point = (3, 5)          # tuple : immuable
x, y = point             # déballage

eleve = {"nom": "Dupont", "note": 14}   # dictionnaire : clé → valeur
eleve["note"]                            # 14
eleve["moyenne"] = 15                    # ajout d'une clé
```

## 7. Fonctions

```python
def moyenne(a, b):
    """Renvoie la moyenne de deux nombres."""
    return (a + b) / 2

resultat = moyenne(12, 16)   # 14.0
```

- Une fonction **prend des paramètres** et **renvoie** (`return`) un résultat.
- Une variable définie *dans* une fonction n'existe pas en dehors (portée locale).
- Tester une fonction : `assert moyenne(0, 10) == 5.0`.

## 8. Algorithmes classiques à connaître

- **Somme / moyenne / maximum d'une liste** : parcours avec un accumulateur.
- **Recherche séquentielle** : parcourir la liste élément par élément.
- **Recherche dichotomique** : uniquement sur une liste **triée**, on divise
  l'intervalle de recherche par deux à chaque étape.
- **Tri par sélection** : à chaque étape, chercher le minimum restant et le
  placer à sa position.
- **Tri par insertion** : insérer chaque élément à sa bonne place parmi les
  éléments déjà triés.

## 9. Vocabulaire à retenir

| Terme | Définition rapide |
|---|---|
| Algorithme | Suite finie d'instructions résolvant un problème |
| Paramètre / argument | Paramètre = nom dans la définition de la fonction ; argument = valeur passée à l'appel |
| Itération | Un tour de boucle |
| Complexité | Mesure de l'efficacité d'un algorithme (nombre d'opérations selon la taille des données) |
| Test unitaire | Vérification automatique qu'une fonction renvoie le résultat attendu |
