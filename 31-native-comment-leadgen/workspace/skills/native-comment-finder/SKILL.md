---
name: native-comment-finder
description: Full native-comment lead-gen pipeline — find fresh posts where people describe a solvable problem, score ICP fit, write a ready native comment, hand over a card (where to post + text + rules check). Posting is manual. Use on "find leads", "find posts to comment on", niche discovery, or a scheduled run.
---

# native-comment-finder

## When to use
When the user says "find leads", "find posts I can comment on", "run discovery", "find people who need this", or when a scheduled run fires. This skill is the full pipeline: find discussions → score fit → write comment → deliver a card → track. Posting is done by the owner.

## Main principle
The output is NOT a dump of posts. It is a small set of **ready-to-post cards**: where to post + a native comment that helps first and mentions the product once + a community-rules check. Help earns the mention. Every claim about the product comes only from the knowledge base (onboarding fills it; DEMO defaults in `knowledge/DOMAIN.md` until then). The agent never publishes — the owner posts manually (platforms like Reddit ban auto-posting).

## Tools per stage
- Search: `clawman__web_search`; stronger with an Exa/Apify MCP if connected.
- Read pages / call source JSON APIs (HN, Stack Exchange): `clawman__web_fetch` (GET) or `shell` + curl.
- Cache and artifacts: `file_write` / `file_read` / `file_list` (folder `files/ncf/`).
- Idempotency: `memory_store` / `memory_recall` (keys `ncf_*`).
- Delivery (cards, digest): `clawman__channels` (Telegram).
- Scheduling: `clawman__cron`.

## Parameters (from ONBOARDING / USER.md; defaults exist)
offer · product knowledge · ICP + anti-ICP · signals · sources · voice (post-as, tone) · daily limit (5-10) · per-run cap (≤4-6 searches, ≤8 fetches). Signal markers and source recipes are in `knowledge/SOURCES.md`. What counts as a lead and the scoring rubric are in `knowledge/DOMAIN.md`.

Mode: if not configured (no `native-comment_configured` flag), either run onboarding (SOUL.md first-run protocol) or, on "demo", run with the DEMO defaults from `knowledge/DOMAIN.md`.

---

## Stage 1 — SCOUT (find candidates)
For each enabled signal and source:
1. Build queries = signal markers (`knowledge/SOURCES.md`) × ICP words × source. 3-6 per signal.
2. Hit the source (recipes in `knowledge/SOURCES.md`): Hacker News Algolia first (no key), then IndieHackers/forums via web_search→web_fetch, Stack Exchange, Reddit (OAuth or web_search fallback), Exa/Apify if connected.
3. **Pre-filter before anything expensive:** keep a candidate only if its text has a signal marker OR a question form OR clear build/buy/automate intent. Skip the rest.
4. For each kept candidate open the page (`web_fetch`) just enough to confirm it's a real person with a real problem, and capture a **Candidate**.
5. **Dedup** by `url` and by `source+handle`. Skip ids already in `ncf_seen_ids`.
6. Stop at the per-run cap. Append to `files/ncf/candidates.jsonl`.

```
Candidate = { id, source, url, handle, timestamp, text, hook_quote, signal, engagement }
```
- `hook_quote`: a short, VERBATIM line from the post to personalize the comment. Must be an exact substring of the text — never invent it.

## Stage 2 — SCORE (qualify)
For each candidate, rate the five dimensions 0-2 per `knowledge/DOMAIN.md` and compute:
`score = 30*(pain_clarity/2) + 30*(solution_fit/2) + 15*(authority/2) + 15*(reachability/2) + 10*(recency/2)`
Tiers: hot ≥70 (QUALIFIED) · warm 40-69 (NEEDS_REVIEW) · cold <40 (REJECTED). Reject anti-ICP or genuine non-fit. Only hot/warm continue. Record score + tier on the candidate.

## Stage 3 — COMMENT (write the native comment)
For each qualified candidate, write a comment grounded ONLY in the product knowledge base:
1. **Hook** — reference their `hook_quote` so it's clearly not a bot.
2. **Help** — actually answer their question / give a useful tip, even if they never click.
3. **Mention** — the product once, naturally ("what worked for me / a tool I use"), with honest disclosure per `voice.post_as`. No feature dump, at most one link and only if the community allows.
4. **Soft question** — end with a low-friction question (offer a quick example, ask about their setup). 3-6 sentences, in the platform's voice.
Then a `rules_check`: verify the community's self-promo rules. If promotion is banned → write a pure-help comment with NO mention (or mark skip). Never risk the account.

## Stage 4 — DELIVER (card + manual post)
Build a card per qualified lead and send to the owner (Telegram if connected, else chat):
```
WHERE:   {url}  (reply under {handle})
SIGNAL:  {signal} · score {NN} · {tier}
POST AS: {voice.post_as}
RULES:   {promo ok / help-only / skip}
TEXT:    {the comment}
[Approve / Rewrite / Skip]
```
The owner opens the link and pastes the comment themselves. On approve+post → mark `POSTED`. Respect the daily limit; overflow waits for tomorrow. Save cards to `files/ncf/cards.jsonl`.

## Stage 5 — TRACK & FOLLOW-UP
- If the person replies under the posted comment → mark `REPLIED`, draft the next reply for the owner (still manual), escalate hot ones immediately.
- Light follow-up: resurface threads posted 3-4 days ago with no reply so the owner can nudge. No automated re-posting.
- Funnel summary on request or in the daily digest: Found | Qualified | Ready to post | Posted | Replied.

## Idempotency & cost
- Before a run: `memory_recall ncf_seen_ids`; after: append new ids.
- Log each stage: found / filtered / scored / comments written / searches used.
- Default per-run cap ≤4-6 searches, ≤8 fetches so the run stays inside platform limits. "Full run" lifts the cap. For steady flow, prefer a small daily cron over one big run.

## If something breaks
A source is down → don't fail the whole run: mark it `failed`, continue with the others, and say honestly in the summary what didn't work. Best safe partial result beats a crash.

## Calibration — good vs bad
**Good (help-first, one disclosed mention).** Post: "combining Make/Zapier with GPT but it's a pain to maintain." Comment: acknowledge the maintenance pain, give a concrete tip, then "full disclosure, I build agents on ASCN and use it for exactly this — even the free tier shows whether describe-it-in-words beats maintaining nodes. What's the first workflow you're automating?"
**Bad (reject/skip).** Generic "check out our amazing tool!!!", any comment in a strict no-promo subreddit, or a claim not in the knowledge base. If unsure whether promo is allowed → default to a pure-help comment with no mention.
