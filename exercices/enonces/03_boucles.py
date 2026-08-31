"""
Exercice 3 — Boucles (SOCLE)
Difficulte : **
Duree estimee : 15 min

Objectif : distinguer boucle bornee (for) et non bornee (while), et
construire un resultat pas a pas (accumulateur).

Variante allegee si l'eleve peine : ne faire que les fonctions 1 et 2,
garder 3 et 4 pour la fin de seance si le temps le permet.
"""

# 1. Ecris une fonction `somme_jusqu_a(n)` qui renvoie la somme des entiers
#    de 1 a n (inclus), avec une boucle for.
def somme_jusqu_a(n):
    # TODO
    pass


# 2. Ecris une fonction `table_de_multiplication(n)` qui AFFICHE (print) la
#    table de multiplication de n, de n*1 a n*10, une ligne par produit,
#    par exemple pour n=3 :
#    3 x 1 = 3
#    3 x 2 = 6
#    ...
def table_de_multiplication(n):
    # TODO
    pass


# 3. Ecris une fonction `premiere_puissance_de_2_superieure_a(seuil)` qui
#    renvoie le plus petit entier de la forme 2**k (k >= 0) strictement
#    superieur a `seuil`. Utilise une boucle while (on ne connait pas le
#    nombre d'iterations a l'avance !).
def premiere_puissance_de_2_superieure_a(seuil):
    # TODO
    pass


# 4. (un peu plus dur) Ecris une fonction `est_premier(n)` qui renvoie True
#    si n (entier >= 2) est un nombre premier, False sinon. Indice : teste
#    si un diviseur d compris entre 2 et n-1 divise n.
def est_premier(n):
    # TODO
    pass


if __name__ == "__main__":
    assert somme_jusqu_a(5) == 15
    assert somme_jusqu_a(1) == 1

    assert premiere_puissance_de_2_superieure_a(10) == 16
    assert premiere_puissance_de_2_superieure_a(1) == 2

    assert est_premier(7) is True
    assert est_premier(8) is False
    assert est_premier(2) is True

    table_de_multiplication(3)
    print("Tous les tests sont passes !")
