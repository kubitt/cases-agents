# Warm Lead Nurture

Watches leads who said "I'll think about it", and when they go quiet writes a short, personal follow-up that gets a reply — you approve before it sends, or switch on auto-send.

## Value & ROI
Most deals are lost not to a "no" but to silence — a warm lead says "I'll think about it" and no one follows up. Reps forget; CRM sequences feel robotic. Hiring an SDR to chase warm leads costs $800–2,000/mo. The agent follows up every day, personally, for the price of the subscription. Total cost: $29/mo (ASCN Start), no external APIs — Sheets, Telegram, and Gmail are native and free. Payback vs $29: one recovered warm deal covers years, and the agent works your whole "thinking" pipeline daily.

## What it does
1. Reads your warm leads from Google Sheets (name, contact, channel, status, interest, last contact, touches).
2. Each day finds leads due for a follow-up: status "thinking" / "call later" and 2+ days of silence.
3. Chooses the follow-up type (value / real offer / case / simple check-in) from the lead's last interest.
4. Writes a short personal message — the lead's name, their specific interest, no "just following up", no pressure.
5. Sends you the batch to approve ("send all / edit #N"), or auto-sends if you enabled it, on Telegram or by email.
6. Updates the sheet, and after 3 follow-ups with no reply marks the lead "cold" and stops.
7. Stops the moment a lead replies and hands the thread to you.

## Folder contents
- `workspace/` — copied into the ASCN agent workspace (IDENTITY, SOUL, ONBOARDING, AUTOMATIONS, 3 skills, 2 knowledge files).
- `DEPLOY_PROMPT.md` — prompt for Claude Code that transfers everything to ASCN.
- `INTEGRATIONS.md` — integrations and the daily cron.

## Quick deploy
1. Open Claude Code in this folder.
2. Paste the contents of `DEPLOY_PROMPT.md`.
3. Send the agent "Hi, let's set up" — it runs its own onboarding (~8 min: what you sell, your lead sheet, follow-up rules, channels, a real test on your leads).

## Required integrations
Native: Google Sheets (required — lead base), Telegram (recommended — approval batch + follow-ups), Gmail (optional — email follow-ups). External: none. Secrets: none.

## Deliberate limitations
- **Warm leads only, not cold outreach.** The agent re-engages leads already in your pipeline; finding and cold-emailing new prospects is a different agent.
- **Approval-first by default.** Nothing goes to a lead until you approve it; auto-send is a switch you deliberately flip, capped at 3 touches per lead.
- **Not a live sales chat.** It re-opens the conversation; once a lead replies, it hands the thread to you (a full inbound-sales dialog is a separate agent).
- **Email volume is capped for deliverability** (Gmail ~30–50/day). Large bases should follow up via Telegram or a dedicated ESP.
- **It won't invent urgency.** No "last chance" unless it's real — honest follow-ups protect your reputation and convert better.
