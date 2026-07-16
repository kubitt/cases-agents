# SEO Optimizer

Your always-on SEO analyst: finds the keywords worth chasing, audits your pages, writes writer-ready content briefs, and tracks your rankings and traffic from Google Search Console.

## Value & ROI
Replaces a freelance SEO audit ($300–1,500 each), an SEO tool subscription (Ahrefs/Semrush ~$129–140/mo), and part of an agency retainer ($500–3,000/mo). A single content brief from an agency runs $150–500. Total cost: $29/mo, no external APIs required (the native core uses your Google Search Console data plus web search). Payback vs $29: 10–100x — one recovered page or one ranking win pays for years.

## What it does
1. Keeps an "SEO Tracker" spreadsheet with three tabs: Keyword Map, Rank Tracker, Audit Log.
2. Keyword research: turns seed topics + your real Search Console queries into a clustered keyword map with search intent, a difficulty estimate, and the page each keyword should target.
3. On-page audit: reads any URL and returns a prioritized fix list (Critical / High / Medium / Low) covering title, meta, headings, content depth, internal links, and structured data.
4. Content briefs: for a target keyword, produces a writer-ready Google Doc — intent, top-result analysis, heading structure, subtopics, word-count target, and title/meta suggestions.
5. Rank & traffic tracking: pulls Search Console (clicks, impressions, CTR, average position), compares to the prior period, and flags movers and "striking-distance" keywords (positions 8–20 — one push from page one).
6. Weekly report every Monday and an optional monthly deep scan that re-audits your priority pages and finds content worth refreshing.

## Folder contents
- `workspace/` — copied into the ASCN agent workspace (IDENTITY, SOUL, ONBOARDING, AUTOMATIONS, skills, knowledge).
- `DEPLOY_PROMPT.md` — prompt for Claude Code that transfers everything to ASCN.
- `INTEGRATIONS.md` — which integrations are needed, why, and what they cost.

## Quick deploy
1. Open Claude Code in this folder.
2. Paste the contents of `DEPLOY_PROMPT.md`.
3. Send the agent "Hi, let's set up" — it runs its own onboarding (site profile, integrations, SEO standards, a test run on your real data).

## Required integrations
Native: Google Search Console (required), Google Sheets (required), Google Docs (recommended). Built-in: web search and web page reading. External: none. Channel: Telegram (recommended).

## Deliberate limitations
- Keyword volume and difficulty are estimated from live search results, not a paid index — good for prioritizing, not exact. Precise numbers and backlink data need a paid upgrade (Ahrefs / Semrush / DataForSEO — see INTEGRATIONS.md, ~$25–140/mo), approved separately.
- The agent recommends changes; it does not publish to your website or edit live pages — you or your team apply the fixes. No browser automation (platform limit).
- Core Web Vitals (page-speed signals) are noted from public data only; deep field data needs the free Google PageSpeed API added later. White-hat only: no link buying, cloaking, or auto-generated thin pages.
