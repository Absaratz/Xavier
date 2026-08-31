"""
Exercice 1 — Variables et types (SOCLE)
Difficulte : *
Duree estimee : 10 min

Objectif : manipuler les types de base (int, float, str, bool) et les
conversions.
"""

# 1. Cree une variable `prenom` (str), `age` (int) et `taille` (float, en metres)
#    avec tes propres valeurs.
# TODO


# 2. Sans lancer le programme, devine le type et la valeur de chacune de ces
#    expressions, puis verifie en completant les print() :
#    - 7 // 2
#    - 7 % 2
#    - 7 / 2
#    - "3" + "4"
#    - int("3") + int("4")
#    - str(3) + str(4)
print("7 // 2 =")   # TODO: print(7 // 2)
print("7 % 2 =")    # TODO
print("7 / 2 =")    # TODO
print('"3" + "4" =')     # TODO
print('int("3") + int("4") =')   # TODO
print('str(3) + str(4) =')       # TODO


# 3. Ecris une fonction `est_pair(n)` qui renvoie True si l'entier n est pair,
#    False sinon (utilise l'operateur %).
def est_pair(n):
    # TODO
    pass


# 4. Ecris une fonction `imc(poids, taille)` qui calcule l'indice de masse
#    corporelle : imc = poids / taille**2 (poids en kg, taille en metres).
def imc(poids, taille):
    # TODO
    pass


if __name__ == "__main__":
    assert est_pair(4) is True
    assert est_pair(7) is False
    assert round(imc(70, 1.75), 2) == 22.86
    print("Tous les tests sont passes !")
