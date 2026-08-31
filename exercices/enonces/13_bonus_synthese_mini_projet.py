"""
Exercice 13 (BONUS - synthese) — Mini-projet : jeu du pendu simplifie
Difficulte : ***
Duree estimee : 20-25 min
A utiliser si : il reste du temps en fin de seance, ou en guise de
"defi a la maison". Fait la synthese de : chaines, listes, boucles,
conditions, fonctions.
"""

MOT_SECRET = "python"


def lettres_trouvees(mot_secret, lettres_essayees):
    """Renvoie une chaine avec les lettres trouvees et des '_' sinon.
    Exemple : lettres_trouvees("python", {"p", "o"}) -> "p___o_"
    """
    # TODO
    pass


def mot_devine(mot_secret, lettres_essayees):
    """Renvoie True si toutes les lettres de mot_secret sont dans
    lettres_essayees."""
    # TODO
    pass


def jouer():
    """Boucle de jeu : demande des lettres a l'utilisateur (input()) tant
    que le mot n'est pas devine et qu'il reste des essais. 10 essais max."""
    lettres_essayees = set()
    essais_restants = 10
    # TODO : boucle while qui :
    #   - affiche l'etat courant avec lettres_trouvees
    #   - demande une lettre avec input()
    #   - l'ajoute a lettres_essayees
    #   - si la lettre n'est pas dans mot_secret, decremente essais_restants
    #   - s'arrete si mot_devine(...) est True ou essais_restants == 0
    pass


if __name__ == "__main__":
    # Tests des fonctions "logique" (sans input, donc testables automatiquement)
    assert lettres_trouvees("python", {"p", "o"}) == "p___o_"
    assert lettres_trouvees("python", set()) == "______"
    assert lettres_trouvees("python", {"p", "y", "t", "h", "o", "n"}) == "python"

    assert mot_devine("python", {"p", "y", "t", "h", "o", "n"}) is True
    assert mot_devine("python", {"p", "y"}) is False

    print("Tous les tests logiques sont passes !")
    print("Pour jouer pour de vrai, decommente l'appel ci-dessous :")
    # jouer()
