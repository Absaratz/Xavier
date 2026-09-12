"""
Exercice 17 (BONUS - ouverture Terminale) — Tours de Hanoi et Fibonacci
Difficulte : ***
Duree estimee : 20-25 min
Prerequis : exercice 10 (decouverte de la recursivite). Bon complement a
l'exercice 16 : deux grands classiques de la recursivite, avec des
schemas d'appels differents (trois etapes pour Hanoi, deux appels
recursifs pour Fibonacci), et une premiere vraie rencontre avec le cout
d'un algorithme recursif (lien avec l'exercice 11 sur la complexite).
"""


# 1. Tours de Hanoi
#    Trois tours nommees "A", "B", "C". n disques sont empiles sur la
#    tour de depart, du plus grand (en bas) au plus petit (en haut).
#    Objectif : deplacer tous les disques vers la tour d'arrivee, un seul
#    disque a la fois, sans jamais poser un disque sur un disque plus
#    petit, en utilisant la tour intermediaire si besoin.
#
#    Ecris une fonction hanoi(n, depart, intermediaire, arrivee) qui :
#      - AFFICHE (print) chaque deplacement effectue, sous la forme
#        "Deplacer le disque <n> de <depart> vers <arrivee>"
#      - renvoie le NOMBRE TOTAL de deplacements effectues
#
#    Cas de base : n == 0 -> rien a deplacer, on n'affiche rien, renvoie 0.
#    Cas general (n > 0), pour deplacer n disques de depart vers arrivee :
#      1. deplacer les n-1 disques du dessus, de depart vers
#         intermediaire (arrivee sert alors de tour intermediaire)
#      2. deplacer le disque restant (le n-ieme) de depart vers arrivee
#         (c'est A CET ENDROIT qu'on affiche le print)
#      3. deplacer les n-1 disques, de intermediaire vers arrivee (depart
#         sert alors de tour intermediaire)
def hanoi(n, depart, intermediaire, arrivee):
    # TODO
    pass


# 2. Fibonacci recursif (naif)
#    La suite de Fibonacci est definie par :
#      fib(0) = 0
#      fib(1) = 1
#      fib(n) = fib(n-1) + fib(n-2)   pour n >= 2
#    Ecris une version recursive DIRECTE de cette definition.
def fib(n):
    # TODO
    pass


# 3. Le cout cache de la recursivite
#    fib(n) ci-dessus est tres simple a ecrire... mais tres lent des que n
#    grandit ! Pour le comprendre, on va compter le nombre d'appels
#    recursifs necessaires.
#    Ecris compte_appels_fib(n) qui renvoie ce nombre d'appels, avec le
#    meme schema que fib : compte_appels_fib(0) et compte_appels_fib(1)
#    valent chacun 1 (un seul appel, celui de depart), et pour n >= 2 :
#    compte_appels_fib(n) = 1 + compte_appels_fib(n-1) + compte_appels_fib(n-2)
def compte_appels_fib(n):
    # TODO
    pass


# 4. (pour aller plus loin) La memoisation
#    Le probleme de fib(n) : on recalcule un grand nombre de fois les
#    memes valeurs (par exemple fib(2) est recalcule des dizaines de fois
#    au cours du calcul de fib(10)). La MEMOISATION consiste a stocker
#    chaque resultat deja calcule dans un dictionnaire, pour ne plus
#    jamais le recalculer.
#    Ecris fib_memo(n, memo=None) qui calcule fib(n) avec cette technique :
#      - si memo vaut None (valeur par defaut), l'initialiser a {}
#      - si n est deja une cle de memo, renvoyer directement memo[n]
#      - sinon, calculer la valeur recursivement (comme pour fib, mais en
#        transmettant memo aux appels recursifs), la stocker dans
#        memo[n], puis la renvoyer
def fib_memo(n, memo=None):
    # TODO
    pass


if __name__ == "__main__":
    assert hanoi(0, "A", "B", "C") == 0
    assert hanoi(1, "A", "B", "C") == 1
    assert hanoi(3, "A", "B", "C") == 7
    assert hanoi(4, "A", "B", "C") == 15   # nombre de deplacements = 2**n - 1

    assert [fib(i) for i in range(10)] == [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]

    assert compte_appels_fib(1) == 1
    assert compte_appels_fib(5) == 15
    assert compte_appels_fib(20) > 10000  # ca explose bien plus vite que n !

    assert [fib_memo(i) for i in range(10)] == [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]
    assert fib_memo(30) == 832040   # quasi instantane grace a la memoisation

    print("Tous les tests sont passes !")
