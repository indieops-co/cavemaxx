# CaveMaxx

## Start here

Put the `cavemaxx` folder in `~/.claude/skills/` (or upload the zip on claude.ai under **Settings → Capabilities → Skills**), open a chat, and type:

```
/cave-max
```

Claude answers with one line:

> CaveMaxx: max. Interfaces when they beat prose.

Then ask it something worth building:

```
Help me decide whether my SaaS should charge $29, $49 or $79.
400 customers, 8% growth, 4% churn.
```

Without CaveMaxx you get six paragraphs on pricing psychology. With it you get a small pricing simulator: price, customers, conversion and churn as sliders, the three tiers side by side, and one line of recommendation underneath. Change an assumption and the answer changes.

That is the whole idea. Claude already knows how to build interfaces. CaveMaxx tells it when to stop talking and build one.

---

## The three modes

| Command | Say it in words | What changes |
|---|---|---|
| `/cave-off` | *cave off* · *artifacts off* | Text and Markdown. Claude builds an interface only when you explicitly ask. Good for quick answers and anything you'll paste somewhere else. |
| `/cave-default` | *cave default* · *cave reset* | Stock Claude. CaveMaxx stops applying its preferences. The reset. |
| `/cave-max` | *cave max* · *artifacts on* | Claude actively looks for the moment an interface would serve you better than prose, and builds it. |

A mode lasts for the rest of the conversation. New chat, new choice: nothing changes until you set one, so installing CaveMaxx is safe. In a Claude Project, put `/cave-max` in the project instructions and every chat there starts turned up.

Typing `/cavemaxx` on its own, or saying "use CaveMaxx", counts as `/cave-max`, because that is what someone reaching for it wants.

---

## What `/cave-max` actually decides

Before answering, Claude asks itself what you will *do* with the answer.

| You need to… | You get | Examples |
|---|---|---|
| **read** it once | text | "What is RLS?" · "Rewrite this email" · "Why does this error happen?" |
| **see** how things relate | a diagram | an architecture · a timeline · a workflow · an org chart |
| **explore** it: filter, toggle, drill in | an interactive visual | a filterable comparison · a scenario toggle · a sortable table |
| **change inputs and reuse** the result | a mini-app | a pricing simulator · an ROI calculator · a prioritisation matrix · a planner |

Claude picks the lowest level that fully serves the need. A definition never gets an app. "Compare EBITDA across these five pricing scenarios" probably does.

**What pushes toward an interface:** numbers you will want to change; more than about three things compared on more than about three dimensions; the words *should I*, *which*, *prioritise*, *plan*, *model*, *what if*, *compare*; a request you will repeat with different inputs.

**What keeps it in text:** a factual question; advice or opinion; writing and editing; debugging one error; anything you'll paste into another app; a quick follow-up to something already built.

---

## The one question it may ask

If the best form is obvious, Claude just builds it, or just writes. If it is a genuine toss-up, it asks once, briefly:

> This could work better visually. **Diagram** · **Interactive Surface** · **Skip**

- **Diagram** is for understanding: how parts relate, flows, systems, timelines, comparisons.
- **Interactive Surface** is for doing: sliders, filters, calculators, matrices, dashboards, editable tables.
- **Skip** means text, and no more suggestions for this task.

Answer with one word. The question is a scalpel, not a reflex: at most once per task, and most tasks never see it.

---

## What it builds, and the rules it builds by

- **Less prose.** If the interface says it, Claude doesn't repeat it in 800 words underneath. What stays in text: the recommendation, the caveats, anything you must not miss.
- **Useful on open.** No empty shells. Your data, or clearly-labelled sample data, with the important number already showing.
- **Mobile-friendly.** Stacks vertically, big touch targets, no sideways scrolling.
- **Simple controls.** Sliders, selects, toggles, tables. No app chrome, sidebars or login screens.
- **Self-contained.** Plain HTML, CSS and JavaScript. No services, keys, hosting, databases or build steps.
- **Correct.** The numbers on screen are claims, so the maths is real and the assumptions are visible.
- **No UI for UI's sake.** A three-line answer stays three lines, even at max.

