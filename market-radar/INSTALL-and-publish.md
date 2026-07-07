# Market Radar — install & publish

This package turns the agent into a self-serve template: a new user launches it, the agent runs onboarding (skill `onboarding`), collects the watchlist, timezone, channel, and permissions, creates the morning task, and shows the first brief.

> ⚠️ This file (INSTALL-and-publish.md) is a guide for you, the author. Do NOT upload it into the agent — it is not part of the agent.

## Where each file goes
Two ways to install. The **Files** section is simplest for direct upload — it mirrors the agent's filesystem, so you drop each file at the exact path below (keep the folders). You can also use the dedicated Brain sections.

| File | Direct path (Files section) | Brain UI section |
|---|---|---|
| IDENTITY.md | `/IDENTITY.md` | Brain → Knowledge base (core file) |
| SOUL.md | `/SOUL.md` | Brain → Knowledge base (core file) |
| USER.md | `/USER.md` | Brain → Knowledge base (core file) |
| MEMORY_POLICY.md | `/MEMORY_POLICY.md` | Brain → Memory (policy) — or Files root |
| watchlist.md | `/knowledge/watchlist.md` | Brain → Knowledge base → Documents (add / drag-drop) |
| onboarding/SKILL.md | `/skills/onboarding/SKILL.md` | Brain → Skills (+ Add) |
| radar-brief/SKILL.md | `/skills/radar-brief/SKILL.md` | Brain → Skills (+ Add) |
| INSTALL-and-publish.md | — do not install — | — author guide only — |

Notes:
- Skills must live at `skills/<name>/SKILL.md` — keep the folder per skill.
- IDENTITY / SOUL / USER are the three core knowledge-base files; the watchlist is a regular knowledge Document.
- MEMORY_POLICY defines how memory is stored; it sits at the workspace root — add it via the Files section if there is no dedicated Memory-policy slot.

## How it fits together
- **IDENTITY** gates the first run: if `setup: PENDING` or the watchlist says "NOT CONFIGURED" → onboarding first.
- **onboarding** runs setup one question at a time, connects the channel/Notion, creates the task, shows a demo brief, then sets `setup: COMPLETE`.
- **SOUL** holds quality: data-fidelity rule (anti-fabrication), external-action gate, secret handling, knowledge-base-over-chat priority.
- **radar-brief** defines the brief format; **watchlist** defines what to track (filled during onboarding).

## Pre-publish checklist
- [ ] `USER.md` has `setup: PENDING` and placeholder fields (none of your personal data).
- [ ] `knowledge/watchlist.md` says "STATUS: NOT CONFIGURED", lists empty/examples.
- [ ] No secrets or tokens in files; your personal Notion/Telegram disconnected (each user connects their own).
- [ ] Core memory cleared of your personal entries.
- [ ] From-scratch test: launch the template in a new workspace, say "hi" — onboarding should start, not a radar.
- [ ] Onboarding reaches the first brief and creates the "Morning Radar" task.
- [ ] Fabrication traps work (missing data → "no data"); radar has no invented versions/numbers.

## Publish
Publish the agent as a marketplace template: name "Market Radar", short description (what it does + who it's for), category (analytics / productivity). After publishing, install it from the marketplace into a clean workspace and go through onboarding as a regular user — that's the final acceptance test.
