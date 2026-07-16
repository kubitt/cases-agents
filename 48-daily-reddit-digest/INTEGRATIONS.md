# Integrations: Daily Reddit Digest

| Integration | Required? | Purpose | Access / cost |
|---|---|---|---|
| Built-in web reading | Included | Reads public subreddit pages and posts — the core, no login | Native, no key — $0 |
| Built-in web search | Included | Finds posts by topic across the target subreddits | Native, no key — $0 |
| Google Sheets | Recommended | "Reddit Digest Log": ranked posts, categories, shortlist, feedback | Native OAuth, 1 click — $0 |
| Telegram | Recommended | Delivers the morning digest and collects your daily feedback | Native OAuth channel, 2-min setup — $0 |
| Notion | Optional | Native alternative to Google Sheets for the log | Native OAuth — $0 |

Secrets to create before first run (Settings → Secrets): none. The agent reads Reddit's public pages with built-in web reading — no API key or token is required for the core digest.

Onboarding connection order: subreddits + preferences → Google Sheets (log) → Telegram (digest + feedback) → first live digest → daily crons.

Degradation: without Google Sheets — the log is held in workspace files instead (Notion is the native alternative), so history still compounds but is less shareable; without Telegram — the digest posts in the ASCN chat. Built-in web reading always works; the core never depends on a paid service.

Optional upgrades (not wired in — need approval + budget):
- Reddit official Data API — cleaner structured post/comment data and higher rate limits than public-page reading — ~$0–5/mo for light personal use (the free tier usually covers a daily digest; heavier or commercial use is billed at about $0.24 per 1,000 API calls). Add the key in Settings → Secrets and ask the deployed agent to use it; the digest works fully without it.

Deliberately absent / notes:
- No posting, voting, or commenting on Reddit — read-only by design (matches the source use case and respects Reddit's Terms of Service).
- No logged-in scraping or browser automation — the agent reads public pages only; login-only, quarantined, or NSFW-gated content is out of reach without the optional API.
