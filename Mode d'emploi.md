# Vendre · Super Sunday Lyon

## Lancer la présentation

**En ligne :** ouvre https://hsanchezhub.github.io/super-sunday-vendre/ dans Chrome, puis **F** pour le plein écran et **P** pour les notes.

**Hors ligne :**

1. Copie le dossier entier (`index.html` et `assets`) sur l'ordinateur de projection. Aucune connexion internet n'est nécessaire.
2. Double-clique sur `index.html`. Chrome est conseillé.
3. Place la fenêtre sur le projecteur et appuie sur **F** pour le plein écran.
4. Appuie sur **P** : la fenêtre de notes s'ouvre. Glisse-la sur ton écran. Si rien ne s'ouvre, autorise les fenêtres pop-up pour ce fichier.

## Pendant l'intervention

| Touche | Action |
|---|---|
| Flèche droite, Espace, Page suivante, télécommande | Clic suivant |
| Flèche gauche, Page précédente | Revenir d'un clic |
| S (ou le bouton Sommaire) | Sommaire : miniatures de toutes les slides, un clic pour y aller |
| B ou point | Écran noir |
| Début, Fin | Première ou dernière slide |
| ? | Aide |

- Les deux fenêtres restent synchronisées : tu peux cliquer dans l'une ou l'autre.
- Le sommaire s'ouvre aussi depuis la fenêtre de notes (bouton Sommaire ou S) : la salle ne le voit pas, seule la slide choisie s'affiche sur le projecteur. Sur la slide 2, un clic sur une partie y mène directement.
- Rien ne s'anime tout seul, chaque apparition attend ton clic.
- Dans les notes, le paragraphe à dire est surligné. Le chrono démarre au premier clic (T pour pause, + et − pour la taille du texte). La barre de section devient champagne à 85 % du temps prévu, puis corail au-delà.
- Si la fenêtre de projection est rechargée, la position est conservée.

## Modifier ou ajouter un module

Chaque intervention est un bloc `<section class="module">` dans `index.html`, avec son orateur, son nom et sa durée prévue. Chaque slide est un `<article class="slide">` qui contient ses notes dans `<aside class="notes">`, jamais affichées sur la projection.

- `data-step="2"` : l'élément apparaît au 2e clic.
- `data-anim` : façon d'apparaître (`rise`, `fade`, `left`, `pop`, `lines`, `words`, `stack`, `wipe`, `draw`, `count`, `ticks`, `check`)
- `data-dim="3"` : l'élément passe en retrait au 3e clic (`data-undim` pour le rallumer).
- `<i class="fa" data-break>` : à cette étape, le fil se casse..
- `<i class="fa">` : un point d'ancrage du fil champagne. Le fil rejoint l'ancre de l'étape en cours.
- Dans les notes, `<p data-step="2">` est le texte à dire au 2e clic.
