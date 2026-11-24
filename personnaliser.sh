#!/usr/bin/env bash
# Remplit les informations de l'entreprise dans tous les fichiers du site.
#
#   1) Remplacez les valeurs entre guillemets ci-dessous (évitez les & et les ").
#   2) Lancez :  bash personnaliser.sh
#
# Le script refuse de tourner tant qu'une valeur est encore entre crochets.
set -euo pipefail
cd "$(dirname "$0")"

export SITE_URL="https://www.lemanor.ch"        # votre domaine définitif, sans / final
export RAISON_SOCIALE="[RAISON_SOCIALE]"        # ex. Lémanor Sàrl
export RUE_ET_NUMERO="[RUE_ET_NUMERO]"          # ex. Rue du Rhône 1
export NPA="[NPA]"                              # ex. 1204
export TELEPHONE="[TELEPHONE]"                  # affiché : +41 22 123 45 67
export TELEPHONE_INTL="[TELEPHONE_INTL]"        # cliquable : +41221234567
export EMAIL="[EMAIL]"                          # ex. contact@votre-domaine.ch
export UID_IDE="[UID]"                          # ex. CHE-123.456.789
export HORAIRES="[HORAIRES]"                    # ex. du lundi au vendredi, 8 h - 17 h
export HEBERGEUR="[HEBERGEUR]"                  # ex. Infomaniak Network SA, Genève
export FORM_ENDPOINT="[FORM_ENDPOINT]"          # adresse fournie par votre service de formulaire

CLES=(RAISON_SOCIALE RUE_ET_NUMERO NPA TELEPHONE TELEPHONE_INTL EMAIL UID_IDE HORAIRES HEBERGEUR FORM_ENDPOINT)
FICHIERS=(index.html sitemap.xml robots.txt)

for cle in "${CLES[@]}"; do
  if [[ "${!cle}" == "["* ]]; then
    echo "→ Complétez d'abord $cle dans personnaliser.sh"
    exit 1
  fi
done

for cle in "${CLES[@]}"; do
  jeton="$cle"
  [[ "$cle" == "UID_IDE" ]] && jeton="UID"
  export JETON="[$jeton]" VALEUR="${!cle}"
  perl -pi -e 's/\Q$ENV{JETON}\E/$ENV{VALEUR}/g' "${FICHIERS[@]}"
done

perl -pi -e 's#https://www\.lemanor\.ch#$ENV{SITE_URL}#g' "${FICHIERS[@]}"

export AUJOURDHUI="$(date +%F)"
perl -pi -e 's#<lastmod>[^<]*</lastmod>#<lastmod>$ENV{AUJOURDHUI}</lastmod>#' sitemap.xml

echo "Fait. Vérification des champs restants :"
grep -nE '\[[A-Z_]{3,}\]' "${FICHIERS[@]}" || echo "  aucun champ à compléter."
