#!/usr/bin/env bash
set -euo pipefail

SRC="${1:?usage: $0 file.tex [assets/slug]}"

# Where the SVGs live in your site (second arg or sensible default)
SLUG="${2:-assets}"

# Output temp file for Pandoc input
BASE="$(basename "$SRC" .tex)"
OUT="${BASE}-images.tex"

# Replace each \begin{tikzcd} ... \end{tikzcd} by a numbered Markdown image
awk -v slug="$SLUG" '
  BEGIN { inblk=0; n=0 }
  # Match \begin{tikzcd} or \begin{tikzcd}[...]
  /\\begin{tikzcd}(\[[^]]*\])?/ {
    inblk=1; n++; printf("![diagram %d](/%s/diagram_%02d.svg)\n", n, slug, n);
    next
  }
  inblk && /\\end{tikzcd}/ { inblk=0; next }
  !inblk { print }
' "$SRC" > "$OUT"

echo "Wrote $OUT"


