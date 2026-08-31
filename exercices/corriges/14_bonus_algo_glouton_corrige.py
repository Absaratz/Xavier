"""Corrige — Exercice 14 (bonus) : Algorithmes gloutons."""


def rendu_monnaie(montant, pieces):
    resultat = []
    reste = montant
    for piece in pieces:
        while reste >= piece:
            resultat.append(piece)
            reste -= piece
    return resultat


def selection_activites(activites):
    activites_triees = sorted(activites, key=lambda a: a[1])
    resultat = [activites_triees[0]]
    derniere_fin = activites_triees[0][1]
    for activite in activites_triees[1:]:
        debut, fin = activite
        if debut >= derniere_fin:
            resultat.append(activite)
            derniere_fin = fin
    return resultat


if __name__ == "__main__":
    assert rendu_monnaie(78, [50, 20, 10, 5, 2, 1]) == [50, 20, 5, 2, 1]
    assert rendu_monnaie(6, [5, 2, 1]) == [5, 1]
    assert sum(rendu_monnaie(99, [50, 20, 10, 5, 2, 1])) == 99

    activites = [
        (1, 4), (3, 5), (0, 6), (5, 7), (3, 8),
        (5, 9), (6, 10), (8, 11), (8, 12), (2, 14), (12, 16),
    ]
    resultat = selection_activites(activites)
    assert resultat == [(1, 4), (5, 7), (8, 11), (12, 16)]

    print("Tous les tests sont passes !")
