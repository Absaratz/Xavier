"""
Exercice 7 (BONUS) — Chaines de caracteres
Difficulte : **
Duree estimee : 15 min
A utiliser si : l'eleve va vite sur le socle, ou en complement a la maison.
"""

# 1. Ecris une fonction `initiales(prenom, nom)` qui renvoie les initiales
#    en majuscules separees par un point, ex : ("jean", "dupont") -> "J.D."
def initiales(prenom, nom):
    # TODO
    pass


# 2. Ecris une fonction `compte_mots(phrase)` qui renvoie le nombre de mots
#    d'une phrase (les mots sont separes par des espaces). Indice :
#    phrase.split(" ").
def compte_mots(phrase):
    # TODO
    pass


# 3. Ecris une fonction `censurer(mot)` qui renvoie le mot avec toutes les
#    lettres remplacees par "*" sauf la premiere et la derniere, ex :
#    "python" -> "p****n".
def censurer(mot):
    # TODO
    pass


if __name__ == "__main__":
    assert initiales("jean", "dupont") == "J.D."
    assert compte_mots("le chat dort") == 3
    assert censurer("python") == "p****n"
    print("Tous les tests sont passes !")
