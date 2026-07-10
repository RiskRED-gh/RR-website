#!/usr/bin/env bash
# Checks every external link referenced across src/pages/*.md and reports
# which ones are broken (404, timeout, DNS failure, etc).
#
# Usage (from the project root):
#   chmod +x scripts/check-links.sh
#   ./scripts/check-links.sh > link-check-report.txt
#
# Then send Claude the contents of link-check-report.txt.

set -uo pipefail

echo "Checking all external links referenced in src/pages/*.md ..."
echo ""

grep -ohE '\]\((https?://[^)]+)\)' src/pages/*.md \
  | sed -E 's/^\]\((.*)\)$/\1/' \
  | sort -u \
  | while read -r url; do
      status=$(curl -s -o /dev/null -w "%{http_code}" --max-time 15 -L -A "Mozilla/5.0 (RiskRED link checker)" "$url")
      if [[ "$status" == "200" || "$status" == "301" || "$status" == "302" ]]; then
        echo "OK   [$status] $url"
      else
        echo "FAIL [$status] $url"
      fi
    done

echo ""
echo "Done. Look for lines starting with FAIL above."
