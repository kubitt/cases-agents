# Integrations: Pinterest Traffic Agent

| Integration | Required? | Purpose | Access / cost |
|---|---|---|---|
| OpenRouter API | Required | Image generation (model `google/gemini-2.5-flash-image`) | REST + key in Secrets as `OPENROUTER_API_KEY`; ~$0.03–0.10 per image (~$1.5–3/mo at 1 pin/day) |
| Pinterest API v5 | Required | Publishing pins to your board | OAuth 2.0 access token in Secrets as `PINTEREST_ACCESS_TOKEN` (scopes: boards:read, pins:read, pins:write); free — up to 100,000 requests/day |
| Telegram Bot | Recommended | Pin previews for approval + live-pin reports | Bot token in Secrets as `PINTBOT` + chat id as `TELEGRAM_CHAT_ID`; free |
| Google Sheets | Optional | A running log of published pins for analytics | Native OAuth, 1 click |

Secrets to create before first run (Settings → Secrets): `OPENROUTER_API_KEY`, `PINTEREST_ACCESS_TOKEN`, `PINTBOT`, `TELEGRAM_CHAT_ID`. The Pinterest username and board id are not secrets — they live in `workspace/knowledge/PIN_SETTINGS.md`.

Onboarding connection order: niche strategy → Pinterest token + board → OpenRouter key → Telegram → test pin.

**How to find your Pinterest board id:** open the board in a browser; the id is the long number in the URL (`pinterest.com/<user>/<board>/` → use the Pinterest API `GET /v5/boards` to list boards with their ids, or copy it from the board's API response). The agent can list your boards and their ids once the token is connected.

Degradation: without Telegram — previews and reports arrive in ASCN chat. Without Google Sheets — the pin log stays in agent memory (headings + dates only). Without OpenRouter or the Pinterest token — the agent cannot generate or publish; onboarding blocks until both are provided.

Deliberately absent / optional upgrades:
- **Other image providers** (fal.ai, Replicate, OpenAI images, Stability) — swappable alternatives to OpenRouter. Ask the agent to switch if you prefer a different model or price point; each needs its own key and a one-line change in the pipeline.
- **Pinterest scheduling via a third party** (Tailwind, Later) — not needed; the agent's own autoposting cron covers scheduled publishing.
- **Analytics beyond publish confirmation** — Pinterest impressions/click stats require the Pinterest Analytics API; can be added later as a weekly report if you connect the extra scope.
