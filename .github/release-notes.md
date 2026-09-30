## What's new in 1.0.2

- **To-do and question blocks.** Under `/cave-max`, what you need to do next and what Claude still needs from you come out as their own blocks at the end of the reply, one per item, at most three of each, and only when they are real. Artifacts you'll reopen later carry the same items as cards at the bottom.
- **Bone headers by default.** Cards in artifacts get a coloured header strip (orange for TO-DO, beige for questions) with a big tilted bone and hand-drawn bone lettering for the title. Say *bones off* for plain text titles.
- **Plays well with caveman.** The [caveman](https://github.com/JuliusBrussee/caveman) skill makes Claude terse; CaveMaxx decides when words are the wrong medium. Install both and they stay out of each other's way.
- **RELEASING.md** explains how new versions are published, no terminal required.

## Install

- **Claude.ai**: Settings → Skills → upload `cavemaxx.skill` (or the zip).
- **Claude Code**: unzip and move the `cavemaxx` folder into `~/.claude/skills/`, or `git clone https://github.com/indieops-co/cavemaxx ~/.claude/skills/cavemaxx`.
- **Claude Code plugin**: `/plugin marketplace add indieops-co/skilllet-registry` then `/plugin install cavemaxx@indieops-co`.

Then type `/cave-max`. Full details in [INSTALL.md](https://github.com/indieops-co/cavemaxx/blob/main/INSTALL.md).

Both attached files have identical contents; `.skill` is the extension Claude.ai shows for skills.
