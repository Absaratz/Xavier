"""
Exercice 10 (BONUS - ouverture Terminale) — Decouverte de la recursivite
Difficulte : ***
Duree estimee : 15 min
A utiliser si : l'eleve est a l'aise et qu'on veut lui montrer un avant-gout
de la Terminale (la recursivite n'est pas au programme de Premiere mais
elle arrive vite en Terminale).
"""

# Une fonction recursive est une fonction qui s'appelle elle-meme, avec :
# - un CAS DE BASE (condition d'arret, sans appel recursif)
# - un CAS GENERAL (qui rapproche du cas de base a chaque appel)
#
# Exemple donne (a lire et executer, rien a completer) :
def factorielle(n):
    if n == 0:              # cas de base
        return 1
    return n * factorielle(n - 1)   # cas general


# 1. Ecris, en t'inspirant de l'exemple, une fonction recursive
#    `somme_jusqu_a_recursif(n)` qui renvoie la somme des entiers de 1 a n
#    (meme resultat que l'exercice 3, mais en recursif cette fois).
def somme_jusqu_a_recursif(n):
    # TODO
    pass


# 2. Ecris une fonction recursive `puissance(base, exposant)` qui calcule
#    base ** exposant sans utiliser l'operateur **.
#    Indice : base**0 = 1 ; base**n = base * base**(n-1)
def puissance(base, exposant):
    # TODO
    pass


# 3. (defi) Ecris une fonction recursive `somme_liste_recursif(valeurs)` qui
#    calcule la somme des elements d'une liste, sans boucle.
#    Indice : la somme d'une liste vide est 0 ; sinon c'est le premier
#    element + la somme du reste de la liste (valeurs[1:]).
def somme_liste_recursif(valeurs):
    # TODO
    pass


if __name__ == "__main__":
    assert factorielle(5) == 120
    assert somme_jusqu_a_recursif(5) == 15
    assert puissance(2, 10) == 1024
    assert somme_liste_recursif([1, 2, 3, 4]) == 10
    print("Tous les tests sont passes ! Bienvenue en Terminale :)")
