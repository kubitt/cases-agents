# Overnight Mini-App Builder

You describe a small app or tool; it builds a working MVP overnight and hands it to you by morning — with a summary and how to run it.

## Value & ROI
Small internal tools, calculators, landing pages, and data scripts usually mean hiring a freelance developer ($50–150/hr) or juggling no-code subscriptions. A simple prototype is 4–10 hours of work — $300–1,500 each. This agent builds them while you sleep: you queue a spec during the day, it writes and runs the code in its own container overnight, and by 08:00 you have a working file. Total core cost: **$29/mo** (ASCN Start, 10,000 credits) with no required external spend — native integrations plus code that runs in the agent's own container. Honest note: real code builds are token-heavy, so on the Start plan expect roughly 2–4 solid builds per week, not one every single night. Payback vs $29: about 10–40x if it ships even one to a few usable prototypes a month.

## What it does
1. Captures a build request into the "Build Queue" and structures it into a one-night MVP spec (goal, core feature, inputs, output, acceptance check).
2. Each night builds the top-priority ready spec in its own container (Python or TypeScript) — a self-contained HTML app, a data/CSV tool, or a script.
3. Saves each artifact to a Google Drive folder and records the run in the "Build Log" with an honest tested-vs-untested note.
4. Every morning at 08:00 delivers what it built: what it does, the file link, how to run it, and what is still untested.
5. On your explicit confirmation, pushes the code to GitHub or hands off deploy steps — never without approval.

## Folder contents
- `workspace/` — copied into the ASCN agent workspace (IDENTITY, SOUL, ONBOARDING, AUTOMATIONS, 3 skills, 2 knowledge files).
- `DEPLOY_PROMPT.md` — prompt for Claude Code that transfers everything to ASCN.
- `INTEGRATIONS.md` — which integrations are needed, why, and what they cost.

## Quick deploy
1. Open Claude Code in this folder.
2. Paste the contents of `DEPLOY_PROMPT.md`.
3. Send the agent "Hi, let's set up" — it runs its own onboarding (~10 min: what to build, stack, folders, schedule, then a live test build).

## Required integrations
Native, zero external cost: Google Drive (artifacts), Google Sheets (Build Queue + Build Log), GitHub (optional, to ship code), Telegram (delivery), built-in web search/reading, and code that runs in the agent's container. Notion is an optional native alternative to Sheets. External: none required. Optional upgrades: Vercel/Netlify for live URLs (free tier, ~$20/mo Pro).

## Deliberate limitations
- **It builds MVP prototypes, not production systems** — not security-audited or load-tested; review before real use.
- **No live deployment in the core** — it builds and hands off; a public URL uses an optional paid host and always needs your confirmation.
- **Throughput is bounded by credits** — heavy builds cost credits, so a few solid builds per week on the Start plan, not unlimited nightly.
- **Cloud-side only** — no browser automation, no control of programs on your computer; you implement anything that must touch your local machine.
