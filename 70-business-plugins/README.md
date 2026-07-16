# Business Planning & Reporting Officer

Drafts your business plans and strategy one-pagers, keeps one live KPI dashboard, and delivers a weekly executive brief plus daily meeting prep — the rigor of a chief of staff, without the headcount.

## Value & ROI
A fractional chief of staff or strategy/ops analyst costs $2,000–5,000/mo; even doing it yourself, assembling a weekly KPI or board update and prepping for each meeting eats 4–6 hours a week. This agent owns that work: it drafts plans into Google Docs, keeps a single KPI Dashboard with honest red/amber/green status, and hands you a headline-first brief before every week and every meeting. Total cost: $29/mo (ASCN Start, 10,000 credits) with ZERO external costs — all-native Google apps plus built-in web search, no API keys. Honest payback vs $29: roughly 30–80x versus the hours saved, far more against a consultant — and it never lets a metric read "on track" on a number nobody sourced.

## What it does
1. Drafts a business plan, strategy one-pager, or initiative brief into a Google Doc "Plan — {name}": context, the ONE primary metric with its target, initiatives, risks, and timeline — market facts cited with a source link.
2. Keeps one Google Sheets "KPI Dashboard" (columns: metric, owner, target, current, prior, unit, status, trend, period, source, note); computes red/amber/green status and up/flat/down trend, and flags every off-track metric with its source row.
3. Every weekday morning, preps you for each meeting from Calendar: who is in the room, the goal, the 2–3 numbers that matter, the decision likely needed.
4. Every Monday, delivers a weekly executive brief (RAG rollup, plan progress, up to 3 decisions needed); on the 1st, a deeper monthly business review with refreshed, cited benchmark context.

## Folder contents
- `workspace/` — copied into the ASCN agent workspace (IDENTITY, SOUL, ONBOARDING, CRON_PLAYBOOK, 3 skills, 2 knowledge files).
- `DEPLOY_PROMPT.md` — prompt for Claude Code that transfers everything to ASCN.
- `INTEGRATIONS.md` — which integrations are needed, why, and what they cost.

## Quick deploy
1. Open Claude Code in this folder.
2. Paste the contents of `DEPLOY_PROMPT.md`.
3. Send the agent "Hi, let's set up" — it runs its own onboarding (~10 min: business context and KPIs, Google apps, reporting style, then a live first brief on your real numbers).

## Required integrations
Native, zero external cost: Google Sheets (the "KPI Dashboard"), Google Docs (plans and briefs), Google Calendar (meeting prep, read-only), and built-in web search for benchmark context. Channel: Telegram recommended for briefs and approvals. Secrets: NONE — no API keys or tokens are ever required.

## Deliberate limitations
- It plans and reports — it does not run the business. It never sends, publishes, or shares a file without your approval; drafts stay drafts.
- It is not a financial advisor and executes no payments: factual figures and summaries only, no investment or funding advice.
- It reports only what you give it. A missing number is marked "data not provided for this period", never guessed; thin data is flagged "insufficient data".
- No automatic KPI ingestion from your BI/warehouse in the native build — you paste or type numbers. Optional upgrades (not wired in, need approval + budget): a market-data API (e.g., Financial Modeling Prep / Alpha Vantage) for richer public benchmarks, ~$20–50/mo, factual figures only; auto-KPI pull from a warehouse via a custom MCP server, cost varies.
