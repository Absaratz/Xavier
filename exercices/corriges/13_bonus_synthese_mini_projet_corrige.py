"""Corrige — Exercice 13 (bonus) : Mini-projet jeu du pendu simplifie."""

MOT_SECRET = "python"


def lettres_trouvees(mot_secret, lettres_essayees):
    resultat = ""
    for lettre in mot_secret:
        if lettre in lettres_essayees:
            resultat = resultat + lettre
        else:
            resultat = resultat + "_"
    return resultat


def mot_devine(mot_secret, lettres_essayees):
    for lettre in mot_secret:
        if lettre not in lettres_essayees:
            return False
    return True


def jouer():
    lettres_essayees = set()
    essais_restants = 10

    while essais_restants > 0 and not mot_devine(MOT_SECRET, lettres_essayees):
        print(lettres_trouvees(MOT_SECRET, lettres_essayees))
        print("Essais restants :", essais_restants)
        lettre = input("Propose une lettre : ")
        lettres_essayees.add(lettre)
        if lettre not in MOT_SECRET:
            essais_restants = essais_restants - 1

    if mot_devine(MOT_SECRET, lettres_essayees):
        print("Gagne ! Le mot etait :", MOT_SECRET)
    else:
        print("Perdu ! Le mot etait :", MOT_SECRET)


if __name__ == "__main__":
    assert lettres_trouvees("python", {"p", "o"}) == "p___o_"
    assert lettres_trouvees("python", set()) == "______"
    assert lettres_trouvees("python", {"p", "y", "t", "h", "o", "n"}) == "python"

    assert mot_devine("python", {"p", "y", "t", "h", "o", "n"}) is True
    assert mot_devine("python", {"p", "y"}) is False

    print("Tous les tests logiques sont passes !")
    # jouer()
