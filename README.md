# CaveMaxx

**You already have the app builder. Turn it up.**

Claude sometimes talks when it should build. CaveMaxx changes that.

CaveMaxx is a free, tiny Claude Skill (a *Skilllet*) that changes one thing: how readily
Claude answers with a useful graphic, a diagram, a calculator, a comparison
matrix, a dashboard, a mini-app, instead of another wall of text.

It adds no framework, no hosting, no database, no API keys and no account. Claude already
knows how to build interfaces. CaveMaxx tells it when to stop talking and build one.

```
WORDS
  ↓
MORE WORDS
  ↓
TOO MANY WORDS
  ↓
CAVEMAXX
  ↓
DRAW THING
```

## Same prompt, two answers

> Help me decide whether my SaaS should charge $29, $49 or $79.

| Claude | Claude + CaveMaxx |
|---|---|
| Six paragraphs on pricing psychology, a pros-and-cons list per tier, and a recommendation you re-ask about every time an assumption changes. | A small pricing simulator. Price, customer count, conversion and churn as sliders; projected revenue per tier side by side; one line of recommendation underneath. Change an assumption and the answer changes. |

More in [`examples/`](examples/).

## Install

Full instructions, verification and troubleshooting: **[INSTALL.md](INSTALL.md)**. The short version:

| Where | How |
|---|---|
| **Claude.ai** | Settings → Skills → upload `cavemaxx.skill` (or the zip) from [Releases](../../releases). |
| **Claude Code** | `git clone https://github.com/davidsparrow/cavemaxx ~/.claude/skills/cavemaxx`, then restart Claude Code. |
| **Claude Code plugin** | `/plugin marketplace add davidsparrow/cavemaxx` then `/plugin install cavemaxx@cavemaxx`. |

One download covers all three: the folder is a valid skill *and* a valid plugin.

Check it worked: type `/cave-max`. Claude replies

> CaveMaxx: max. Interfaces when they beat prose.

## Commands

| | |
|---|---|
| `/cave-off` | Text and Markdown. Claude builds an interface only if you explicitly ask. Good for quick questions and answers you'll paste somewhere else. |
| `/cave-default` | Stock Claude. CaveMaxx stops applying its preferences. The reset. |
| `/cave-max` | Claude actively looks for the moment an interface would serve you better than prose, and builds it. |

Plain language works too: *cave off*, *cave default*, *cave max*, *visual mode off / default / high*.
A mode sticks for the rest of the conversation. Nothing changes until you set one, so
installing CaveMaxx is safe.

Tip: in a Claude Project, put `/cave-max` in the project instructions and every chat starts
turned up.

## What `/cave-max` actually does

Before answering, Claude asks itself what you will *do* with the answer.

- Read it once → **text**
- Look at it to understand how things relate → **a diagram**
- Poke at it, change an assumption, filter, sort, come back to it → **an interface**

Four levels: text, visual, interactive visual, mini-app. Claude picks the lowest level that
fully serves the need. If the best form is obvious, it just builds it. If it is a genuine
toss-up, it asks once, briefly:

> This could work better visually. **Diagram** · **Interactive Surface** · **Skip**

Not on every message. *"What does EBITDA mean?"* gets a sentence, even at max.
*"Compare EBITDA across these five pricing scenarios"* gets a tool.

## What it builds

- **Less prose.** If the interface says it, Claude doesn't repeat it in 800 words underneath.
- **Useful on open.** No empty shells. Real or clearly-labelled sample data, and the important
  number already showing.
- **Mobile-friendly.** Stacks vertically, big touch targets, no sideways scrolling.
- **Simple controls.** Sliders, selects, toggles, tables. No app chrome.
- **Self-contained.** Plain HTML, CSS and JavaScript. No services, keys, hosting or builds.
- **Correct.** The numbers on screen are claims, so the maths is real and the assumptions are
  visible.

## To-dos and questions you can't miss

The thing you most need from a reply is usually buried in its last paragraph: what to do next,
and what Claude still needs from you. Under `/cave-max` those come out as their own blocks at
the end of the reply, one per item, at most three of each, and only when they are real:

> **🦴 TO-DO 1 of 2**
> Send me your current price list, or confirm that everyone pays $29 today.
> *The simulator assumes $29. Legacy plans change the break-even.*

> **🦴 QUESTION 1 of 1**
> Does your 8% growth compound from referrals, or do you feed the pipeline yourself?
> *This one assumption flips the answer between $29 and $49.*

When the answer is an artifact you'll open again later, the same items appear at the bottom of
it as cards: a coloured header with a big bone and hand-drawn bone lettering, the ask, the
why, and reply chips. Say *bones off* if you'd rather have plain text titles.

## Reusable tools and your data

When Claude builds something you will clearly use again (a P&L explorer, a prospect
prioritiser, a budget model), CaveMaxx asks it to keep the interface separate from today's
data: one obvious place to load numbers, a defined shape, an empty state, sample data that is
obviously sample. *Annual P&L Explorer*, not *Acme Corp FY25 P&L* with your figures baked into
the source.

Business, financial, personal and health data stays yours. Where the environment supports
saved state, CaveMaxx prefers private, per-user storage unless collaboration is clearly the
point.

## Works with your other skills

Expert skills bring domain judgement; CaveMaxx brings the instinct to build. Pair it with,
say, a database-setup skill and a checklist becomes a checklist app, a cost discussion becomes
a cost simulator, an architecture explanation becomes a map.

It also pairs well with [caveman](https://github.com/JuliusBrussee/caveman), the skill that
makes Claude's prose terse. Caveman shortens what Claude says; CaveMaxx replaces it with
something you can use when that is better. Install both and they stay out of each other's way.

## What CaveMaxx is not

CaveMaxx steers Claude through instruction. It does not own Claude's artifact renderer, so it
cannot guarantee that an artifact is always produced, that `/cave-off` disables every native
visual behaviour, that every Claude surface behaves identically, or that behaviour survives
every Claude update unchanged. It adjusts Claude's preference and decision threshold, not
Anthropic's product switches.

It also does not host, store, sell or share artifacts, add authentication, replace Claude
Artifacts, or ship a design system. Other skills teach Claude to make better HTML. CaveMaxx
teaches Claude to notice sooner when words are the wrong interface.

## Test it yourself

[`evals/benchmark.md`](evals/benchmark.md) has a fixed prompt set to run under each mode, with
a scorecard. Same prompt, three modes, compare.

## Package

```
SKILL.md              the skill: modes, decision framework, building rules
README.md             this file
INSTALL.md            install, verify, update, remove
examples/             same prompt under each mode: pricing, comparison, diagram, reusable data,
                      plus one real generated pricing simulator
evals/benchmark.md    the test prompt set and scorecard
assets/               small SVG marks Claude inlines into generated cards
commands/             /cave-off, /cave-default, /cave-max as plugin slash commands
.claude-plugin/       plugin.json and marketplace.json, so the folder installs as a plugin
scripts/package.sh    builds the release zip and .skill file
.github/             release workflow; see RELEASING.md for the three-step release routine
RELEASING.md          how to publish a new version, no terminal required
LICENSE               IndieOps Free License
```

## License

Copyright © 2026 Dave Biggs. All rights reserved.  
Licensed under the [IndieOps Free License v1.0](LICENSE). Free to use, even commercially; don't redistribute it.
