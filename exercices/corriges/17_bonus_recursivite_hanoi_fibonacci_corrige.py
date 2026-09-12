"""Corrige — Exercice 17 (bonus) : Tours de Hanoi et Fibonacci."""


def hanoi(n, depart, intermediaire, arrivee):
    if n == 0:
        return 0
    deplacements = hanoi(n - 1, depart, arrivee, intermediaire)
    print("Deplacer le disque", n, "de", depart, "vers", arrivee)
    deplacements += 1
    deplacements += hanoi(n - 1, intermediaire, depart, arrivee)
    return deplacements


def fib(n):
    if n <= 1:
        return n
    return fib(n - 1) + fib(n - 2)


def compte_appels_fib(n):
    if n <= 1:
        return 1
    return 1 + compte_appels_fib(n - 1) + compte_appels_fib(n - 2)


def fib_memo(n, memo=None):
    if memo is None:
        memo = {}
    if n in memo:
        return memo[n]
    if n <= 1:
        resultat = n
    else:
        resultat = fib_memo(n - 1, memo) + fib_memo(n - 2, memo)
    memo[n] = resultat
    return resultat


if __name__ == "__main__":
    assert hanoi(0, "A", "B", "C") == 0
    assert hanoi(1, "A", "B", "C") == 1
    assert hanoi(3, "A", "B", "C") == 7
    assert hanoi(4, "A", "B", "C") == 15

    assert [fib(i) for i in range(10)] == [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]

    assert compte_appels_fib(1) == 1
    assert compte_appels_fib(5) == 15
    assert compte_appels_fib(20) > 10000

    assert [fib_memo(i) for i in range(10)] == [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]
    assert fib_memo(30) == 832040

    print("Tous les tests sont passes !")
