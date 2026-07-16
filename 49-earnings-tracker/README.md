# Earnings Tracker

Never miss an earnings report from a company you follow: a weekly look-ahead, then a plain-English, fact-only summary of every result — beat or miss, revenue, EPS, guidance, highlights. It tracks facts; it never tells you what to buy or sell.

## Value & ROI
Following earnings season by hand means watching calendars, remembering report dates, and reading each release across several sources — easily 15–20 minutes per company, times dozens through a busy week. Paid earnings-alert newsletters and calendar services run $10–150/mo and still leave you to read the reports. This agent watches the calendar for you and delivers a sourced summary the morning after each report. Total cost: $29/mo (ASCN Start, 10,000 credits), no external APIs required — the native core uses built-in web search plus a Google Sheet. Honest payback vs $29: roughly 3–10x versus the subscriptions it replaces, plus the hours of manual calendar-watching it removes. Optional paid market-data APIs (~$22–50/mo) can sharpen the numbers but are never required.

## What it does
1. Keeps your tracked companies in knowledge/WATCHLIST.md and their dates + results in the Google Sheet "Earnings Log".
2. Every Sunday 08:00 scans the upcoming week's earnings calendar by web search, filters to your watchlist, and delivers a preview: which of your companies report, on what date, before open or after close.
3. Logs each confirmed report date into "Earnings Log" (status scheduled) so nothing on your list is missed.
4. Each morning checks for reports that landed and delivers a fact-only summary: beat/miss vs consensus, revenue, EPS, guidance, key highlights — every figure with a source link.
5. Marks unconfirmed data honestly and, when sources disagree, shows both figures verbatim rather than smoothing them.
6. Carries a "not financial advice" note on every summary and refuses buy/sell/hold opinions.

## Folder contents
- `workspace/` — copied into the ASCN agent workspace (IDENTITY, SOUL, ONBOARDING, CRON_PLAYBOOK, 3 skills, 2 knowledge files).
- `DEPLOY_PROMPT.md` — prompt for Claude Code that transfers everything to ASCN.
- `INTEGRATIONS.md` — which integrations are needed, why, and what they cost.

## Quick deploy
1. Open Claude Code in this folder.
2. Paste the contents of `DEPLOY_PROMPT.md`.
3. Send the agent "Hi, let's set up" — it runs its own onboarding (~9 min: your companies, the summary format, the ledger, then a live preview and one real summary).

## Required integrations
All native, zero external cost. Google Sheets (native OAuth — the "Earnings Log") and Telegram (native — the preview and summaries) are recommended; built-in web search pulls the calendar and results. Notion is an optional native alternative to Sheets. Secrets: NONE — no API keys required.

## Deliberate limitations
- **It tracks and summarizes facts — it is not a financial advisor.** No buy/sell/hold advice, no price targets, no opinions on whether a stock is a good investment, even if asked.
- **Numbers are only as good as public sources.** It reads press releases, IR pages, and established financial media via web search; unconfirmed figures are marked "not reported", never guessed, and no browser automation or paid terminal is used in the native core.
- **Timeliness is a morning cadence.** The default is one 08:00 check per day; same-day after-close summaries need an optional evening run (more credits).
- **Sharper data costs extra.** Confirmed consensus estimates and precise actuals can come from a paid market-data API (~$22–50/mo, Optional upgrades) — deliberately kept out of the core so the agent runs at $29/mo with no keys.
