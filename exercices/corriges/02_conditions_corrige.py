"""Corrige — Exercice 2 : Instructions conditionnelles."""


def mention(note):
    if note >= 16:
        return "Felicitations"
    elif note >= 14:
        return "Bien"
    elif note >= 12:
        return "Assez bien"
    elif note >= 10:
        return "Passable"
    else:
        return "Insuffisant"


def est_annee_bissextile(annee):
    if annee % 400 == 0:
        return True
    if annee % 100 == 0:
        return False
    return annee % 4 == 0


def peut_conduire(age, a_permis):
    return age >= 18 and a_permis


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
