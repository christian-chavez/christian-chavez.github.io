#!/usr/bin/env bash
set -euo pipefail

SRC="${1:?Give the input .tex file}"
OUTDIR="diagrams"
mkdir -p "$OUTDIR"

# Count and extract each tikzcd block
count=0
awk '
  /\\begin{tikzcd}/ {inblk=1; buf=$0 ORS; next}
  inblk && /\\end{tikzcd}/ {buf=buf $0 ORS; print buf; inblk=0; buf=""; next}
  inblk {buf=buf $0 ORS}
' "$SRC" | while IFS= read -r -d '' block || [[ -n "$block" ]]; do
  : # no-op (keeps while happy)
done 2>/dev/null

# The above awk prints blocks but we also want them numbered.
# Re-run with a small tweak to number and write files:
awk -v outdir="$OUTDIR" '
  BEGIN{count=0; inblk=0}
  /\\begin{tikzcd}/ {inblk=1; buf=$0 ORS; next}
  inblk && /\\end{tikzcd}/ {
    buf=buf $0 ORS;
    count++;
    fname=sprintf("%s/diagram_%02d_body.tex", outdir, count);
    print buf > fname;
    close(fname);
    inblk=0; buf="";
    next
  }
  inblk {buf=buf $0 ORS}
' "$SRC"

# Wrap each body with the preamble
for body in "$OUTDIR"/diagram_*_body.tex; do
  base="${body%_body.tex}"
  {
    sed '1,/^% BODY_GOES_HERE$/d' /dev/null # no-op placeholder
    # Build full .tex by splicing the BODY into preamble template
    awk -v BODY_FILE="$body" '
      BEGIN{mode="copy"}
      {
        if ($0 ~ /^% BODY_GOES_HERE$/) {
          # insert body here
          while ((getline line < BODY_FILE) > 0) print line
        } else {
          print
        }
      }
    ' tikzcd-preamble.tex
  } > "${base}.tex"
done

echo "Extracted $(ls "$OUTDIR"/diagram_*.tex 2>/dev/null | wc -l | tr -d ' ') tikzcd diagram(s) into $OUTDIR/"
