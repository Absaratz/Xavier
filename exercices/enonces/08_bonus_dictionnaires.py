"""
Exercice 8 (BONUS) — Dictionnaires
Difficulte : **
Duree estimee : 15 min
A utiliser si : l'eleve va vite, ou pour une seance suivante (les
dictionnaires reviennent beaucoup en Terminale, notamment avec les JSON).
"""

# 1. Ecris une fonction `note_la_plus_haute(notes)` ou `notes` est un
#    dictionnaire {"nom_eleve": note, ...}. Elle renvoie le nom de l'eleve
#    ayant la meilleure note.
def note_la_plus_haute(notes):
    # TODO
    pass


# 2. Ecris une fonction `compte_lettres(mot)` qui renvoie un dictionnaire
#    {lettre: nombre_d_occurrences} pour chaque lettre du mot.
#    Exemple : "papa" -> {"p": 2, "a": 2}
def compte_lettres(mot):
    # TODO
    pass


# 3. Ecris une fonction `fusionner(dico1, dico2)` qui renvoie un NOUVEAU
#    dictionnaire contenant toutes les cles de dico1 et dico2. En cas de
#    cle commune, la valeur de dico2 l'emporte.
def fusionner(dico1, dico2):
    # TODO
    pass


if __name__ == "__main__":
    assert note_la_plus_haute({"Alice": 14, "Bob": 17, "Chloe": 12}) == "Bob"
    assert compte_lettres("papa") == {"p": 2, "a": 2}
    assert fusionner({"a": 1, "b": 2}, {"b": 3, "c": 4}) == {"a": 1, "b": 3, "c": 4}
    print("Tous les tests sont passes !")
