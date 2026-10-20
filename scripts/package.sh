#!/usr/bin/env bash
# Builds the CaveMaxx release package.
#
#   scripts/package.sh            -> dist/cavemaxx-<version>.zip and dist/cavemaxx.skill
#
# Both files have identical contents: a single top-level folder `cavemaxx/` containing
# SKILL.md and everything else in this repo except .git, dist and OS cruft. That layout is
# what Claude.ai's skill upload expects, and unzipping it drops a ready-to-move folder into
# ~/.claude/skills/ for Claude Code. The .skill file is the same zip with the extension
# Claude.ai shows for skills.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
VERSION="$(sed -n 's/.*"version": *"\([^"]*\)".*/\1/p' "$ROOT/.claude-plugin/plugin.json" | head -1)"
[ -n "$VERSION" ] || { echo "could not read version from .claude-plugin/plugin.json" >&2; exit 1; }

STAGE="$(mktemp -d)"
trap 'rm -rf "$STAGE"' EXIT
mkdir -p "$STAGE/cavemaxx" "$ROOT/dist"

# Copy everything except .git, dist, OS cruft, and what never ships to a user: the guide's
# Markdown source, the IndieOps release script and its output, and the release notes.
(cd "$ROOT" && tar --exclude=.git --exclude=.github --exclude=dist --exclude=assets/source --exclude=release --exclude=guide.md --exclude=make-release.sh --exclude=RELEASING.md --exclude='.DS_Store' --exclude='__pycache__' -cf - .) \
  | (cd "$STAGE/cavemaxx" && tar -xf -)

# Sanity checks: exactly one SKILL.md, frontmatter present.
[ -f "$STAGE/cavemaxx/SKILL.md" ] || { echo "SKILL.md missing" >&2; exit 1; }
COUNT="$(find "$STAGE/cavemaxx" -name SKILL.md | wc -l | tr -d ' ')"
[ "$COUNT" = "1" ] || { echo "expected exactly one SKILL.md, found $COUNT" >&2; exit 1; }
head -1 "$STAGE/cavemaxx/SKILL.md" | grep -q '^---$' || { echo "SKILL.md has no frontmatter" >&2; exit 1; }

ZIP="$ROOT/dist/cavemaxx-$VERSION.zip"
rm -f "$ZIP" "$ROOT/dist/cavemaxx.skill"
(cd "$STAGE" && zip -qr "$ZIP" cavemaxx -x '*.DS_Store')
cp "$ZIP" "$ROOT/dist/cavemaxx.skill"

echo "built:"
ls -la "$ROOT/dist/cavemaxx-$VERSION.zip" "$ROOT/dist/cavemaxx.skill"
echo
echo "contents:"
unzip -l "$ZIP" | awk 'NR>3 && $4 != "" {print "  " $4}' | grep -v '/$'
