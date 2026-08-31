"""
Exercice 2 — Instructions conditionnelles (SOCLE)
Difficulte : *
Duree estimee : 10 min

Objectif : ecrire des tests avec if / elif / else et des conditions
composees (and, or, not).
"""

# 1. Ecris une fonction `mention(note)` qui renvoie une chaine selon la note
#    sur 20 :
#    - "Felicitations" si note >= 16
#    - "Bien" si note >= 14
#    - "Assez bien" si note >= 12
#    - "Passable" si note >= 10
#    - "Insuffisant" sinon
def mention(note):
    # TODO
    pass


# 2. Ecris une fonction `est_annee_bissextile(annee)` qui renvoie True si
#    l'annee est bissextile.
#    Regle : divisible par 4, sauf les multiples de 100 qui ne sont
#    bissextiles que s'ils sont aussi multiples de 400.
#    (ex : 2000 est bissextile, 1900 ne l'est pas, 2024 l'est)
def est_annee_bissextile(annee):
    # TODO
    pass


# 3. Ecris une fonction `peut_conduire(age, a_permis)` qui renvoie True
#    seulement si la personne a au moins 18 ans ET possede le permis.
def peut_conduire(age, a_permis):
    # TODO
    pass


if __name__ == "__main__":
    assert mention(18) == "Felicitations"
    assert mention(15) == "Bien"
    assert mention(13) == "Assez bien"
    assert mention(11) == "Passable"
    assert mention(5) == "Insuffisant"

    assert est_annee_bissextile(2024) is True
    assert est_annee_bissextile(1900) is False
    assert est_annee_bissextile(2000) is True
    assert est_annee_bissextile(2023) is False

    assert peut_conduire(20, True) is True
    assert peut_conduire(17, True) is False
    assert peut_conduire(20, False) is False
    print("Tous les tests sont passes !")
