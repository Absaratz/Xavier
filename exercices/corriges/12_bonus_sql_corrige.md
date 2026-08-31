# Corrigé — Exercice 12 (bonus) : SQL

```sql
-- 1. Nom et note de tous les élèves
SELECT nom, note_nsi FROM eleves;

-- 2. Élèves de la classe TG1
SELECT * FROM eleves WHERE classe = 'TG1';

-- 3. Élèves avec note < 10, triés par note croissante
SELECT nom, note_nsi FROM eleves
WHERE note_nsi < 10
ORDER BY note_nsi ASC;

-- 4. Nombre d'élèves par classe
SELECT classe, COUNT(*) AS nb_eleves
FROM eleves
GROUP BY classe;

-- 5. Moyenne des notes de la classe TG2
SELECT AVG(note_nsi) AS moyenne_tg2
FROM eleves
WHERE classe = 'TG2';
```

Points à vérifier avec l'élève :
- `WHERE` filtre les lignes *avant* un éventuel regroupement ; `GROUP BY`
  sert à agréger (compter, moyenner...) par catégorie.
- Ne pas confondre `=` (égalité, SQL) et `==` (égalité, Python).
- `ORDER BY ... ASC/DESC` pour trier.
