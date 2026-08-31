"""Corrige — Exercice 3 : Boucles."""


def somme_jusqu_a(n):
    total = 0
    for i in range(1, n + 1):
        total = total + i
    return total


def table_de_multiplication(n):
    for i in range(1, 11):
        print(n, "x", i, "=", n * i)


def premiere_puissance_de_2_superieure_a(seuil):
    puissance = 1
    while puissance <= seuil:
        puissance = puissance * 2
    return puissance


def est_premier(n):
    if n < 2:
        return False
    d = 2
    while d < n:
        if n % d == 0:
            return False
        d = d + 1
    return True


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
