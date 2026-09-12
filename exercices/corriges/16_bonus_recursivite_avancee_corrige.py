"""Corrige — Exercice 16 (bonus) : Recursivite mutuelle et diviser pour regner."""


def est_pair_rec(n):
    if n == 0:
        return True
    return est_impair_rec(n - 1)


def est_impair_rec(n):
    if n == 0:
        return False
    return est_pair_rec(n - 1)


def recherche_dichotomique_recursive(valeurs, cible, gauche=0, droite=None):
    if droite is None:
        droite = len(valeurs) - 1
    if gauche > droite:
        return -1
    milieu = (gauche + droite) // 2
    if valeurs[milieu] == cible:
        return milieu
    elif valeurs[milieu] < cible:
        return recherche_dichotomique_recursive(valeurs, cible, milieu + 1, droite)
    else:
        return recherche_dichotomique_recursive(valeurs, cible, gauche, milieu - 1)


def puissance_rapide(base, exposant):
    if exposant == 0:
        return 1
    if est_pair_rec(exposant):
        moitie = puissance_rapide(base, exposant // 2)
        return moitie * moitie
    else:
        return base * puissance_rapide(base, exposant - 1)


if __name__ == "__main__":
    for i in range(6):
        assert est_pair_rec(i) == (i % 2 == 0)
        assert est_impair_rec(i) == (i % 2 == 1)

    liste_triee = [1, 3, 5, 7, 9, 11, 13]
    assert recherche_dichotomique_recursive(liste_triee, 7) == 3
    assert recherche_dichotomique_recursive(liste_triee, 4) == -1

    assert puissance_rapide(2, 10) == 1024
    assert puissance_rapide(3, 0) == 1
    assert puissance_rapide(2, 13) == 8192

    print("Tous les tests sont passes !")
