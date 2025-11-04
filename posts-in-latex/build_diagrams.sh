#!/usr/bin/env bash
set -euo pipefail
OUTDIR="diagrams"
mkdir -p "$OUTDIR"

shopt -s nullglob
for tex in "$OUTDIR"/diagram_*.tex; do
  stem="${tex%.tex}"
  # Compile to PDF (LuaLaTeX handles modern packages well)
  lualatex -interaction=batchmode -halt-on-error -output-directory="$OUTDIR" "$tex"
  # Convert PDF -> SVG (text converted to paths to avoid font issues on web)
  dvisvgm --pdf --exact --no-fonts -o "${stem}.svg" "${stem}.pdf"
  echo "Built ${stem}.svg"
done
