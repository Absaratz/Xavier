"""
Exercice 6 — Fonctions et tests unitaires (SOCLE)
Difficulte : **
Duree estimee : 15 min

Objectif : ecrire des fonctions qui en appellent d'autres, et prendre
l'habitude d'ecrire ses propres tests (assert) - competence attendue en
Terminale pour les projets.
"""

# 1. Ecris une fonction `est_palindrome(mot)` qui renvoie True si `mot` se
#    lit pareil a l'endroit et a l'envers (ex : "radar" -> True,
#    "python" -> False). Indice : compare mot et mot[::-1].
def est_palindrome(mot):
    # TODO
    pass


# 2. Ecris une fonction `compte_voyelles(mot)` qui renvoie le nombre de
#    voyelles (a, e, i, o, u, y - on ignore les accents) dans `mot`
#    (insensible a la casse : "Ete" doit donner 2).
def compte_voyelles(mot):
    # TODO
    pass


# 3. Ecris une fonction `nettoyer_et_verifier_palindrome(phrase)` qui
#    reutilise `est_palindrome` pour verifier si une PHRASE est un
#    palindrome en ignorant les espaces et en mettant tout en minuscules.
#    Exemple : "KA YAK" -> True (une fois espaces retires et minuscules
#    appliquees : "kayak")
def nettoyer_et_verifier_palindrome(phrase):
    # TODO : utilise phrase.replace(" ", "").lower(), puis appelle
    # est_palindrome sur le resultat
    pass


# 4. A ton tour d'ecrire les tests ! Complete les deux lignes ci-dessous
#    (choisis toi-meme un exemple vrai et un exemple faux) puis decommente-les.
def mes_propres_tests():
    # assert compte_voyelles("...") == ...
    # assert compte_voyelles("...") == ...
    pass


if __name__ == "__main__":
    assert est_palindrome("radar") is True
    assert est_palindrome("python") is False

    assert compte_voyelles("Ete") == 2
    assert compte_voyelles("Python") == 2

    assert nettoyer_et_verifier_palindrome("KA YAK") is True
    assert nettoyer_et_verifier_palindrome("bonjour") is False

    mes_propres_tests()
    print("Tous les tests sont passes !")
