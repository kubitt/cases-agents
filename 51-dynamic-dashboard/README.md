# Dynamic Dashboard

A live business dashboard that rebuilds itself every morning: it pulls your metrics from connected sources, computes the changes, renders an HTML dashboard plus a CSV snapshot, and sends you a short summary — no custom frontend, no manual number-gathering.

## Value & ROI
Assembling a daily metrics report by hand — opening spreadsheets, copying numbers, computing deltas, formatting it — costs about 30–45 minutes a day, roughly 12 hours a month; at $30–60/hr that is $360–720/mo of someone's time. A hosted BI/dashboard seat (Looker Studio Pro, Metabase Cloud, Databox and similar) runs $30–100+/mo, and building a custom dashboard costs weeks of developer time before the requirements change again. This agent does the whole pull → compute → render → deliver loop for $29/mo (ASCN Start, 10,000 credits) with ZERO external cost when it reads native sources. Honest payback vs $29: roughly 12–25x on the labor alone, more once it catches a metric breaching its limit before you would have noticed.

## What it does
1. Keeps a "Metrics Registry" you define — each metric with its source, how to read it, its unit, which direction is good, a warn threshold, and a target.
2. Every morning reads each metric's current value from its native source (a Google Sheets cell/range, or a public number via built-in web search) per skill dashboard-build.
3. Computes the change vs the previous reading (absolute + percent) and a status (on_target / watch / breach) with an in-container Python script.
4. Renders a self-contained "dashboard.html" (metric cards + inline mini-charts) and a "dashboard_snapshot.csv"; saves them to files and, if connected, to a Google Drive folder.
5. Appends every reading to a "Metrics History" table so trends compound over time; answers "how did X trend over 30 days?" on request per skill trend-lookup.
6. Sends a morning summary — top movers, any threshold breaches, on-target count, and links to the files — to Telegram or ASCN chat.

## Folder contents
- `workspace/` — copied into the ASCN agent workspace (IDENTITY, SOUL, ONBOARDING, CRON_PLAYBOOK, 3 skills, 2 knowledge files).
- `DEPLOY_PROMPT.md` — prompt for Claude Code that transfers everything to ASCN.
- `INTEGRATIONS.md` — which integrations are needed, why, and what they cost.

## Quick deploy
1. Open Claude Code in this folder.
2. Paste the contents of `DEPLOY_PROMPT.md`.
3. Send the agent "Hi, let's set up" — it runs its own onboarding (~10 min: your metrics, sources, refresh time, then it builds your first dashboard live).

## Required integrations
Native, zero external cost: Google Sheets (the "Metrics Registry" and "Metrics History"), Google Drive (stores the rendered dashboard, optional), Google Docs (written summary, optional), Telegram (the morning summary, recommended), built-in web search (public metrics), and Python scripts in the agent's own container (compute + render). Secrets: NONE for the native core. Optional paid data connectors are listed in INTEGRATIONS.md under Optional upgrades.

## Deliberate limitations
- It reads sources it can reach natively — Google Sheets and public web numbers. Live pulls from paid analytics/ad/market APIs are an Optional upgrade (key + budget + your approval), never wired in by default.
- It renders a static HTML file that it rebuilds each run — not an always-live web app. You open the latest file; it is refreshed on schedule, not streamed second-by-second.
- No browser automation: it will not log into a dashboard site and screen-scrape numbers. Give it a Sheets cell or a public URL instead.
- Computed statuses and deltas are only as good as the sources you register; it marks anything it cannot read as "no_data" rather than guessing.
