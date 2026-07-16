# Second Brain

Text it anything you want to remember — a note, a link, a book, an idea — and it captures, summarizes, and resurfaces it, so nothing you save is ever lost.

## Value & ROI
Note apps become graveyards because organizing has more friction than forgetting. This agent removes the friction: you text it like a friend, it files everything into one searchable index, summarizes every link you save, and brings the good stuff back on a weekly review. It replaces a stack of paid tools — a read-later app with AI summaries (Readwise Reader ~$8/mo), an AI note tool (Notion AI ~$10/mo), a spaced-repetition/resurfacing app (~$10/mo) — roughly $25–45/mo combined. It also saves the ~10 minutes you'd spend reading and summarizing each saved link (20 links/week is ~3 hours). Total cost: $29/mo (ASCN Start, 10,000 credits), ZERO external API cost. Honest payback vs $29: it covers itself on tool consolidation alone (~1x), and ~5–10x once you count the hours saved — the real win is that everything you capture stays findable forever.

## What it does
1. Capture by text — send a note, link, idea, book, quote, person, or task from ASCN chat or Telegram; it logs a row to Google Sheets "Memory Index" and a full page in Notion "Second Brain".
2. Auto-classifies each item (a `type` and `tags`) and writes a short `title` — no folders or manual tagging required.
3. Every night it reads the web page behind each newly saved link and writes a concise, sourced `summary` with key takeaways.
4. Recall on demand — ask "what did I save about X" and it returns matching items by keyword, tag, or date.
5. Weekly review (Monday 08:00) — what you captured this week grouped by topic, plus 3–5 older items resurfaced (spaced repetition) and your open to-read loops.
6. Keeps the index tidy: `status` values new / to_read / summarized / archived / done, and de-duplicates repeats.
7. Stores full notes and link summaries as Notion pages (or Google Docs), each linked from its index row via `page_url`.
8. Never rewrites your words — it adds structure only, and every summary keeps its source link.

## Folder contents
- `workspace/` — copied into the ASCN agent workspace (IDENTITY, SOUL, ONBOARDING, AUTOMATIONS, skills, knowledge).
- `DEPLOY_PROMPT.md` — prompt for Claude Code that transfers everything to ASCN.
- `INTEGRATIONS.md` — which integrations are needed, why, and what they cost.

## Quick deploy
1. Open Claude Code in this folder.
2. Paste the contents of `DEPLOY_PROMPT.md`.
3. Send the agent "Hi, let's set up" — it runs its own onboarding (capture types, index, store, then a live test on 2–3 real items).

## Required integrations
Native, all zero cost: Google Sheets (required — the "Memory Index"), Notion (recommended — the "Second Brain" store; Google Docs/Drive works as an alternative). Built-in web reading summarizes saved links. External APIs: none. Channel: Telegram (recommended, for zero-friction capture and the weekly review).

## Deliberate limitations
- Capture is text-based; there is no native voice-note transcription — paste text, or add a transcription service later (see INTEGRATIONS Optional upgrades).
- It reads only public web pages the built-in reader can fetch; JS-heavy, paywalled, or login-gated pages may fail — these are flagged "insufficient data", never faked (a scraping API can be added later).
- It indexes and tags; it is not a backlink/graph tool (no automatic bidirectional links like Obsidian).
- No browser automation and no automatic import from closed apps (Apple Notes, iMessage) — you forward text to it (platform limits).
- Resurfacing is date-based spaced repetition, not an algorithmic SRS engine.
