# Idea to Reality

Turns a raw idea into a validated, structured concept: it captures the idea, checks whether it already exists on the open web, scores how crowded the space is, and writes a decision-ready concept brief with next steps.

## Value & ROI
A product strategist or market-research analyst who scopes and validates a new idea runs $1,500–4,000 for a single brief, and takes days. The quiet cost is worse: weeks of building something that ten teams already shipped, or killing an idea that was actually open. This agent structures every idea the same disciplined way, searches the live web for real competitors (with source links), scores a 0–100 Reality Signal, and hands you a concept brief you can act on the same hour. Total cost: $29/mo (ASCN Start, 10,000 credits) with ZERO external costs — no API keys, no paid tools; validation runs on built-in web search and native Google Docs/Sheets. Honest payback vs $29: roughly 50–130x versus one analyst brief, and far more the first time it stops you building a done-to-death idea.

## What it does
1. Captures a raw idea and structures it into problem, target user, the ONE core value, and category via skill `idea-intake`; logs it to the Google Sheet "Idea Ledger" with status=captured.
2. Runs a reality check on the open web via skill `reality-check`: finds existing and similar products, judges how crowded and how fast-moving the space is, and computes a 0–100 Reality Signal with a trend (accelerating / stable / declining) and a verdict (build / differentiate / niche / reconsider) — every competitor carries a source link.
3. Assembles a structured concept brief in Google Docs via skill `concept-brief`: problem, target user, value proposition, competitor landscape, differentiation angle, top risks and assumptions, and a prioritized next-steps checklist; writes the doc link back to the ledger.
4. Every Monday 08:00 sends a short digest: parked ideas due for a re-check (markets move) plus your most promising open ideas by Reality Signal.

## Folder contents
- `workspace/` — copied into the ASCN agent workspace (IDENTITY, SOUL, ONBOARDING, AUTOMATIONS, 3 skills, 2 knowledge files).
- `DEPLOY_PROMPT.md` — prompt for Claude Code that transfers everything to ASCN.
- `INTEGRATIONS.md` — which integrations are needed, why, and what they cost.

## Quick deploy
1. Open Claude Code in this folder.
2. Paste the contents of `DEPLOY_PROMPT.md`.
3. Send the agent "Hi, let's set up" — it runs its own onboarding (~8 min: your building context, validation method, the ledger and brief folder, then it validates your first real idea live).

## Required integrations
All native, zero external cost. Google Sheets (native OAuth — the "Idea Ledger"), Google Docs (native OAuth — the concept briefs), and built-in web search (competitor and market research, no key) are the core; Telegram (native) is recommended for the weekly digest; Google Drive (native) optionally keeps briefs in one folder. Secrets: NONE — no API keys or tokens are ever required.

## Deliberate limitations
- **The Reality Signal is an evidence-based estimate, not a metric.** It is read from public web results (competitors, launches, discussion), so it is only as good as what is findable — it is always labeled an estimate, never a guarantee.
- **It validates and structures — it does not decide or build.** It gives you evidence and a verdict; the build/pivot/kill call and the building itself stay with you.
- **Web research only.** It searches and reads public pages; it does not log into sites, scrape behind paywalls, or pull exact private metrics (funding, traffic). Those need an optional paid data source.
- **Your ideas stay confidential.** They live only in your Google Sheet and Docs, never in agent memory and never reused as examples for anyone else.
