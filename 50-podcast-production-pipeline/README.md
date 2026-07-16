# Podcast Production Pipeline

Hand off a topic and get back a full production package — research, outline and script, show notes, titles, descriptions, and promo drafts — so you spend your time recording, not producing.

## Value & ROI
Podcast production is the hidden time sink: research, outlines, show notes, and promo eat 4–6 hours per episode — roughly 70% of the total effort. Freelance show-notes writers charge $25–75 per episode, social promo packages $50–150 per episode, and a part-time producer/VA runs $400–1200/mo. This agent does the whole non-recording package for 4 episodes/mo. Total cost: $29/mo, no external APIs for the core. Payback vs $29: ~10–30x — one month replaces a single freelance promo package.

## What it does
1. Keeps an "Episode Pipeline" tracker in Google Sheets: one row per episode, status from planned to published.
2. Episode prep: researches the guest and topic from the open web and writes an outline + intro/segment/closing script into a Google Doc "Episode NN — Prep".
3. Show notes: turns a transcript you provide into timestamped notes plus a highlights list in "Episode NN — Show Notes".
4. Titles & description: drafts SEO-friendly title options and a description (Spotify / Apple / YouTube) into "Episode NN — Publish Kit".
5. Promo kit: drafts posts for X, LinkedIn, and an Instagram caption (drafts only — you post) into the same Publish Kit doc.
6. Publishing checklist: copies your reusable checklist into each Publish Kit so nothing is missed before release.
7. Weekly nudges: Monday production planning digest and Friday topic/competitor watch, delivered to Telegram.

## Folder contents
- `workspace/` — copied into the ASCN agent workspace (IDENTITY, SOUL, ONBOARDING, AUTOMATIONS, skills, knowledge).
- `DEPLOY_PROMPT.md` — prompt for Claude Code that transfers everything to ASCN.
- `INTEGRATIONS.md` — which integrations are needed, why, and what they cost.

## Quick deploy
1. Open Claude Code in this folder.
2. Paste the contents of `DEPLOY_PROMPT.md`.
3. Send the agent "Hi, let's set up" — it runs its own onboarding (show profile, voice, integrations, test run on one real episode).

## Required integrations
Native: Google Sheets (required), Google Docs (required), web search/reading (built-in). External: none. Channel: Telegram (recommended). Google Drive optional for episode folders.

## Deliberate limitations
- No audio transcription or voice generation in the core — you paste or link a transcript; automatic transcription and text-to-speech are Optional upgrades (~$6–20/mo transcription; ~$5–22/mo voice).
- No uploading to podcast hosts (Spotify/Apple/YouTube) — the agent prepares publish-ready assets; auto-publishing needs a host API and is an Optional upgrade (~$19+/mo host plan).
- No posting to social platforms — Instagram and similar closed APIs are out of scope; the agent drafts promo, you post (keeps you in control and avoids platform bans).
- Research uses the open web only — no browser automation or paywalled scraping; unverifiable facts are marked, never invented.
