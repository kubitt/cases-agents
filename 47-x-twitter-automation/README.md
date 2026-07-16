# X Content Engine

Researches what's trending in your niche, drafts on-brand X (Twitter) posts, and keeps a scheduled, approve-ready post queue in Google Sheets — you copy, paste, and post.

## Value & ROI
A freelance X ghostwriter costs $500–1500/mo; content tools (Typefully, Hypefury) run $20–50/mo plus your own time. Manual trend research and drafting eats 30–60 min every day. This agent does the research overnight and hands you finished drafts each morning. Total cost: $29/mo — the core is fully native, you post by copy-paste, no external API. Payback vs $29: 17–50x — one month of a ghostwriter covers years. Optional auto-posting via the X API adds ~$200/mo (see below); the core never needs it.

## What it does
1. Maintains a content queue in Google Sheets "X Post Queue" (columns: date, scheduled_time, pillar, post_type, hook, draft_text, hashtags, source_url, status, impressions, likes, replies, notes).
2. Researches trending topics and fresh news in your niche each night from the open web, ranks the best angles, and links every claim to a source.
3. Drafts on-brand posts — single tweets, threads, and replies — in your voice, with a strong hook and character/hashtag limits respected.
4. Drafts giveaway posts with clear rules; picks fair random winners from an entrant list you paste (transparent Python method).
5. Every morning delivers today's approve-ready posts as ready-to-copy text, plus any drafts awaiting your approval.
6. Reminds you at each scheduled slot to post the approved item (posting stays manual in the core).
7. Friday review: from the metrics you paste back, finds your best pillars, hooks, and post types and proposes next week's content mix.

## Folder contents
- `workspace/` — copied into the ASCN agent workspace (IDENTITY, SOUL, ONBOARDING, CRON_PLAYBOOK, skills, knowledge).
- `DEPLOY_PROMPT.md` — prompt for Claude Code that transfers everything to ASCN.
- `INTEGRATIONS.md` — which integrations are needed, why, and what they cost.

## Quick deploy
1. Open Claude Code in this folder.
2. Paste the contents of `DEPLOY_PROMPT.md`.
3. Send the agent "Hi, let's set up" — it runs its own onboarding (niche, pillars, voice, integrations, test run on your real topics).

## Required integrations
Native: Google Sheets (required), built-in web search and web reading (no setup). External: none. Channel: Telegram (recommended). Optional native: Google Docs (long thread drafts).

## Deliberate limitations
- The core does not post to X. X posting needs a paid API, so the agent researches, drafts, and queues; you copy-paste to post. Auto-posting is an optional upgrade (X API ~$200/mo, or a scheduler like Typefully/Buffer ~$15–30/mo) — see INTEGRATIONS.
- No browser scraping and no login cookies (platform limit and X terms of service). Trend research uses public web pages and web search only; pulling real follower/liker/retweeter lists or live account monitoring needs the official X API (optional upgrade).
- Engagement metrics are not read automatically in the core — you paste post numbers back into the queue and the agent analyzes them. Automatic metrics also need the X API.
- The agent never buys followers or engagement and never posts fake reviews or astroturfs — banned outright (platform terms and reputational risk).
