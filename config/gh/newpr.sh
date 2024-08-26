#! /bin/bash
set -e

BODY_FILE="$(mktemp -d)/template.md"
PR_TEMPLATE_PATH="$PWD/.github/PULL_REQUEST_TEMPLATE.md"
TITLE="$1"

[[ -z "$TITLE" ]] && TITLE=$(git log -1 --pretty=%s)

SHORT_NAME=$(git rev-parse --abbrev-ref HEAD | awk -F '-' '{ print toupper($1) "-" (($2 ~ /[0-9]/) ? $2 : "🍅") }')

echo "[$SHORT_NAME]" > "$BODY_FILE"

if [ -f "$PR_TEMPLATE_PATH" ]; then
  tail -n +2 < "$PR_TEMPLATE_PATH" >> "$BODY_FILE"
fi

"$EDITOR" "$BODY_FILE"

gh pr create -a @me -d --title "[$SHORT_NAME] $TITLE" --body-file "$BODY_FILE"
