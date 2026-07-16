# Integrations: Podcast Production Pipeline

| Integration | Required? | Purpose | Access / cost |
|---|---|---|---|
| Google Sheets | Required | "Episode Pipeline" tracker: one row per episode, status, links | OAuth, 1 click |
| Google Docs | Required | Per-episode docs: "Episode NN — Prep", "Episode NN — Show Notes", "Episode NN — Publish Kit" | OAuth |
| Web search/reading | Required | Guest and topic research, competitor watch | Built-in, no setup, no cost |
| Telegram (channel) | Recommended | Delivers packages, weekly nudges, approval prompts | 2-min setup |
| Google Drive | Optional | One folder per episode to keep docs organized | OAuth |

Onboarding connection order: Google Sheets → Google Docs → Telegram (Drive optional, offered last).

Degradation: without Telegram — packages and nudges arrive in ASCN chat; without Google Drive — docs still get created, just not grouped in a per-episode folder.

Deliberately absent: podcast-host connectors (Spotify/Apple/YouTube upload — no native connector, closed APIs), social posting (Instagram/X posting — closed APIs, ban risk) — the agent produces publish-ready assets and drafts; you publish and post. Automatic audio transcription is not in the core (you provide the transcript text).

Optional upgrades (not wired in — need approval + budget, keys go in Settings → Secrets):
| Upgrade | Capability it buys | ~Cost |
|---|---|---|
| Transcription API (e.g. Whisper/Deepgram-class) | Auto-transcribe recorded audio into the transcript the show-notes step needs | ~$6–20/mo at a few hours/mo |
| Voice generation API (e.g. text-to-speech) | Generate intro/ad reads or a synthetic host voice from script text | ~$5–22/mo |
| Podcast host API (e.g. Transistor/Buzzsprout-class) | Upload the finished episode + description straight to your host | ~$19+/mo (host plan) |
