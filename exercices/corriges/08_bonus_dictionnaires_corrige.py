"""Corrige — Exercice 8 (bonus) : Dictionnaires."""


def note_la_plus_haute(notes):
    meilleur_nom = None
    meilleure_note = None
    for nom, note in notes.items():
        if meilleure_note is None or note > meilleure_note:
            meilleure_note = note
            meilleur_nom = nom
    return meilleur_nom


def compte_lettres(mot):
    resultat = {}
    for lettre in mot:
        if lettre in resultat:
            resultat[lettre] = resultat[lettre] + 1
        else:
            resultat[lettre] = 1
    return resultat


def fusionner(dico1, dico2):
    resultat = dict(dico1)
    for cle, valeur in dico2.items():
        resultat[cle] = valeur
    return resultat


if __name__ == "__main__":
    assert note_la_plus_haute({"Alice": 14, "Bob": 17, "Chloe": 12}) == "Bob"
    assert compte_lettres("papa") == {"p": 2, "a": 2}
    assert fusionner({"a": 1, "b": 2}, {"b": 3, "c": 4}) == {"a": 1, "b": 3, "c": 4}
    print("Tous les tests sont passes !")
