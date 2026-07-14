# Buying-signal markers and source recipes

> Your reference file. The agent reads it before working and updates it as it learns. Edit freely.

## Signal markers (phrases people use when they have a solvable problem)
Case-insensitive. Use to build search queries and to pre-filter before scoring.

**EN:** how do I, is there a tool, any tool to, looking for a tool, recommend a tool, want to build, want to automate, how to automate, wish there was, tired of doing X manually, by hand, spending hours on, drowning in, overwhelmed by, too complicated, too expensive, alternative to, frustrated with, need an assistant, can't afford to hire.

Pre-filter: keep a candidate for scoring only if the text has at least one marker OR a question form OR clear intent to build/buy/automate.

## Building queries
For each signal × each enabled source, build 3-6 queries = signal phrase × ICP words × source. Examples (demo niche):
`"want to build an AI agent" site:reddit.com`, `how to automate follow-up emails indiehackers`, `"is there a tool" automate reports small business`, `Zapier too complicated alternative`, `"looking for someone to build" AI assistant`.

---

## Source recipes

### Hacker News — Algolia API (no key, free) — do this first
- Comments: `https://hn.algolia.com/api/v1/search?query=<URL-encoded>&tags=comment&hitsPerPage=20`
- Stories: `https://hn.algolia.com/api/v1/search?query=<URL-encoded>&tags=story&hitsPerPage=20`
- Freshness: add `&numericFilters=created_at_i>UNIXTS`.
- Fields (`hits[]`): `comment_text` or `story_text`/`title` → text; `points`/`num_comments` → engagement; `created_at` → timestamp; url = `https://news.ycombinator.com/item?id=<objectID>`. Do NOT store author, hash it.
- Call via `clawman__web_fetch` (GET) or `shell` + curl.

### IndieHackers & niche forums
- `clawman__web_search` for the query → `clawman__web_fetch` the 1-2 best threads to read individual comments and pull the exact hook quote. Best free source for founders describing pains.

### Stack Exchange (no key — low limit)
- `https://api.stackexchange.com/2.3/search/advanced?order=desc&sort=relevance&q=<query>&site=softwarerecommendations` (also `webapps`, `stackoverflow`). Fields: `items[].title`, `items[].link`, `score` → engagement.

### Reddit (needs OAuth, or fallback)
- If Secrets has `REDDIT_CLIENT_ID` + `REDDIT_CLIENT_SECRET`: get a token at `https://www.reddit.com/api/v1/access_token` (grant_type=client_credentials), then `https://oauth.reddit.com/search` with a User-Agent. Subreddits for the demo niche: AI_Agents, automation, SaaS, Entrepreneur, smallbusiness, nocode, artificial.
- No keys: fallback to `clawman__web_search "<query> site:reddit.com"` then `clawman__web_fetch` the thread. Note: the built-in crawler often can't reach Reddit — this is where an Exa or Apify MCP matters most.

### Exa / Apify MCP (recommended for volume)
- **Exa** (`https://mcp.exa.ai/mcp`): neural search — find posts semantically like "someone describing <the pain the product solves>". Prefer its advanced web-search tool, then `web_fetch` each hit for the hook quote.
- **Apify** (`https://mcp.apify.com`): run a Reddit/X lead actor for volume, then feed results into the pipeline.

### X / Twitter
- Off by default (no free read since 02.2026). Only via a third-party API and only if free sources run dry.

## Privacy & limits
- Author handle → store only as needed to reply; do not build a dossier.
- Dedup by URL and by source+handle (people share one thread URL).
- 429 → back off and continue with other sources.
- Idempotency: remember seen post ids (`ncf_seen_ids`), don't re-chew old ones.
- Per-run cap (default): ≤ 4-6 searches and ≤ 8 fetches so a run stays inside platform limits.
