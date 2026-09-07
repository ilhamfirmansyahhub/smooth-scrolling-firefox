#!/usr/bin/env bash
set -euo pipefail

mapfile -t PROFILES < <(find "$HOME/.mozilla/firefox" "$HOME/.var/app/org.mozilla.firefox/.mozilla/firefox" -maxdepth 2 -type f -name 'user.js' 2>/dev/null | sort -u)

if (( ${#PROFILES[@]} == 0 )); then
  echo "No user.js files found in the standard Firefox profile locations."
  exit 0
fi

for file in "${PROFILES[@]}"; do
  if grep -q 'ilhamfirmansyahhub/smooth-scrolling-firefox' "$file" 2>/dev/null; then
    rm -f "$file"
    echo "Removed: $file"
  else
    echo "Skipped: $file (not managed by this project)"
  fi
done

echo
echo "Done. Restart Firefox after uninstalling."
