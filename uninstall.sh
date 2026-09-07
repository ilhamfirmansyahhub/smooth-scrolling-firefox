#!/usr/bin/env bash
set -euo pipefail

BASE_DIRS=(
  "$HOME/.config/mozilla/firefox"
  "$HOME/.mozilla/firefox"
  "$HOME/.var/app/org.mozilla.firefox/.config/mozilla/firefox"
  "$HOME/.var/app/org.mozilla.firefox/.mozilla/firefox"
)

FOUND=0

for base in "${BASE_DIRS[@]}"; do
  [[ -d "$base" ]] || continue

  while IFS= read -r file; do
    FOUND=1
    if grep -q 'ilhamfirmansyahhub/smooth-scrolling-firefox' "$file" 2>/dev/null; then
      rm -f "$file"
      echo "Removed: $file"
    else
      echo "Skipped: $file (not managed by this project)"
    fi
  done < <(find "$base" -maxdepth 2 -type f -name 'user.js' 2>/dev/null | sort -u)
done

if (( FOUND == 0 )); then
  echo "No user.js files found in the supported Firefox profile locations."
fi

echo
echo "Done. Restart Firefox after uninstalling."
