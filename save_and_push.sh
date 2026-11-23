#!/usr/bin/env bash
set -euo pipefail

notebook="${1:-project2.ipynb}"

if [[ ! -f "$notebook" ]]; then
  echo "Could not find $notebook. Ask course staff for help."
  exit 1
fi

git add -- "$notebook"

if git diff --cached --quiet -- "$notebook"; then
  echo "No new saved notebook changes were found."
else
  git commit -m "Save Project 2" -- "$notebook"
fi

git push
echo "Project 2 was pushed to GitHub successfully."
git status --short --branch
