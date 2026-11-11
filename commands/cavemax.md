---
description: CaveMaxx, short form. /cavemax is max; /cavemax off or /cavemax default switch to those.
argument-hint: "[off | default | max] [request]"
disable-model-invocation: true
---
The user typed `/cavemax`. Handle it as the CaveMaxx skill describes for `cavemax`: on its own
it means `/cave-max`, and a mode word after it picks that mode. If the CaveMaxx skill is not
already in your context, load it first: it is the `cavemaxx` skill in this plugin
(`cavemaxx:cavemaxx`), whose SKILL.md sits at the plugin root next to this commands folder.

Start with the status line, then handle whatever follows, if anything:

$ARGUMENTS
