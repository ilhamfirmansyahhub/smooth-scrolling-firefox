#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
SOURCE="$SCRIPT_DIR/user.js"

if [[ ! -f "$SOURCE" ]]; then
  echo "Error: user.js not found."
  exit 1
fi

mapfile -t PROFILES < <(find "$HOME/.mozilla/firefox" "$HOME/.var/app/org.mozilla.firefox/.mozilla/firefox" -maxdepth 2 -type d -name '*.default*' 2>/dev/null | sort -u)

if (( ${#PROFILES[@]} == 0 )); then
  echo "No Firefox profiles found. Start Firefox once, then run this installer again."
  exit 1
fi

for profile in "${PROFILES[@]}"; do
  cp "$SOURCE" "$profile/user.js"
  echo "Installed: $profile/user.js"
done

echo
echo "Firefox smooth scrolling preset installed."
echo "Restart Firefox for the preferences to take effect."
