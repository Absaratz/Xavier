"""
Exercice 16 (BONUS - ouverture Terminale) — Recursivite mutuelle et
diviser pour regner
Difficulte : ***
Duree estimee : 20 min
Prerequis : exercice 10 (decouverte de la recursivite) et exercice 5
(recherche dichotomique). Bonne suite logique de ces deux exercices : on y
reutilise la parite (comme dans l'exercice 10) et le principe de diviser
la zone de recherche par deux (comme dans l'exercice 5), pour aboutir a
un algorithme "diviser pour regner" efficace.
"""


# 1. Recursivite mutuelle : deux fonctions qui s'appellent l'une l'autre.
#    Ecris deux fonctions est_pair_rec(n) et est_impair_rec(n) qui testent
#    la parite d'un entier n >= 0, SANS utiliser % ni l'operateur not.
#    Idee : n est pair si n == 0, ou si n-1 est impair.
#           n est impair si n != 0 et n-1 est pair.
def est_pair_rec(n):
    # TODO
    pass


def est_impair_rec(n):
    # TODO
    pass


# 2. Recherche dichotomique RECURSIVE. En exercice 5, tu l'as ecrite avec
#    une boucle while. Ecris ici une version recursive equivalente.
#    `valeurs` est une liste triee croissante. `gauche` et `droite` sont
#    les bornes de la zone de recherche courante (par defaut, toute la
#    liste).
def recherche_dichotomique_recursive(valeurs, cible, gauche=0, droite=None):
    if droite is None:
        droite = len(valeurs) - 1
    # TODO : cas de base -> si gauche > droite, la cible n'est pas dans la
    #        liste, renvoyer -1
    # TODO : sinon, calculer le milieu, comparer valeurs[milieu] a cible :
    #        - egal -> renvoyer milieu
    #        - valeurs[milieu] < cible -> rappeler la fonction sur la
    #          moitie droite (gauche = milieu + 1)
    #        - sinon -> rappeler la fonction sur la moitie gauche
    #          (droite = milieu - 1)
    pass


# 3. Puissance rapide : diviser pour regner + test de parite.
#    Calcule base ** exposant en seulement O(log(exposant)) appels
#    recursifs, au lieu de O(exposant) pour la fonction `puissance` de
#    l'exercice 10 (qui fait un appel par unite d'exposant).
#    Idee, en s'appuyant sur la parite de l'exposant (comme en question 1) :
#      - si exposant == 0 : resultat = 1 (cas de base)
#      - si exposant est PAIR : base**exposant = (base**(exposant//2))**2
#        -> un seul appel recursif, sur un exposant deux fois plus petit !
#      - si exposant est IMPAIR : base**exposant = base * base**(exposant-1)
def puissance_rapide(base, exposant):
    # TODO : utilise est_pair_rec(exposant) pour choisir le bon cas
    pass


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
