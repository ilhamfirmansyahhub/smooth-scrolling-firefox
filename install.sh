#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
SOURCE="$SCRIPT_DIR/user.js"

if [[ ! -f "$SOURCE" ]]; then
  echo "Error: user.js not found."
  exit 1
fi

BASE_DIRS=(
  "$HOME/.mozilla/firefox"
  "$HOME/.var/app/org.mozilla.firefox/.mozilla/firefox"
)

PROFILES=()

for base in "${BASE_DIRS[@]}"; do
  [[ -f "$base/profiles.ini" ]] || continue

  while IFS= read -r profile; do
    [[ -n "$profile" ]] && PROFILES+=("$profile")
  done < <(
    awk -F= -v base="$base" '
      /^Path=/ {
        path=$2
        if (path ~ /^\//) print path
        else print base "/" path
      }
    ' "$base/profiles.ini"
  )
done

mapfile -t PROFILES < <(printf '%s\n' "${PROFILES[@]}" | awk 'NF && !seen[$0]++')

if (( ${#PROFILES[@]} == 0 )); then
  echo "No Firefox profiles found."
  echo "Open Firefox once, close it, then run this installer again."
  exit 1
fi

INSTALLED=0
for profile in "${PROFILES[@]}"; do
  if [[ -d "$profile" ]]; then
    cp "$SOURCE" "$profile/user.js"
    echo "Installed: $profile/user.js"
    INSTALLED=1
  fi
done

if (( INSTALLED == 0 )); then
  echo "No valid Firefox profile directories found."
  exit 1
fi

echo
echo "Firefox smooth scrolling preset installed."
echo "Restart Firefox for the preferences to take effect."
