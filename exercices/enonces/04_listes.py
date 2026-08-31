"""
Exercice 4 — Listes (SOCLE)
Difficulte : **
Duree estimee : 15 min

Objectif : parcourir, modifier et construire des listes.
"""

# 1. Ecris une fonction `somme_liste(valeurs)` qui renvoie la somme des
#    elements de la liste `valeurs` (sans utiliser sum()).
def somme_liste(valeurs):
    # TODO
    pass


# 2. Ecris une fonction `maximum(valeurs)` qui renvoie le plus grand element
#    de la liste (sans utiliser max()). On suppose la liste non vide.
def maximum(valeurs):
    # TODO
    pass


# 3. Ecris une fonction `compte_occurrences(valeurs, cible)` qui renvoie le
#    nombre de fois ou `cible` apparait dans `valeurs`.
def compte_occurrences(valeurs, cible):
    # TODO
    pass


# 4. Ecris une fonction `sans_doublons(valeurs)` qui renvoie une NOUVELLE
#    liste contenant les elements de `valeurs`, sans doublons, dans leur
#    ordre d'apparition. Exemple : [1, 2, 2, 3, 1] -> [1, 2, 3]
def sans_doublons(valeurs):
    # TODO
    pass


# 5. Ecris une fonction `inverser(valeurs)` qui renvoie une NOUVELLE liste
#    avec les elements de `valeurs` dans l'ordre inverse (sans utiliser
#    reversed() ni le slicing [::-1]).
def inverser(valeurs):
    # TODO
    pass


if __name__ == "__main__":
    assert somme_liste([1, 2, 3, 4]) == 10
    assert maximum([3, 7, 2, 9, 4]) == 9
    assert compte_occurrences([1, 2, 2, 3, 2], 2) == 3
    assert sans_doublons([1, 2, 2, 3, 1]) == [1, 2, 3]
    assert inverser([1, 2, 3]) == [3, 2, 1]
    print("Tous les tests sont passes !")
