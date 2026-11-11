#!/usr/bin/env bash
# Builds the CaveMaxx release package for the GitHub release page.
#
#   scripts/package.sh            -> dist/cavemaxx-<version>.zip and dist/cavemaxx.skill
#
# It picks no files itself. make-release.sh, the brand kit's release script, builds the zip that
# goes on Gumroad, and this script checks that zip and copies it under the two names the release
# page uses. So the GitHub download and the Gumroad download are one product. To change what
# ships, change the master make-release.sh in indieops-brand, not this script.
#
# Both files have identical contents: a single top-level folder `cavemaxx/` with SKILL.md at its
# root. That layout is what Claude.ai's skill upload expects; unzipping it drops a ready-to-move
# folder into ~/.claude/skills/ for Claude Code; and the same folder loads as a plugin. The .skill
# file is the same zip with the extension Claude.ai shows for skills.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
VERSION="$(sed -n 's/.*"version": *"\([^"]*\)".*/\1/p' "$ROOT/.claude-plugin/plugin.json" | head -1)"
[ -n "$VERSION" ] || { echo "could not read version from .claude-plugin/plugin.json" >&2; exit 1; }

# make-release.sh names the folder inside the zip after the folder it runs in, so run it from a
# copy called cavemaxx. A clone called src, or a worktree, then still ships cavemaxx/.
WORK="$(mktemp -d)"
trap 'rm -rf "$WORK"' EXIT
rsync -a --exclude=/dist --exclude=/release "$ROOT/" "$WORK/cavemaxx/"
bash "$WORK/cavemaxx/make-release.sh"
BUILT="$(ls "$WORK"/cavemaxx/release/*-v"$VERSION".zip 2>/dev/null | head -1 || true)"
[ -n "$BUILT" ] || { echo "make-release.sh built no zip for v$VERSION" >&2; exit 1; }

CHECK="$WORK/check"
mkdir "$CHECK"
unzip -q "$BUILT" -d "$CHECK"

# Sanity checks: one folder named cavemaxx, exactly one SKILL.md (Claude.ai takes one skill per
# upload), frontmatter present, and every skills path plugin.json lists is in the package
# (`claude plugin validate` fails on a missing one).
TOP="$(ls -A "$CHECK")"
[ "$TOP" = "cavemaxx" ] || { echo "expected one folder named cavemaxx in the zip, found: $(echo $TOP)" >&2; exit 1; }
PKG="$CHECK/cavemaxx"
[ -f "$PKG/SKILL.md" ] || { echo "SKILL.md missing" >&2; exit 1; }
COUNT="$(find "$PKG" -name SKILL.md | wc -l | tr -d ' ')"
[ "$COUNT" = "1" ] || { echo "expected exactly one SKILL.md, found $COUNT" >&2; exit 1; }
head -1 "$PKG/SKILL.md" | grep -q '^---$' || { echo "SKILL.md has no frontmatter" >&2; exit 1; }
for p in $(sed -n 's/.*"skills": *\[\(.*\)\].*/\1/p' "$PKG/.claude-plugin/plugin.json" | tr -d '" ' | tr ',' ' '); do
  [ -e "$PKG/$p" ] || { echo "plugin.json lists skills path $p, which is not in the zip" >&2; exit 1; }
done

ZIP="$ROOT/dist/cavemaxx-$VERSION.zip"
mkdir -p "$ROOT/dist"
rm -f "$ZIP" "$ROOT/dist/cavemaxx.skill"
cp "$BUILT" "$ZIP"
cp "$BUILT" "$ROOT/dist/cavemaxx.skill"

echo "built from $(basename "$BUILT"):"
ls -la "$ZIP" "$ROOT/dist/cavemaxx.skill"
echo
echo "contents:"
unzip -l "$ZIP" | awk 'NR>3 && $4 != "" {print "  " $4}' | grep -v '/$'
