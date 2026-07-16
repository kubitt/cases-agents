# X Account Analyst

Turns your X (Twitter) posting history into a plain-language weekly review — which hooks, topics, and formats actually earn engagement, and what to post more of.

## Value & ROI
Qualitative X analytics-chat tools run $10–50/mo, and a freelance social analyst's monthly content review is $300–1500. Doing it yourself is 2–4 hours a week squinting at your own posts. This agent runs on ASCN Start at **$29/mo with no external APIs required for the core** — it reads your own X analytics CSV export and public pages. If it saves ~2 hours/week at $40/hr (~$320/mo) plus a $10–50/mo tool, payback vs $29 is roughly 10–15x. It is honest by design: it separates verified numbers from estimates and never sells you a pattern the data can't support.

## What it does
1. Keeps a Google Sheet "X Post Log" (post_date, post_url, format, topic, hook_type, text_excerpt, likes, reposts, replies, impressions, engagement_rate, verified, notes).
2. Classifies every post by format (single / thread / image / video / poll / quote), topic (your content pillars), and hook_type (question / bold-claim / story / list / how-to / contrarian / news).
3. Computes engagement_rate from your own analytics export (verified) or logs raw public counts marked unverified — never blends the two.
4. Runs a full account-audit in the first session: best and worst formats, strongest pillars, honest caveats — the "aha" a paid tool charges for.
5. Delivers a weekly content review every Monday morning: top 3 patterns, 2 warnings, 3 things to test — each line tagged [fact] or [hypothesis].
6. Scans for new posts on a schedule (weekly by default) and appends them to the log, so the review is always current.
7. Benchmarks against public competitor accounts you name (public aggregate facts only).
8. Refuses fake-engagement, follower-buying, and astroturfing tactics, and never posts to X — it advises, you publish.

## Folder contents
- `workspace/` — copied into the ASCN agent workspace (IDENTITY, SOUL, ONBOARDING, CRON_PLAYBOOK, skills, knowledge).
- `DEPLOY_PROMPT.md` — prompt for Claude Code that transfers everything to ASCN.
- `INTEGRATIONS.md` — which integrations are needed, why, and what they cost.

## Quick deploy
1. Open Claude Code in this folder.
2. Paste the contents of `DEPLOY_PROMPT.md`.
3. Send the agent "Hi, let's set up" — it runs its own onboarding (account, pillars, Sheets, scoring, and a first audit on your real posts).

## Required integrations
Native: Google Sheets (required), built-in web search + web page reading (public post/context reading). External: none for the core. Channel: Telegram (recommended). Optional: Google Docs for long audit reports.

## Deliberate limitations
- No automatic bulk pull of your whole X history: reading X at scale needs a paid API, so the core relies on your own analytics CSV export plus publicly visible pages. An X data API can be added later as an optional upgrade (see INTEGRATIONS.md).
- No login-walled or private-data scraping and no browser automation (platform limit + X Terms of Service) — the agent reads only your own account and public pages.
- It never posts, replies, or schedules content on X — analysis and advice only; publishing stays your decision.
- Public-page metrics are limited and marked unverified; reliable engagement rates come from your analytics export.
