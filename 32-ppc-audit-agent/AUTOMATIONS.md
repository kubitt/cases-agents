# Automations: PPC Audit Agent

## Cron tasks

### 1. Weekly full audit (night shift)
- Cron: `0 3 * * 1` (Monday 03:00; runs at night, delivers after 08:00).
- Task prompt: "Run skill ads-audit: pull the last 7 days of data from all connected ad platforms (Google Ads, Meta Ads, LinkedIn Ads, TikTok Ads). Evaluate all checks per knowledge/ADS_CHECKLISTS.md. Calculate the Ads Health Score per knowledge/ADS_BENCHMARKS.md scoring methodology. Add results to Google Sheets "PPC Audit History". Compare scores to last week's audit row — note improvements and regressions with arrows. Send to the user's notification channel: Ads Health Score, grade, per-platform scores with trend vs last week, top 3 new issues, 3 Quick Wins. If any platform integration is broken — send a critical alert immediately regardless of notification window."
- Channel: Telegram (or ASCN chat if Telegram not connected).
- Credits note: runs once per week; moderate credit usage (~1 full audit).

## Optional automations (offered at onboarding, not imposed)

### 2. Monthly deep-dive rotation
- Cron: `0 3 1 * *` (1st of month, 03:00; night shift).
- Task prompt: "Run skill ads-platform-deep-dive for the platform with the LOWEST score in the most recent "PPC Audit History" row. Full deep dive with all checks, category breakdown, and action plan. Store in Sheets. Deliver the report with: platform name, score, bottom 3 categories, and the top 5 actionable recommendations."
- Channel: Telegram.
- Credits note: one deep dive per month; offered to users who want automated deep analysis.

## No platform triggers
Reactivity is polling-based. The agent checks ad platform data during scheduled audit runs. Real-time monitoring is not required — ad platform data is inherently delayed (reporting lag of 3-24 hours depending on platform).

Notifications respect the user's window (default 08:00–23:00); night audit runs deliver results in the morning. Critical alerts (broken integration access, compliance violation detected) may bypass the window.