CaveMaxx decides *whether* to build. If you also have a design, diagramming or data-visualisation skill installed, that one decides *how well*. They don't compete.

---

## To-dos and questions you can't miss

The thing you most need from a reply is usually buried in its last paragraph: what to do next, and what Claude still needs from you. Under `/cave-max` those come out as their own blocks at the end of the reply, one per item, at most three of each, and only when they are real:

> **🦴 TO-DO 1 of 2**
> Send me your current price list, or confirm that everyone pays $29 today.
> *The simulator assumes $29. Legacy plans change the break-even.*

> **🦴 QUESTION 1 of 1**
> Does your 8% growth compound from referrals, or do you feed the pipeline yourself?
> *This one assumption flips the answer between $29 and $49.*

When the answer is an artifact you'll open again later, the same items appear at the bottom of it as cards: a coloured header with a big bone and hand-drawn bone lettering, the ask, the why, and reply chips you can tap to copy. Say *bones off* for plain text titles; *bones on* brings them back.

---

## Reusable tools and your data

When Claude builds something you will clearly use again (a P&L explorer, a prospect prioritiser, a budget model), CaveMaxx has it keep the interface separate from today's numbers: one obvious place to load data, a defined shape, an empty state that still makes sense, and sample data that is obviously sample. *Annual P&L Explorer*, not *Acme Corp FY25 P&L* with your figures baked into the source.

Business, financial, personal and health data stays yours. Where the environment supports saved state, CaveMaxx prefers private, per-user storage unless collaboration is clearly the point. It never turns your private data into shared state on its own.

---

## Where to install it

One download covers all three. Install it one way, not two.

| Where | How |
|---|---|
| **Claude.ai** (web, desktop, mobile) | Settings → Capabilities → Skills → upload the zip. Needs a plan that allows custom skills. |
| **Claude Code, as a skill** | Put the `cavemaxx` folder in `~/.claude/skills/` (Windows: `C:\Users\<you>\.claude\skills\`), then restart Claude Code or run `/reload-plugins`. For one project only, use `.claude/skills/cavemaxx/` inside it. |
| **Claude Code, as a plugin** | `/plugin marketplace add indieops-co/skilllet-registry` then `/plugin install cavemaxx@indieops-co`. Commands then appear as `/cavemaxx:cave-max` and so on. |

**Check it worked:** type `/cave-max` and look for the mode line. If nothing happens: the path must be exactly `…/skills/cavemaxx/SKILL.md` (a nested `cavemaxx/cavemaxx/` is the usual unzip mistake); restart Claude Code; on an older Claude Code that rejects unknown slash commands, say *use CaveMaxx* in words or use the plugin's `/cavemaxx:cave-max`.

**Updating:** replace the folder (or `git pull` inside it) and restart. **Removing:** delete the folder. CaveMaxx keeps no files, state or data of its own.

---

## Test it yourself

The folder ships `evals/benchmark.md`: fifteen fixed prompts, from "What is RLS in Postgres?" (text, even at max) to "Build me a KPI dashboard I can reuse every month" (a mini-app with a defined data shape). Run each one in a fresh chat under each mode and fill in the scorecard. Same prompt, three modes, compare. It is the quickest way to feel what the skill changes, and what it leaves alone.

---

## What CaveMaxx is not

It steers Claude through instruction. It does not own Claude's artifact renderer, so it cannot guarantee an artifact every time, that `/cave-off` disables every native visual behaviour, that every Claude surface behaves identically, or that behaviour survives every Claude update unchanged. It adjusts Claude's preference and decision threshold, not Anthropic's product switches.

It also does not host, store or share what gets built, add authentication, or ship a design system. Other skills teach Claude to make better HTML. CaveMaxx teaches it to notice sooner when words are the wrong interface.

And yes, there may be undocumented behaviour. Exploring is allowed.
