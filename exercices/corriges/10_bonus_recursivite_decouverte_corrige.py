"""Corrige — Exercice 10 (bonus) : Decouverte de la recursivite."""


def factorielle(n):
    if n == 0:
        return 1
    return n * factorielle(n - 1)


def somme_jusqu_a_recursif(n):
    if n == 0:
        return 0
    return n + somme_jusqu_a_recursif(n - 1)


def puissance(base, exposant):
    if exposant == 0:
        return 1
    return base * puissance(base, exposant - 1)


def somme_liste_recursif(valeurs):
    if len(valeurs) == 0:
        return 0
    return valeurs[0] + somme_liste_recursif(valeurs[1:])


if __name__ == "__main__":
    assert factorielle(5) == 120
    assert somme_jusqu_a_recursif(5) == 15
    assert puissance(2, 10) == 1024
    assert somme_liste_recursif([1, 2, 3, 4]) == 10
    print("Tous les tests sont passes ! Bienvenue en Terminale :)")
