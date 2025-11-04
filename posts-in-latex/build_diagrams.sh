#!/usr/bin/env bash
set -euo pipefail

INDIR="diagrams"   # where diagram_XX.tex live
OUTDIR="_temp"     # where PDF/SVG/logs should go
mkdir -p "$OUTDIR"

shopt -s nullglob

# Only wrapped files (exclude *_body.tex)
for tex in "$INDIR"/diagram_[0-9][0-9].tex; do
  name="$(basename "$tex" .tex)"                # e.g. diagram_01
  echo "==> pdflatex $name.tex"
  pdflatex -interaction=nonstopmode -halt-on-error \
    -output-directory="$OUTDIR" "$tex"

  pdf="$OUTDIR/$name.pdf"                       # pdf is in OUTDIR
  if [[ ! -f "$pdf" ]]; then
    echo "No PDF produced for $tex. Check $OUTDIR/$name.log"
    exit 1
  fi

  echo "==> dvisvgm $name.pdf -> $name.svg"
  dvisvgm --pdf --exact --no-fonts --scale=2 -o "$OUTDIR/$name.svg" "$pdf"

  echo "Built $OUTDIR/$name.svg"
done

echo "All done. SVGs in $OUTDIR/"
