# Remise à niveau NSI — Première → Terminale

Kit de séance (1h30) pour remettre un·e élève « dans le bain » avant d'attaquer le
programme de Terminale NSI, en révisant les bases du programme de Première.

## Contenu

- **`memo_premiere.md`** — Mémo/antisèche à donner à l'élève : tout le vocabulaire
  et la syntaxe Python de Première sur une poignée de pages.
- **`plan_de_seance_1h30.md`** — Déroulé minuté du cours, avec un **socle**
  (exercices obligatoires, ~1h20) et un **menu bonus** modulaire pour ajuster
  la séance à la vitesse de l'élève ou préparer une séance suivante.
- **`exercices/enonces/`** — Les feuilles d'exercices à donner à l'élève
  (fichiers `.py` exécutables, ou `.md` pour SQL/complexité).
- **`exercices/corriges/`** — Les corrigés correspondants, à ne pas donner
  à l'élève avant qu'il/elle ait cherché.

## Comment s'en servir

1. Ouvrir `plan_de_seance_1h30.md` : c'est le fil conducteur de la séance.
2. Donner à l'élève `memo_premiere.md` en début de séance (ou en amont).
3. Suivre le socle d'exercices dans l'ordre ; piocher dans le menu bonus
   selon le rythme (élève à l'aise → ajouter un bonus « ouverture Terminale » ;
   élève en difficulté → remplacer un exercice du socle par sa variante allégée
   indiquée dans le plan).
4. Les fichiers `.py` sont directement exécutables par l'élève
   (`python3 exercices/enonces/0X_xxx.py`) : chaque exercice contient ses
   propres tests (`assert`) pour une auto-vérification immédiate.
