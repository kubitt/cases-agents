# PPC Audit Agent / Аудитор рекламных кабинетов (опубликовано в marketplace)

> 📢 Опубликован в ASCN Marketplace: [RU](https://ascn.ai/ru/templates/ai-ppc-audit-agent-google-meta-ads) · [EN](https://ascn.ai/en/templates/ai-ppc-audit-agent-google-meta-ads)

Your personal PPC analyst: audits ad accounts across Google, Meta, LinkedIn, and TikTok with 200+ automated checks, scores them 0-100, finds wasted spend, and delivers a prioritized action plan — weekly, on demand, or both.

## Value & ROI
A manual PPC audit by a senior specialist takes 4-6 hours at $50-100/hr = $200-600 per audit per platform. Agencies charge $2,000-10,000+ for a comprehensive multi-platform review. Commercial audit tools cost $99-799/mo.

This agent runs equivalent analysis in 20-30 minutes, across all your platforms, every week automatically. Total cost: **$29/mo** (ASCN subscription). No external APIs, no additional fees. Payback vs $29: **7-20x per single audit** (one audit replaces $200-600 of analyst time); weekly automation multiplies that to **30-80x/mo**.

## What it does
1. **Full multi-platform audit** — evaluates 200+ checks across Google Ads (80), Meta Ads (50), LinkedIn Ads (27), and TikTok Ads (28). Produces an Ads Health Score (0-100, grade A-F) with per-platform breakdowns.
2. **Wasted spend detection** — flags irrelevant search terms, audience overlap, budget misallocation, and broken tracking with dollar estimates where data allows.
3. **Platform deep dives** — on-demand exhaustive analysis of any single platform: every check, category breakdown, platform-specific insights (Quality Score distribution, Andromeda creative diversity, hook rates, ABM match rates).
4. **Weekly automated monitoring** — runs a full audit Monday night, delivers a trend report by morning: score changes vs last week, new issues, resolved issues, Quick Wins.
5. **Strategic planning** — budget allocation recommendations by industry, bidding strategy decision trees, scaling roadmaps, financial projections (conservative/moderate/aggressive scenarios).
6. **A/B test design** — hypothesis, sample size calculation, duration estimate, success criteria, platform-specific setup instructions.
7. **PPC math calculator** — CPA, ROAS, break-even, LTV:CAC, budget forecasting — instant answers with clear formulas and context.
8. **Audit history tracking** — every audit stored in Google Sheets with scores, trends, and action items for longitudinal analysis.

## Folder contents
- `workspace/` — copied into the ASCN agent workspace (IDENTITY, SOUL, ONBOARDING, 4 skills, 2 knowledge files).
- `DEPLOY_PROMPT.md` — prompt for Claude Code that transfers everything to ASCN.
- `INTEGRATIONS.md` — integration reference. Cron task texts live in workspace/AUTOMATIONS.md.

## Quick deploy
1. Open Claude Code in this folder.
2. Paste the contents of `DEPLOY_PROMPT.md`.
3. Send the agent "Hi, let's set up" — it runs its own onboarding (~12 minutes: connect ad accounts, set up tracking sheet, configure benchmarks, run first audit on real data).

## Required integrations
Native OAuth: Google Ads, Meta Ads, LinkedIn Ads, TikTok Ads (connect whichever platforms you use), Google Sheets (required for audit history). External APIs: **none**. Channel: Telegram (recommended for weekly reports).

## Deliberate limitations
- **Audit only, no execution.** The agent diagnoses and recommends — it never changes bids, budgets, or campaign settings in your ad accounts. This is by design: optimization changes need human judgment and are hard to reverse.
- **No creative generation.** The agent assesses creative quality and recommends specs, but does not generate images or video. A separate creative agent is the cleaner architecture.
- **No Microsoft/Apple/Amazon Ads via OAuth** — these platforms lack native ASCN connectors. The agent can analyze CSV exports or pasted data from these platforms, but not pull data automatically. Add via custom MCP when connectors become available.
- **Sequential, not parallel analysis.** The original Claude Ads project runs 6 audit agents in parallel. This ASCN agent runs checks sequentially — same depth, same results, takes 20-30 minutes instead of 10-15. For a weekly scheduled audit this is irrelevant.
- **Benchmarks are cross-industry medians.** The agent calibrates to the user's industry during onboarding, but benchmarks are not real-time market data — they are reference ranges that get refined through the user's own audit history over time.
- **Ad platform API reporting lag.** Google/Meta/LinkedIn/TikTok APIs report data with 3-24 hour delays. The agent cannot provide real-time monitoring — weekly audits and on-demand checks are the operating model.
