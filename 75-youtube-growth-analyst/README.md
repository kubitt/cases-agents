# YouTube Growth Analyst

Tells you, in plain words, why your YouTube channel is or isn't growing — and exactly what to fix — for the price of a coffee subscription instead of a $200–2000 consultant.

## Value & ROI
Replaces a YouTube growth consultant ($200–2000 per audit, or $500–2000/mo coaching) and the manual work of reading your own analytics, plus $10–50/mo analytics tools. This runs on ASCN Start at **$29/mo**; the public/competitor data comes from the **free** YouTube Data API v3 (10,000 free units/day, $0/mo). Total cost of ownership: $29/mo for the core. Payback vs $29 is roughly **15–70x** — a single audit or one month of coaching costs many multiples of that, and one RPM or retention improvement on an active channel clears the subscription many times over. The monthly re-audit keeps it earning. Optional live keyword data via DataForSEO adds ~$5–30/mo only if you turn it on.

## What it does
1. Audits your channel (skill channel-audit): pulls public stats via the free YouTube Data API — or uses numbers you paste from YouTube Studio — computes key ratios (views-per-subscriber, recent-vs-baseline view velocity), compares each to niche benchmarks, and writes findings to the Google Sheet "Channel Audit Log".
2. Labels every number honestly: verified (source = api or studio-paste) or estimated (source = estimate); it never blends the two into one figure.
3. Benchmarks 3–5 competitor channels (skill competitor-benchmark): pulls their public stats and top videos, compares upload cadence, average views, view-to-subscriber ratio, and recurring title/thumbnail/format patterns in the Google Sheet "Competitor Benchmark".
4. Builds a prioritized "Growth Roadmap" Google Doc (skill growth-roadmap) across three levers — retention, SEO/discovery, monetization — with each recommendation tagged [fact] or [hypothesis].
5. Degrades gracefully: with no API key it runs in manual-paste mode and clearly says what is measured vs estimated.
6. Re-audits every month and sends "what changed since last month + top 3 actions"; a light weekly competitor pulse flags notable moves.

## Folder contents
- `workspace/` — copied into the ASCN agent workspace (IDENTITY, SOUL, ONBOARDING, AUTOMATIONS, skills, knowledge).
- `DEPLOY_PROMPT.md` — prompt for Claude Code that transfers everything to ASCN.
- `INTEGRATIONS.md` — which integrations are needed, why, and what they cost.

## Quick deploy
1. Open Claude Code in this folder.
2. Paste the contents of `DEPLOY_PROMPT.md`.
3. Send the agent "Hi, let's set up" — it runs its own onboarding (channel, competitors, Sheets, Docs, the free API key or manual mode, and a first audit on your real channel).

## Required integrations
Native: Google Sheets (required), Google Docs (required), built-in web search + page reading. External: free YouTube Data API v3 key (optional, $0/mo — enables public/competitor stats; without it the agent runs in manual-paste mode). Channel: Telegram (recommended).

## Deliberate limitations
- It does NOT pull your private YouTube Analytics automatically — YouTube's analytics access needs a self-hosted OAuth app that ASCN does not provide, so you paste watch-time, audience-retention, traffic sources, and impressions click-through rate from YouTube Studio (about 2 minutes) and the agent works in manual mode meanwhile.
- Public and competitor stats need a free YouTube Data API key (a ~2-minute Google Cloud setup); skip it and the agent still audits from your pasted numbers.
- It does not edit video or make thumbnails, and it is advisory — it diagnoses and plans, you execute. It never uploads, posts, or comments on YouTube.
- Benchmarks are reference ranges, not guarantees. Live keyword search volume and difficulty need the optional paid DataForSEO upgrade (~$5–30/mo) — not wired into the shipped build.
