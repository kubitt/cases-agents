# LinkedIn Page Manager

Run a consistent, on-brand company LinkedIn Page without a full-time SMM or a monthly scheduler subscription — you approve, it does the rest.

## Value & ROI
A LinkedIn scheduling tool runs $15–99/mo, and running the Page by hand costs about 3–5 hours a week of a founder's or marketer's time. This agent is $29/mo on ASCN, and every API it uses is an official, free API — no paid third party. Total cost: $29/mo. Payback vs $29: roughly 10–40x — it replaces the scheduler subscription and most of the weekly page-management time.

## What it does
1. Keeps a "LinkedIn Calendar" in Google Sheets (columns: date, scheduled_time, pillar, working_title, status, doc_link, post_urn, impressions, engagement_rate, notes).
2. Plans the coming week's slots by content pillar so the Page posts on a deliberate cadence.
3. Drafts page-optimized posts — a strong first line, a scannable body, one clear call to action — with a sourced angle from web search, into the "Post Drafts" Google Doc.
4. Keeps an approval queue and hands you an approve-ready package to publish by hand. This is the default and needs no token.
5. Connected mode (optional): with your own LinkedIn app token, it publishes or schedules an approved post to the Page and pulls page analytics — only after your explicit yes on each post.
6. Optional X and Threads fan-out: posts a text-fit version of the same approved post.
7. Weekly analytics summary (connected mode): impressions, engagement, follower demographics, and 3 concrete recommendations.

## Folder contents
- `workspace/` — copied into the ASCN agent workspace (IDENTITY, SOUL, ONBOARDING, AUTOMATIONS, skills, knowledge).
- `DEPLOY_PROMPT.md` — prompt for Claude Code that transfers everything to ASCN.
- `INTEGRATIONS.md` — which integrations are needed, why, and what they cost.

## Quick deploy
1. Open Claude Code in this folder.
2. Paste the contents of `DEPLOY_PROMPT.md`.
3. Send the agent "Hi, let's set up" — it runs its own onboarding (Page profile, pillars, integrations, a first real draft).

## Required integrations
Native: Google Sheets (required), Google Docs (required), web search (built in). External: none required — LinkedIn Community Management API, X API, and Threads API are optional, official, and free ($0). Channel: Telegram (recommended).

## Deliberate limitations
- Default mode does not auto-publish — you post by hand; this needs no setup and works for everyone.
- Auto-publish and analytics require your own LinkedIn developer app and access token (a one-time approval that can take days) and cover company Pages only, not personal profiles.
- It never publishes without your per-post approval, and never presents a draft as posted.
- It does not design images or video; X/Threads fan-out is text-only and optional.
