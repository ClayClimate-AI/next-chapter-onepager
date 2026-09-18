#!/bin/sh
# Structural check against SPEC.md's Definition of Done.
# Zero dependencies: POSIX shell + grep only.
set -eu

fail=0

check() {
  desc="$1"
  ok="$2"
  if [ "$ok" -eq 0 ]; then
    echo "PASS: $desc"
  else
    echo "FAIL: $desc"
    fail=1
  fi
}

if [ ! -f index.html ]; then
  echo "FAIL: index.html exists"
  exit 1
fi

h1_count=$(grep -c '<h1' index.html)
[ "$h1_count" -eq 1 ]
check "exactly one <h1> headline" $?

section_count=$(grep -c '<section' index.html)
[ "$section_count" -eq 3 ]
check "exactly three <section> elements" $?

cta_count=$(grep -c 'href="https://www.nextchapterproject.org/"' index.html)
[ "$cta_count" -eq 1 ]
check "exactly one CTA link to nextchapterproject.org" $?

! grep -q '<script' index.html
check "no <script> tags (no JavaScript)" $?

extra_html=$(find . -maxdepth 1 -name '*.html' ! -name 'index.html' | wc -l | tr -d ' ')
[ "$extra_html" -eq 0 ]
check "no pages beyond index.html" $?

if [ "$fail" -eq 0 ]; then
  echo "All structural checks passed."
  exit 0
else
  echo "One or more structural checks failed."
  exit 1
fi
