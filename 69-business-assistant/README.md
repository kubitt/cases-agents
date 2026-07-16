# Small-Business Assistant

Your right hand for the weekly numbers, the drafts, and the market: one assistant that reviews the business every week, writes the documents, and scans the competition — you just review and approve.

## Value & ROI
Replaces the reporting-and-drafting slice of a part-time marketing coordinator or virtual assistant ($400–1,500/mo), or an agency reporting retainer ($500–2,000/mo). Manual work it removes: ~2–3 h to build the weekly review, ~1–2 h per document draft, ~3–4 h per competitor scan — about 10–15 h/mo. At $25–50/h that is $250–750/mo of time back.
Total cost: $29/mo for the core (native Google apps + web search, no external APIs). A paid data API is optional and only added later on your budget (~$50–120/mo, see INTEGRATIONS.md). Payback vs $29: 9–25x.

## What it does
1. Keeps a simple metrics log in Google Sheets "Business Metrics" (columns: week_start, metric, value, target, channel, source, notes) — you type numbers in or paste them in chat.
2. Every Monday writes a "Weekly Business Review — <week_start>" Google Doc: did we hit targets, what is working, what is not, and next actions each with an owner and a due date. Insight first, numbers as proof.
3. Compares every metric three ways — vs target, vs the previous period, vs an industry benchmark it looks up on the web with a source link.
4. Drafts business documents on request — ad and social copy, marketing emails, one-pagers — in your brand voice; saved as a Google Doc, and for emails a Gmail draft you approve before anything is sent.
5. Plans content in Google Sheets "Content Plan" (columns: publish_date, channel, title, status, doc_link, notes) and adds publish dates to Google Calendar.
6. Runs a market scan on request or monthly: a 3-tier competitor read (direct / indirect / secondary) from public web pages, a short strengths-and-gaps view, and a "Market Scan — <topic>" Google Doc with sources.

## Folder contents
- `workspace/` — copied into the ASCN agent workspace (IDENTITY, SOUL, ONBOARDING, AUTOMATIONS, skills, knowledge).
- `DEPLOY_PROMPT.md` — prompt for Claude Code that transfers everything to ASCN.
- `INTEGRATIONS.md` — which integrations are needed, why, and what they cost.

## Quick deploy
1. Open Claude Code in this folder.
2. Paste the contents of `DEPLOY_PROMPT.md`.
3. Send the agent "Hi, let's set up" — it runs its own onboarding (business profile, integrations, first weekly review on your real numbers).

## Required integrations
Native: Google Sheets (required), Google Docs (required), Gmail (required for email drafts), Google Calendar (recommended). Built-in: web search and web-page reading. External: none for the core — optional paid data APIs are listed in INTEGRATIONS.md. Channel: Telegram (recommended).

## Deliberate limitations
- No auto-publishing to Facebook / Instagram / TikTok / Google Ads — those are closed to direct posting, so the agent drafts and you publish. Auto-pull of ad numbers needs a paid connector (optional upgrade), otherwise you enter figures in the sheet.
- No browser automation and no paid SEO tools (SimilarWeb / Ahrefs / Semrush) in the core — the market scan reads public pages via web search only; a paid data API can be added later with your budget approval.
- Not an accountant or a lawyer: it flags when a number or a contract needs a professional and never gives personalized financial advice.
