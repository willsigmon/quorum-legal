#!/usr/bin/env bash
# Regenerates index.html from privacy.md. Requires pandoc.
# pagetitle (not title) sets <title> without adding a second <h1>.
set -euo pipefail
cd "$(dirname "$0")"
pandoc privacy.md -s \
  --metadata pagetitle="Quorum Privacy Policy" -V lang=en \
  --css style.css -H header.html \
  -B before-body.html -A after-body.html -o index.html
