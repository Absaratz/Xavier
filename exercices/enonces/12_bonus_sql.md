# Exercice 12 (BONUS) — Bases de données / SQL

Difficulté : ★★ · Durée estimée : 15 min
À utiliser si : on veut aussi raviver le volet « traitement de données en
table » du programme de Première (indépendant de la partie algo/Python).

## Table de départ

Table `eleves` :

| id | nom      | classe | note_nsi |
|----|----------|--------|----------|
| 1  | Dupont   | TG1    | 15       |
| 2  | Martin   | TG2    | 8        |
| 3  | Bernard  | TG1    | 12       |
| 4  | Petit    | TG2    | 17       |
| 5  | Robert   | TG1    | 9        |

## Questions

Écris la requête SQL qui permet de :

1. Afficher le nom et la note de tous les élèves.
2. Afficher uniquement les élèves de la classe `TG1`.
3. Afficher les élèves ayant une note strictement inférieure à 10
   (ceux à qui il faut proposer du soutien), triés par note croissante.
4. Afficher le nombre d'élèves par classe (indice : `GROUP BY` et `COUNT(*)`).
5. Afficher la moyenne des notes de la classe `TG2` (indice : `AVG`).

## Corrigé

Voir `exercices/corriges/12_bonus_sql_corrige.md`.
