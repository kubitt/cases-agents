# Personal Assistant

Your AI chief of staff for email and meetings: triages the inbox, turns messages and calls into tracked tasks, watches deadlines, and briefs you every morning — drafting replies in your voice, sending nothing without you.

## Value & ROI
People spend around 90 minutes a day in email; with an assistant doing the first pass, that drops toward ~25. Say it saves you a conservative 1 hour a day — 20+ hours a month of focused time back, plus deadlines that stop slipping and meetings that turn into action instead of forgotten notes. At even $30/hour of your time that is $600+/month of value. Cost: $29/mo (ASCN Start) — everything runs on native integrations, no paid APIs. Payback: roughly 15-20x.

## What it does
1. Polls Gmail on your schedule and sorts new mail: Action needed / Waiting on reply / FYI / Noise.
2. Extracts tasks and deadlines from emails and meetings into your Action Tracker (Notion or Google Sheets).
3. Drafts replies in your voice — saved as Gmail drafts, never auto-sent.
4. Summarizes meetings from a transcript, notes, or a shared doc: decisions, action items, open questions.
5. Tracks deadlines and nudges you before they hit — today's due items and anything overdue.
6. Sends a morning brief: today's meetings, emails needing action, deadlines, and top tasks.

## Folder contents
- `workspace/` — copied into the ASCN agent workspace (IDENTITY, SOUL, ONBOARDING, 3 skills, 2 knowledge files, AUTOMATIONS).
- `DEPLOY_PROMPT.md` — prompt for Claude Code that transfers everything to ASCN.
- `INTEGRATIONS.md` — integrations, costs, and optional upgrades.

## Quick deploy
1. Open Claude Code in this folder.
2. Paste the contents of `DEPLOY_PROMPT.md`.
3. Send the agent "Hi, let's set up" — it runs its own onboarding (~8 min: connect Gmail, set your priorities and reply voice, pick a task destination, then a real triage of your last 24 hours).

## Required integrations
Native only: Gmail (required), Notion or Google Sheets for the Action Tracker (required, your choice), Google Calendar (recommended), Google Meet (optional, for transcripts), Telegram (recommended channel). No external API keys; no cost beyond the $29/mo plan. Details in `INTEGRATIONS.md`.

## Deliberate limitations
- **Drafts only — never sends.** Every reply and invite waits for your click. By design: an assistant that sends on its own is a liability.
- **Doesn't reorganize your mailbox.** No archiving, labeling, or deleting — it reads and surfaces; your inbox stays yours.
- **No invented data.** An unclear deadline or owner is flagged, not guessed.
- **Meeting summaries need a source.** A transcript, notes, or a doc — the agent won't reconstruct a call it has no record of.
- **Not a CRM or outreach tool.** This assists you personally; for cold sales, pair it with an SDR agent.
- **Reactivity is polling-based.** New mail is picked up on your interval (default 30 min), not the instant it lands — instant VIP reaction is an optional upgrade (see INTEGRATIONS).
