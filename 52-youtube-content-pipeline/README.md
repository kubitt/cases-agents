# YouTube Content Engine

Turns fresh, on-trend topics into ready-to-shoot video packages — titles, description, tags, thumbnail brief, and a full script outline — so you spend your time filming, not researching.

## Value & ROI
Preparing one video by hand is 60–120 min of trend research plus writing the title, description, tags, thumbnail concept, and outline. A freelance scriptwriter charges $50–150 per video, a thumbnail designer $20–40 per concept, and a part-time content researcher runs $500–1500/mo. This agent researches, scores, and packages every idea for you. Total cost: $29/mo (ASCN Start, 10,000 credits), no external APIs required. For a creator publishing 12–20 videos/mo that is roughly 15–40 hours saved; payback vs $29: 20–80x — one extra video shipped per week pays for years of subscription.

## What it does
1. Scans the open web overnight for fresh, on-trend topics in your niche, checks each against your published videos and past ideas, scores it, and logs it to Google Sheets "Idea Backlog".
2. Every weekday morning sends a pitch digest: the top new ideas with a one-line angle and source links, for you to approve.
3. On an approved idea, builds a full content package in a Google Doc: 3–5 title options, hook, script outline, description, tags, thumbnail brief, and a publishing checklist.
4. When you drop a link (in chat, or a Slack intake channel), researches the topic and turns it into a scored backlog idea with a starter outline.
5. Keeps "Idea Backlog" and "Video Catalog" current so the same topic is never pitched or filmed twice.
6. Never uploads or posts anything — you decide what goes live.

## Folder contents
- `workspace/` — copied into the ASCN agent workspace (IDENTITY, SOUL, ONBOARDING, AUTOMATIONS, 3 skills, 2 knowledge files).
- `DEPLOY_PROMPT.md` — prompt for Claude Code that transfers everything to ASCN.
- `INTEGRATIONS.md` — which integrations are needed, why, and what the optional upgrades cost.

## Quick deploy
1. Open Claude Code in this folder.
2. Paste the contents of `DEPLOY_PROMPT.md`.
3. Send the agent "Hi, let's set up" — it runs its own onboarding (~10 min: channel profile, packaging standards, connect Sheets + Docs, then it scouts and pitches your first real ideas).

## Required integrations
Native: Google Sheets (required), Google Docs (required). Built-in web search/reading for topic research. Slack (optional native) for link intake. External: none. Channel: Telegram (recommended).

## Deliberate limitations
- Does not upload to YouTube or read view counts / analytics — no native connector. The YouTube Data API is an optional upgrade (see INTEGRATIONS.md). You publish; it prepares.
- No X/Twitter search in the core — X's API is paid. Core research uses the open web; X is an optional upgrade.
- Dedup is topic-level against your Sheets catalog, not vector-embedding search — fine for a normal catalog; large-scale semantic dedup is an optional upgrade.
- Never posts, comments, or publishes for you; thumbnail briefs are written concepts, not finished images.
