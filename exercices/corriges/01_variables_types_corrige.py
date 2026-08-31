"""Corrige — Exercice 1 : Variables et types."""

prenom = "Lea"
age = 17
taille = 1.65

print("7 // 2 =", 7 // 2)
print("7 % 2 =", 7 % 2)
print("7 / 2 =", 7 / 2)
print('"3" + "4" =', "3" + "4")
print('int("3") + int("4") =', int("3") + int("4"))
print('str(3) + str(4) =', str(3) + str(4))


def est_pair(n):
    return n % 2 == 0


def imc(poids, taille):
    return poids / taille ** 2


if __name__ == "__main__":
    assert est_pair(4) is True
    assert est_pair(7) is False
    assert round(imc(70, 1.75), 2) == 22.86
    print("Tous les tests sont passes !")
