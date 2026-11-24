# Site Lémanor — landing page

Page unique, sans framework et avec un seul petit script (le curseur avant / après), rapide et pensée pour le référencement local à Genève et en Suisse.

## Contenu du dossier

| Fichier | Rôle |
|---|---|
| `index.html` | La page (HTML, CSS et données structurées dans un seul fichier) |
| `robots.txt`, `sitemap.xml` | Consignes d'exploration et plan du site pour Google |
| `favicon.svg`, `favicon-48.png`, `apple-touch-icon.png`, `icon-512.png` | Icônes (onglet, mobile, logo des données structurées) |
| `og-image.png` | Image affichée au partage (WhatsApp, LinkedIn, Facebook…) — 1200 × 630 |
| `images/` | Les six images du comparateur avant / après (illustrations d'exemple, à remplacer par vos photos) |
| `personnaliser.sh` | Remplit vos coordonnées dans les fichiers |
| `sources/` | Fichiers pour refaire les images — à ne pas mettre en ligne |

## 1. Compléter les informations

Le site contient des champs entre crochets (`[TELEPHONE]`, `[EMAIL]`, `[NPA]`…) et un domaine provisoire `https://www.lemanor.ch`. **Ne mettez pas le site en ligne tant qu'il en reste.**

Ouvrez `personnaliser.sh`, remplacez les valeurs, puis :

```bash
bash personnaliser.sh
```

Le script affiche les champs restants. Vous pouvez aussi les chercher à la main avec `grep -n "\[[A-Z_]*\]" index.html`.

- **Formulaire** : un site statique ne peut pas envoyer d'e-mails seul. Il faut un service de formulaire (Formspree, Web3Forms, ou le formulaire de votre hébergeur) qui vous donne une adresse à mettre dans `FORM_ENDPOINT`. Ce service reçoit les données saisies : citez-le dans les mentions légales.
- **Mentions légales** : le texte fourni est indicatif, à faire relire (loi sur la protection des données, mentions de l'éditeur).
- **Promesses du site** (« équipes attitrées », « interlocuteur unique », « produits professionnels »…) : gardez uniquement celles que vous tenez.

## Photos avant / après

La section « Avant, après » contient trois comparateurs avec curseur : on le glisse à la souris ou au doigt, ou on le déplace avec les flèches du clavier. Les images fournies sont des **illustrations dessinées** (elles portent la mention « Illustration d'exemple »), pas des photos de vos chantiers. Ne les laissez pas en ligne : remplacez-les par vos vraies photos, avec l'accord des clients.

Pour chaque comparateur, dans `index.html` :

1. Déposez vos deux photos dans `images/` (JPEG ou WebP, 1200 × 800 px, idéalement moins de 200 Ko chacune). Prenez l'avant et l'après **du même angle**, avec la même lumière : c'est ce qui rend le curseur convaincant.
2. Changez le `src` des deux balises `<img>` (classes `avant` et `apres`).
3. Réécrivez le texte `alt` pour décrire ce que montre la vraie photo (pièce, type de saleté ou de chantier) : Google s'en sert pour l'indexation des images.
4. Adaptez `width` et `height` si vos photos n'ont pas le format 3 : 2, ainsi que le titre et la légende sous l'image.

Pour ajouter un comparateur, copiez un bloc `<figure class="avap">` en changeant les deux `id` (`cmp-4`, etc.) et le `for` du `<label>` correspondant.

## 2. Mettre en ligne

Tout le dossier, sauf `sources/`, `personnaliser.sh` et ce fichier, se dépose à la racine de l'hébergement. Hébergeurs adaptés : Infomaniak (Genève), Cloudflare Pages, Netlify. Activez le HTTPS et redirigez `lemanor.ch` vers `www.lemanor.ch` (ou l'inverse) : une seule adresse doit répondre.

## 3. Après la mise en ligne (ce qui fait vraiment monter dans Google)

1. **Google Search Console** : ajoutez le domaine, envoyez `sitemap.xml`, demandez l'indexation de la page d'accueil.
2. **Fiche Google Business Profile** : c'est le levier n°1 pour « nettoyage Genève » (carte et résultats locaux). Catégorie « Service de nettoyage », zone desservie, photos réelles, horaires. Nom, adresse et téléphone **identiques** à ceux du site.
3. **Avis clients** : demandez-en dès les premières missions et répondez à chacun.
4. **Annuaires suisses** : local.ch, search.ch et les annuaires de votre branche, avec les mêmes coordonnées.
5. **Vrais visuels** : ajoutez des photos de vos équipes et de vos chantiers (format WebP, attribut `alt` descriptif, `width` et `height` renseignés).
6. **Tests** : PageSpeed Insights (vitesse) et Test des résultats enrichis de Google (données structurées).
7. **Bing Webmaster Tools** : importez le site depuis la Search Console, en deux clics.

## Ce que le référencement ne peut pas promettre

Aucune balise ne garantit une position. Une page unique cible surtout « Genève ». Pour viser Lausanne, Zurich ou « nettoyage de fin de bail », la suite logique est une page dédiée par ville et par service, chacune avec son propre texte.

## Ce qui est déjà en place pour Google

- Titre (57 caractères) et description (149 caractères) calibrés pour l'affichage dans les résultats.
- `lang="fr-CH"`, adresse canonique, balises hreflang, `robots` autorisant les grands aperçus.
- Un seul titre `h1`, des `h2` et `h3` hiérarchisés, des mots-clés naturels (nettoyage, conciergerie, fin de bail, PPE, régies, Genève, villes desservies).
- Données structurées JSON-LD : entreprise locale (`ProfessionalService`), catalogue de services, page FAQ, site web.
- Balises Open Graph et Twitter pour le partage, icônes, `robots.txt` et `sitemap.xml`.
- Page légère : CSS intégré, un script de 10 lignes (curseur avant / après), images chargées à la demande.
- Accessibilité : lien d'évitement, contrastes vérifiés, champs de formulaire étiquetés, navigation au clavier.

## Limites connues

- Les polices viennent de Google Fonts, ce qui transmet l'adresse IP du visiteur à Google (c'est dit dans les mentions légales). Pour l'éviter, hébergez Playfair Display et Montserrat vous-même.
- Les données structurées doivent refléter le contenu visible : une fois vos coordonnées remplies, elles le feront.
