"""
Exercice 5 — Recherche et tri (SOCLE)
Difficulte : ***
Duree estimee : 20 min

Objectif : implementer les algorithmes classiques de Premiere. C'est
l'exercice le plus important pour "raccrocher" avec la Terminale (tri
fusion / tri rapide, complexite).
"""

# 1. Ecris une fonction `recherche_sequentielle(valeurs, cible)` qui renvoie
#    l'indice de la premiere occurrence de `cible` dans `valeurs`, ou -1 si
#    `cible` n'y est pas.
def recherche_sequentielle(valeurs, cible):
    # TODO
    pass


# 2. Ecris une fonction `recherche_dichotomique(valeurs, cible)` qui renvoie
#    l'indice de `cible` dans `valeurs`, ou -1 si absent.
#    ATTENTION : `valeurs` est TRIEE dans l'ordre croissant (condition
#    necessaire pour la dichotomie). Utilise deux bornes `gauche` et
#    `droite` que tu rapproches a chaque etape.
def recherche_dichotomique(valeurs, cible):
    # TODO
    pass


# 3. Ecris une fonction `tri_selection(valeurs)` qui trie la liste `valeurs`
#    EN PLACE (dans l'ordre croissant) avec l'algorithme du tri par
#    selection : a chaque etape, chercher le minimum du reste de la liste
#    et l'echanger avec l'element en tete de ce reste.
#    La fonction ne renvoie rien (None), elle modifie `valeurs` directement.
def tri_selection(valeurs):
    # TODO
    pass


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
