"""
Exercice 9 (BONUS) — n-uplets (tuples)
Difficulte : *
Duree estimee : 10 min
A utiliser si : besoin d'un exercice court et facile pour rassurer l'eleve.
"""

# 1. Ecris une fonction `distance(point_a, point_b)` ou point_a et point_b
#    sont des tuples (x, y). Elle renvoie la distance euclidienne entre les
#    deux points : sqrt((xa-xb)**2 + (ya-yb)**2).
#    Indice : from math import sqrt
def distance(point_a, point_b):
    # TODO
    pass


# 2. Ecris une fonction `milieu(point_a, point_b)` qui renvoie le tuple
#    (x, y) du milieu du segment [point_a, point_b].
def milieu(point_a, point_b):
    # TODO
    pass


# 3. Ecris une fonction `plus_proche_de_origine(points)` ou `points` est
#    une liste de tuples (x, y). Elle renvoie le point le plus proche de
#    l'origine (0, 0).
def plus_proche_de_origine(points):
    # TODO
    pass


if __name__ == "__main__":
    assert distance((0, 0), (3, 4)) == 5.0
    assert milieu((0, 0), (4, 6)) == (2.0, 3.0)
    assert plus_proche_de_origine([(3, 4), (1, 1), (10, 10)]) == (1, 1)
    print("Tous les tests sont passes !")
