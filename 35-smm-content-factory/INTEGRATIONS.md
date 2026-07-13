# Integrations: SMM Content Factory

| Integration | Required? | Purpose | Access / cost |
|---|---|---|---|
| OpenRouter API | Required | One AI image per post (`google/gemini-2.5-flash-image`) | REST + key in Secrets as `OPENROUTER_API_KEY`; ~$0.03–0.10/image (~$1/mo at 5 posts/week) |
| Telegram | Recommended | Approval packages + publishing to your Telegram channel | Native OAuth channel, 2-min setup |
| Google Sheets | Recommended | Brand profiles + content log (avoids repeats) | Native OAuth, 1 click |
| Blotato API | Optional | Auto-publish to Instagram / X / LinkedIn (closed-API networks) | REST + key in Secrets as `BLOTATO_API_KEY`; paid plans, see blotato.com |
| VK API | Optional | Auto-publish to a VK community wall | REST + token in Secrets as `VK_TOKEN`; free |

Secrets to create before first run (Settings → Secrets): `OPENROUTER_API_KEY` (required). Optional: `BLOTATO_API_KEY`, `VK_TOKEN`.

Onboarding connection order: brand profile → Google Sheets → Telegram → OpenRouter key → (optional VK/Blotato) → test package.

Trends use built-in web search by default (no key). Firecrawl (`FIRECRAWL_API_KEY`) is an optional upgrade for richer trend scraping.

Degradation: without Blotato/VK — Telegram publishes directly, other networks arrive as a ready-to-post package (text + image). Without Google Sheets — profiles and history live in agent memory (lighter). Without OpenRouter — posts ship as text only; onboarding recommends adding the key first.

Deliberately absent / notes:
- **Instagram / X / LinkedIn have no open publishing API on ASCN** — auto-posting there routes through Blotato (a multi-social API); otherwise the agent hands you a ready package to post manually. This is a platform reality, not a shortcut.
- **No paid ads, no DMs, no comment automation** — this agent creates and publishes organic posts only.
- **Analytics beyond publish confirmation** — post performance (reach, engagement) needs each network's analytics API; can be added later as a weekly report.
