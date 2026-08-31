"""Corrige — Exercice 5 : Recherche et tri."""


def recherche_sequentielle(valeurs, cible):
    for i in range(len(valeurs)):
        if valeurs[i] == cible:
            return i
    return -1


def recherche_dichotomique(valeurs, cible):
    gauche = 0
    droite = len(valeurs) - 1
    while gauche <= droite:
        milieu = (gauche + droite) // 2
        if valeurs[milieu] == cible:
            return milieu
        elif valeurs[milieu] < cible:
            gauche = milieu + 1
        else:
            droite = milieu - 1
    return -1


def tri_selection(valeurs):
    n = len(valeurs)
    for i in range(n):
        indice_min = i
        for j in range(i + 1, n):
            if valeurs[j] < valeurs[indice_min]:
                indice_min = j
        valeurs[i], valeurs[indice_min] = valeurs[indice_min], valeurs[i]


if __name__ == "__main__":
    assert recherche_sequentielle([5, 3, 8, 1], 8) == 2
    assert recherche_sequentielle([5, 3, 8, 1], 9) == -1

    liste_triee = [1, 3, 5, 7, 9, 11, 13]
    assert recherche_dichotomique(liste_triee, 7) == 3
    assert recherche_dichotomique(liste_triee, 4) == -1

    ma_liste = [5, 3, 8, 1, 9, 2]
    tri_selection(ma_liste)
    assert ma_liste == [1, 2, 3, 5, 8, 9]

    print("Tous les tests sont passes !")
