# Daily Reddit Digest

Every morning: the top-performing posts from the subreddits you care about — ranked, de-duplicated, and learning your taste as it goes.

## Value & ROI
Skimming 8–15 subreddits for the good stuff is 30–45 min a day — 10–15 hours a month. Reddit-monitoring tools (GummySearch, Syften, Brand24) run $29–199/mo and still make you read everything. This agent reads the public pages for you with built-in web reading, ranks by real upvotes and comments, drops what you have already seen, and tightens to your taste from daily feedback. Total cost: $29/mo (ASCN Start, 10,000 credits), no external APIs required. Honest payback vs $29: roughly 10–40x — the time back, plus one replaced monitoring subscription.

## What it does
1. Reads your target subreddits from the public web (no login, no posting) and pulls the day's top posts.
2. Ranks them by a simple, visible score (upvotes, comments, recency) and tags each by category.
3. Applies your preference rules (e.g., "no memes, prefer how-tos") and drops posts already sent in recent days.
4. Delivers one clean digest each morning to Telegram or ASCN chat, each item linking to the real post.
5. On request, pulls a post's comment thread for context or shortlists posts to review or reply to later.
6. Asks daily whether you liked the picks and saves your answer as sharper preference rules.
7. Logs every ranked post to Google Sheets "Reddit Digest Log" so history and trends compound.

## Folder contents
- `workspace/` — copied into the ASCN agent workspace (IDENTITY, SOUL, ONBOARDING, AUTOMATIONS, 3 skills, 2 knowledge files).
- `DEPLOY_PROMPT.md` — prompt for Claude Code that transfers everything to ASCN.
- `INTEGRATIONS.md` — which integrations are needed, why, and what they cost.

## Quick deploy
1. Open Claude Code in this folder.
2. Paste the contents of `DEPLOY_PROMPT.md`.
3. Send the agent "Hi, let's set up" — it runs its own onboarding (subreddits, preferences, channel, then a live first digest).

## Required integrations
Native: Google Sheets (recommended — the log) and built-in web reading (the core, no key). Channel: Telegram (recommended) or ASCN chat. External: none required. Optional upgrade: Reddit official API (~$0–5/mo, light use) for cleaner data — see INTEGRATIONS.md.

## Deliberate limitations
- Read-only by design: it never posts, votes, comments, or messages on Reddit — it reads public pages and reports to you.
- Uses the open web, not a logged-in scraper: private, quarantined, or login-only content is out of reach (add the official Reddit API later for cleaner data).
- Rankings use public signals (upvotes, comments, recency), not Reddit's internal algorithm — a useful proxy, not an exact match.
- It curates and summarizes; the read-and-reply judgment stays yours — it builds the shortlist, you act on it.
