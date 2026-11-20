## What's new in 1.1.0

- **No slash needed.** Type `cavemaxx max`, `cavemaxx off` or `cavemaxx default`, and it works in every install: Claude.ai, Claude Code as a skill, and the plugin. `cavemax` on its own means max. The slash commands still work wherever they did before.
- **After that, one word.** Once CaveMaxx is in the conversation, the mode word alone switches: `off`, `default` or `max`.
- **A status line on every switch.** Claude confirms each change with one line that says which mode you're in and how to change it, then gets on with the work.
- **`/cavemax` on the plugin.** The Claude Code plugin has a short command for max, next to `/cavemaxx:cave-off`, `/cavemaxx:cave-default` and `/cavemaxx:cave-max`.
- **A guide and a cover page.** The download now includes `guide.html`, a short illustrated walkthrough, and a cover page. Both open offline.
- **A demo in the README.** One pricing question asked twice: the essay, then the simulator.
- **One download, three installs.** The same folder is a valid skill, a valid plugin and a valid Claude.ai upload.

## Install

- **Claude.ai**: Customize → Skills → **+** → Create skill → Upload a skill, and choose `cavemaxx-1.1.0.zip`. Code execution and file creation must be on (Settings → Capabilities).
- **Claude Code**: `git clone https://github.com/indieops-co/cavemaxx ~/.claude/skills/cavemaxx`, or unzip and move the `cavemaxx` folder into `~/.claude/skills/`. Then restart Claude Code.
- **Claude Code plugin**: `/plugin marketplace add indieops-co/skilllet-registry` then `/plugin install cavemaxx@indieops-co`.

Then type `cavemaxx max`. Claude answers with the status line. Full details in [INSTALL.md](https://github.com/indieops-co/cavemaxx/blob/main/INSTALL.md).

## Updating from 1.0.2

Replace the `cavemaxx` folder with the new one, or `git pull` inside it, then restart Claude Code. On Claude.ai, upload the new zip; it replaces the old skill.

Both attached files have identical contents; `.skill` is the extension Claude.ai shows for skills.
