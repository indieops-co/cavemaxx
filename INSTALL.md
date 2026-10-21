# Installing CaveMaxx

**One download. Three ways to install it.** The folder is a Claude Skill, a Claude Code
plugin, and a Claude.ai upload. Pick the one that matches where you use Claude.

---

## Claude.ai (web, desktop, mobile)

1. Download `cavemaxx.skill` (or `cavemaxx-<version>.zip`, same contents) from the
   [Releases](../../releases) page. The repo's green **Code → Download ZIP** works as well.
2. In Claude.ai open **Settings**, find **Skills** (under Capabilities), and upload the file.
3. Open a chat and type `cavemaxx max`.

Custom skills need a plan that allows them; if you don't see a Skills section, that is why.

## Claude Code, as a skill (recommended)

Nothing to run. One folder in one place.

```bash
git clone https://github.com/indieops-co/cavemaxx ~/.claude/skills/cavemaxx
```

Or unzip the download and move the `cavemaxx` folder into:

- **Mac / Linux:** `~/.claude/skills/`
- **Windows:** `C:\Users\<you>\.claude\skills\`

You should end up with `~/.claude/skills/cavemaxx/SKILL.md`. Restart Claude Code (or run
`/reload-plugins`).

Prefer it in one project only? Put the folder at `.claude/skills/cavemaxx/` inside that
project instead.

Installed this way, skip the slash: type `cavemaxx max`, `cavemaxx off` or `cavemaxx default`.
`/cavemaxx max` works too; the hyphenated `/cave-max` does not, because Claude Code runs only
the slash commands it has registered.

## Claude Code, as a plugin

For real slash commands with tab completion:

```
/plugin marketplace add indieops-co/skilllet-registry
/plugin install cavemaxx@indieops-co
```

To try it without installing, point Claude Code at the folder for one session:

```bash
claude --plugin-dir ~/Downloads/cavemaxx
```

Plugin commands are namespaced by Claude Code, so they appear as `/cavemaxx:cave-off`,
`/cavemaxx:cave-default` and `/cavemaxx:cave-max`. Or skip the slash and the prefix:
`cavemaxx max`, `cavemaxx off`, `cavemaxx default`, and `cavemax` on its own for max.

Install it one way, not two.

---

## Check it worked

Type:

```
cavemaxx max
```

You should get back a status line:

> CaveMaxx is ON: max. Interfaces when they beat prose. Type default, maxx or off to change.

Then ask it something worth building: *"Help me decide whether to charge $29, $49 or $79."*

**If nothing happens**, work through these in order:

| Check | Fix |
|---|---|
| Is the path exactly `~/.claude/skills/cavemaxx/SKILL.md`? | A nested folder (`cavemaxx/cavemaxx/`) is the most common unzip mistake. Move the inner folder up. |
| Did you restart Claude Code? | Restart, or run `/reload-plugins`. |
| Does `/cave-max` say "Unknown command", or does Claude say it isn't a command? | Claude Code runs only the slash commands it has registered. Type `cavemaxx max` with no slash; it works in every install. |
| On Claude.ai, did the upload succeed? | The zip must contain a single folder with `SKILL.md` directly inside it. |
| Still stuck? | Say *"use CaveMaxx"* in plain words. If Claude answers with the status line, the skill is installed and only the command routing is off. |

---

## Using it

The three modes, in plain language or as commands:

| | |
|---|---|
| `cavemaxx off` · `/cave-off` · *cave off* | Text and Markdown unless you explicitly ask for an interface. |
| `cavemaxx default` · `/cave-default` · *cave default* | Stock Claude. The reset. |
| `cavemaxx max` · `/cave-max` · *cave max* | Interfaces whenever they beat prose. |

`cavemax` on its own is max too. Every switch comes back with a status line saying where
CaveMaxx is and how to change it, and from then on the mode word alone (`off`, `default`, `max`)
is enough.

A mode lasts for the rest of the conversation. New conversation, start again with `cavemaxx max`,
or put `/cave-max` in a Claude Project's instructions so every chat there starts turned up.

Mid-task, CaveMaxx may ask once:

> This could work better visually. **Diagram** · **Interactive Surface** · **Skip**

Answer with one of the three words. **Skip** gets you text and stops the question for that task.

## Updating

Replace the `cavemaxx` folder with the new one (or `git pull` inside it), then restart Claude
Code or run `/reload-plugins`. On Claude.ai, upload the new file; it replaces the old skill.

## Removing it

Delete `~/.claude/skills/cavemaxx/`, uninstall the plugin (`/plugin uninstall cavemaxx`), or
remove the skill in Claude.ai settings. CaveMaxx keeps no files, state or data of its own, so
there is nothing else to clean up.
