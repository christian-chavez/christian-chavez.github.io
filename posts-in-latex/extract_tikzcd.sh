#!/usr/bin/env bash
set -euo pipefail

SRC="${1:?Give the input .tex file}"
OUTDIR="diagrams"
mkdir -p "$OUTDIR"

# Extract each tikzcd block into numbered _body files
awk -v outdir="$OUTDIR" '
  BEGIN {count=0; inblk=0}
  /\\begin{tikzcd}/ {inblk=1; buf=$0 ORS; next}
  inblk && /\\end{tikzcd}/ {
    buf=buf $0 ORS
    count++
    fname=sprintf("%s/diagram_%02d_body.tex", outdir, count)
    print buf > fname
    close(fname)
    inblk=0; buf=""
    next
  }
  inblk {buf=buf $0 ORS}
' "$SRC"

# Wrap each body with the preamble
for body in "$OUTDIR"/diagram_*_body.tex; do
  base="${body%_body.tex}"
  awk -v BODY_FILE="$body" '
    {
      if ($0 ~ /^% BODY_GOES_HERE$/) {
        while ((getline line < BODY_FILE) > 0) print line
        close(BODY_FILE)
      } else {
        print
      }
    }
  ' tikzcd-preamble.tex > "${base}.tex"
done

# Remove intermediate _body.tex files
rm -f "$OUTDIR"/*_body.tex

echo "Extracted $(ls "$OUTDIR"/diagram_*.tex 2>/dev/null | wc -l | tr -d ' ') tikzcd diagram(s) into $OUTDIR/"
