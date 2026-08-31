# Plan de séance — Remise à niveau NSI (1h30)

Objectif : réactiver les bases de Première (variables, conditions, boucles,
listes, fonctions, recherche/tri) avant d'attaquer le programme de
Terminale. Le déroulé ci-dessous couvre ~1h20 de **socle**, avec 5-10 min
de battement ; le **menu bonus** permet d'ajuster en direct selon le
rythme de l'élève.

## Déroulé (socle)

| Temps | Durée | Étape |
|---|---|---|
| 0:00 – 0:05 | 5 min | **Accueil + mise en contexte.** Demander à l'élève ce qu'il/elle a retenu de Première, ce qui l'a marqué comme difficile. Donner le mémo (`memo_premiere.md`). |
| 0:05 – 0:15 | 10 min | **Exercice 1** — variables et types (`01_variables_types.py`) |
| 0:15 – 0:25 | 10 min | **Exercice 2** — conditions (`02_conditions.py`) |
| 0:25 – 0:40 | 15 min | **Exercice 3** — boucles (`03_boucles.py`) — *si l'élève peine, ne faire que les fonctions 1 et 2 de l'exercice* |
| 0:40 – 0:55 | 15 min | **Exercice 4** — listes (`04_listes.py`) |
| 0:55 – 1:15 | 20 min | **Exercice 5** — recherche et tri (`05_recherche_tri.py`) — cœur de la remise à niveau, lien direct avec la Terminale |
| 1:15 – 1:20 | 5 min | Pause courte / question libre |
| 1:20 – 1:25 | 5-10 min | **Bilan** : reformuler à l'oral les points clés du mémo, identifier 1-2 notions à retravailler seul·e |

L'exercice 6 (fonctions/tests, 15 min) est volontairement laissé en réserve :
à utiliser **à la place** d'un exercice du socle si l'élève va vite dessus,
ou en fin de séance si tout le reste est fini avant 1h15.

## Menu bonus — à composer selon la situation

Utiliser ce menu pour :
- **remplacer** un exercice du socle par une variante plus facile,
- **combler** du temps si l'élève avance plus vite que prévu,
- **préparer une deuxième séance**.

| Exercice | Thème | Durée | Difficulté | Quand l'utiliser |
|---|---|---|---|---|
| `06_fonctions.py` | Fonctions, tests unitaires | 15 min | ★★ | Réserve du socle (voir ci-dessus) |
| `07_bonus_chaines.py` | Chaînes de caractères | 15 min | ★★ | Élève rapide, ou pour varier après l'ex. 4 |
| `08_bonus_dictionnaires.py` | Dictionnaires | 15 min | ★★ | Élève à l'aise ; utile aussi pour une 2e séance (JSON en Terminale) |
| `09_bonus_tuples.py` | n-uplets | 10 min | ★ | Exercice court et facile si besoin de reprendre confiance |
| `10_bonus_recursivite_decouverte.py` | Récursivité (avant-goût Terminale) | 15 min | ★★★ | Élève très à l'aise, en fin de séance, pour ouvrir sur la Terminale |
| `11_bonus_complexite.md` | Complexité algorithmique (avant-goût Terminale) | 15 min | ★★★ | Juste après l'ex. 5, si le temps le permet |
| `12_bonus_sql.md` | SQL / bases de données | 15 min | ★★ | Pour aussi raviver le volet « données en tables » du programme |
| `13_bonus_synthese_mini_projet.py` | Mini-projet pendu (synthèse) | 20-25 min | ★★★ | Fin de séance s'il reste du temps, ou défi à la maison |

## Exemples de combinaisons selon le profil

- **Élève en difficulté** : Socle 1 → 2 → 3 (fonctions 1-2 seulement) → 4 →
  `09_bonus_tuples` (facile, pour finir sur une réussite) → bilan.
- **Élève dans la moyenne (déroulé par défaut)** : suivre le socle tel quel
  (1 → 2 → 3 → 4 → 5 → bilan).
- **Élève à l'aise / va vite** : Socle 1 → 2 → 3 → 4 → 5 → `11_bonus_complexite`
  ou `10_bonus_recursivite_decouverte` en ouverture sur la Terminale.
- **Séance suivante (approfondissement)** : `06_fonctions`, `08_bonus_dictionnaires`,
  `12_bonus_sql`, `13_bonus_synthese_mini_projet`.

## Conseils pédagogiques

- Laisser l'élève chercher seul·e quelques minutes avant d'aider ; poser des
  questions plutôt que donner la réponse ("qu'est-ce qui se passe si...?").
- Faire lancer le script à chaque exercice terminé : les `assert` donnent un
  retour immédiat et objectif ("ça passe" / "ça casse"), ce qui rassure.
- Ne pas hésiter à écrire ensemble un exemple à la main sur papier (dérouler
  une boucle ou une dichotomie pas à pas) avant de coder, surtout pour
  l'exercice 5.
- Garder les corrigés (`exercices/corriges/`) pour soi, à ne montrer qu'après
  une vraie tentative de l'élève.
