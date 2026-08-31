"""Corrige — Exercice 6 : Fonctions et tests unitaires."""


def est_palindrome(mot):
    return mot == mot[::-1]


def compte_voyelles(mot):
    voyelles = "aeiouy"
    compteur = 0
    for lettre in mot.lower():
        if lettre in voyelles:
            compteur = compteur + 1
    return compteur


def nettoyer_et_verifier_palindrome(phrase):
    nettoyee = phrase.replace(" ", "").lower()
    return est_palindrome(nettoyee)


def mes_propres_tests():
    assert compte_voyelles("bonjour") == 3
    assert compte_voyelles("gym") == 1


if __name__ == "__main__":
    assert est_palindrome("radar") is True
    assert est_palindrome("python") is False

    assert compte_voyelles("Ete") == 2
    assert compte_voyelles("Python") == 2

    assert nettoyer_et_verifier_palindrome("KA YAK") is True
    assert nettoyer_et_verifier_palindrome("bonjour") is False

    mes_propres_tests()
    print("Tous les tests sont passes !")
