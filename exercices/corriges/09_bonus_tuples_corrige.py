"""Corrige — Exercice 9 (bonus) : n-uplets (tuples)."""

from math import sqrt


def distance(point_a, point_b):
    xa, ya = point_a
    xb, yb = point_b
    return sqrt((xa - xb) ** 2 + (ya - yb) ** 2)


def milieu(point_a, point_b):
    xa, ya = point_a
    xb, yb = point_b
    return ((xa + xb) / 2, (ya + yb) / 2)


def plus_proche_de_origine(points):
    meilleur_point = points[0]
    meilleure_distance = distance((0, 0), meilleur_point)
    for point in points:
        d = distance((0, 0), point)
        if d < meilleure_distance:
            meilleure_distance = d
            meilleur_point = point
    return meilleur_point


if __name__ == "__main__":
    assert distance((0, 0), (3, 4)) == 5.0
    assert milieu((0, 0), (4, 6)) == (2.0, 3.0)
    assert plus_proche_de_origine([(3, 4), (1, 1), (10, 10)]) == (1, 1)
    print("Tous les tests sont passes !")
