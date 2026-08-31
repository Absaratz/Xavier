"""Corrige — Exercice 7 (bonus) : Chaines de caracteres."""


def initiales(prenom, nom):
    return prenom[0].upper() + "." + nom[0].upper() + "."


def compte_mots(phrase):
    return len(phrase.split(" "))


def censurer(mot):
    return mot[0] + "*" * (len(mot) - 2) + mot[-1]


if __name__ == "__main__":
    assert initiales("jean", "dupont") == "J.D."
    assert compte_mots("le chat dort") == 3
    assert censurer("python") == "p****n"
    print("Tous les tests sont passes !")
