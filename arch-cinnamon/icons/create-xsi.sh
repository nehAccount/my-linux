#!/usr/bin/env bash
# formira symlinkove sa prefiksom xsi- za symbolic ikone
# use: kopirati icon-pack u /usr/share/icons/ i iz /usr/share/icons/my-icons pokrenuti skriptu
set -euo pipefail

# Pronađi sve direktorije koji se zovu "symbolic"
find . -type d -name symbolic | while read -r dir; do
  (
    cd "$dir" || exit 0

    for file in *.svg; do
      # Ako nema .svg fajlova
      [[ -e "$file" ]] || continue

      # Ignoriši već prefiksirane fajlove
      [[ "$file" == xsi-* ]] && continue

      prefixed="xsi-$file"

      # Ako već postoji -> preskoči
      [[ -e "$prefixed" || -L "$prefixed" ]] && continue

      if [[ -L "$file" ]]; then
        # Razriješi krajnji target postojećeg symlinka
        target="$(readlink -f "$file")"
      else
        # Regularni fajl
        target="$(realpath "$file")"
      fi

      # Napravi novi symlink sa xsi- prefiksom
      ln -s "$target" "$prefixed"
    done
  )
done
