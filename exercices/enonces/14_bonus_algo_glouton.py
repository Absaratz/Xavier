"""
Exercice 14 (BONUS - ouverture Terminale) — Algorithmes gloutons
Difficulte : ***
Duree estimee : 20 min
A utiliser si : les algorithmes gloutons ne sont pas au programme de
Premiere mais arrivent en Terminale. Bonne ouverture en fin de seance,
apres l'exercice 5 ou 11. A completer avec l'exercice 15, qui montre les
limites de cette strategie.

Principe : un algorithme glouton construit une solution pas a pas, en
faisant a chaque etape le choix qui semble le meilleur "sur l'instant"
(choix localement optimal), SANS JAMAIS revenir en arriere. C'est simple
et rapide a ecrire, mais ca ne garantit pas toujours la meilleure solution
globale (voir exercice 15).
"""


# 1. Rendu de monnaie
def rendu_monnaie(montant, pieces):
    """Renvoie la liste des pieces utilisees (algorithme glouton) pour
    rendre `montant`, en utilisant les valeurs de `pieces` (liste triee
    par ordre DECROISSANT, quantite illimitee de chaque piece).
    A chaque etape, on rend la plus grande piece possible sans depasser le
    montant qu'il reste a rendre.
    Exemple : rendu_monnaie(78, [50, 20, 10, 5, 2, 1]) -> [50, 20, 5, 2, 1]
    """
    # TODO
    pass


# 2. Selection d'activites
def selection_activites(activites):
    """`activites` est une liste de tuples (debut, fin). Deux activites
    sont compatibles si l'une se termine avant (ou au moment) que l'autre
    commence. Renvoie la liste des activites choisies, dans l'ordre, de
    maniere a en selectionner le plus possible, avec la strategie
    gloutonne suivante :
      1. trier les activites par heure de FIN croissante
      2. choisir la premiere activite
      3. parcourir les suivantes, et choisir chaque activite dont le debut
         est superieur ou egal a la fin de la derniere activite choisie
    """
    # TODO
    pass


if __name__ == "__main__":
    assert rendu_monnaie(78, [50, 20, 10, 5, 2, 1]) == [50, 20, 5, 2, 1]
    assert rendu_monnaie(6, [5, 2, 1]) == [5, 1]
    assert sum(rendu_monnaie(99, [50, 20, 10, 5, 2, 1])) == 99

    # Exemple classique : 11 activites, la meilleure solution en contient 4.
    activites = [
        (1, 4), (3, 5), (0, 6), (5, 7), (3, 8),
        (5, 9), (6, 10), (8, 11), (8, 12), (2, 14), (12, 16),
    ]
    resultat = selection_activites(activites)
    assert resultat == [(1, 4), (5, 7), (8, 11), (12, 16)]

    print("Tous les tests sont passes !")
