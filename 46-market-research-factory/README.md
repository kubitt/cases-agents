# Market Research Factory

Mines real user pain from public forums and reviews, ranks it into scored product opportunities, and turns the best one into a build-ready MVP brief — no manual browsing.

## Value & ROI
An agency pain-point study runs $2,000–10,000; a freelance researcher is $30–80/hr and a proper study is 15–30 hours of manual forum and review reading. Social-listening tools (Brandwatch, Sprout) add $100–1,000/mo. This agent runs the whole discovery-to-brief pipeline on a schedule for $29/mo (ASCN Start, 10,000 credits) with ZERO external cost — native web search, Google Sheets, Google Docs, and its own Python scripts, no API keys. Honest payback vs $29: roughly 30–100x versus a research retainer, and far more the first time it stops you building a product nobody asked for. An optional scraping API for X and scale adds ~$30–49/mo (approval + budget required).

## What it does
1. Mines a topic across public sources (Reddit, Hacker News, review sites, forums) with built-in web search, logging real pain quotes with source URLs into Google Sheets "Opportunity Ledger".
2. Clusters raw signals into pain clusters, counts mentions, and dedupes against what is already logged.
3. Scores each opportunity with a Python script (opportunity_score = Reach x Intensity x Gap) and re-ranks the ledger so the highest-leverage opportunity is always on top.
4. Turns a chosen opportunity into a build-ready MVP brief in Google Docs "Opportunity Brief": problem, target user, evidence, MVP scope, existing solutions and gap, risks, first validation step.
5. Every Monday 08:00 sends a digest: new and changed opportunities, the top 3 by score, and what to research or build next.

## Folder contents
- `workspace/` — copied into the ASCN agent workspace (IDENTITY, SOUL, ONBOARDING, CRON_PLAYBOOK, skills, knowledge).
- `DEPLOY_PROMPT.md` — prompt for Claude Code that transfers everything to ASCN.
- `INTEGRATIONS.md` — which integrations are needed, why, and what they cost.

## Quick deploy
1. Open Claude Code in this folder.
2. Paste the contents of `DEPLOY_PROMPT.md`.
3. Send the agent "Hi, let's set up" — it runs its own onboarding (topics, sources, scoring, then a live research run on your first topic).

## Required integrations
Native: Google Sheets (required), Google Docs (recommended), built-in web search (included), Python scripts (included). External: none. Channel: Telegram (recommended).

## Deliberate limitations
- It researches, clusters, scores, and writes briefs — it does NOT build or ship the app. The brief is build-ready; hand it to a developer or a separate build agent.
- Native research reads public web pages and built-in search only — no X/Twitter firehose, no login-gated communities, no bulk scraping. A scraping API (Apify, ~$30–49/mo) adds X coverage and scale — needs approval + budget.
- Opportunity scores are hypotheses from observed mentions, not proven demand — validate with real customers before building. Samples under 5 mentions are flagged "insufficient signal".
- No fabricated pain, no astroturfing, no fake reviews; quotes are real and attributed, never invented.
