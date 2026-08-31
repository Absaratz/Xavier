"""Corrige — Exercice 4 : Listes."""


def somme_liste(valeurs):
    total = 0
    for v in valeurs:
        total = total + v
    return total


def maximum(valeurs):
    plus_grand = valeurs[0]
    for v in valeurs:
        if v > plus_grand:
            plus_grand = v
    return plus_grand


def compte_occurrences(valeurs, cible):
    compteur = 0
    for v in valeurs:
        if v == cible:
            compteur = compteur + 1
    return compteur


def sans_doublons(valeurs):
    resultat = []
    for v in valeurs:
        if v not in resultat:
            resultat.append(v)
    return resultat


def inverser(valeurs):
    resultat = []
    for i in range(len(valeurs) - 1, -1, -1):
        resultat.append(valeurs[i])
    return resultat


if __name__ == "__main__":
    assert somme_liste([1, 2, 3, 4]) == 10
    assert maximum([3, 7, 2, 9, 4]) == 9
    assert compte_occurrences([1, 2, 2, 3, 2], 2) == 3
    assert sans_doublons([1, 2, 2, 3, 1]) == [1, 2, 3]
    assert inverser([1, 2, 3]) == [3, 2, 1]
    print("Tous les tests sont passes !")
