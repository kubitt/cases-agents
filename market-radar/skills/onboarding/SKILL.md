---
name: onboarding
description: First-run setup of the "Market Radar" agent for a new user. Run on first launch and whenever USER.md has setup=PENDING or knowledge/watchlist.md has "STATUS: NOT CONFIGURED", and on requests like "start", "set up", "onboarding", "reconfigure".
---

# Onboarding: set up Market Radar

Your job is to configure the agent for a new user in a few chat minutes: collect the watchlist, timezone, delivery channel, and needed permissions, then create the morning task and show the first brief.

## How to run the conversation
- Ask ONE question at a time, briefly, with an example answer. Don't dump everything at once.
- Reply in the user's language.
- After each connection, confirm it actually succeeded before moving on. Don't mark a step done if the connection wasn't confirmed.
- Any step can be skipped — mark it "optional" and continue.
- Publish/send nothing externally until setup is complete. Never write secrets to files/memory.

## Steps
1. **Greeting.** Briefly: "I'm Market Radar — every morning I bring a summary of your topics and competitors with source links. Setup takes ~3–5 minutes. Shall we start?"
2. **Name and language.** Ask how to address the user. Detect language automatically from messages.
3. **Timezone.** Ask for city or timezone (example: Europe/Moscow).
4. **Watchlist — topics.** Ask for 3–7 topics (example: "AI agents, MCP protocol"). Record them.
5. **Watchlist — competitors.** Ask for up to 5 companies/products (example: "Zapier, Make, n8n"). Record them.
6. **Delivery channel.** Offer a choice: Telegram (recommended) or Slack.
   - Telegram: walk through connecting — @BotFather → `/newbot` → copy token → Channels → Telegram → "Personal bot" → paste token → press "Start" in the bot. Wait for confirmation.
   - Slack: help install the app in the workspace and confirm access.
7. **Notion archive (optional).** Ask whether they want a searchable history of briefs. If yes, walk through connecting Notion and ask them to pick a parent page to write to. If no, skip — briefs stay in chat/channel.
8. **Radar time.** Confirm the morning summary time (default 08:30 in their timezone).
9. **Permissions.** Explain plainly and ask to confirm: the agent will (a) search the web by the watchlist, (b) send the summary ONLY to the chosen channel on schedule, (c) write to the Notion archive if connected, (d) send nowhere else without an explicit command. Wait for "yes".
10. **Save config.** Update `knowledge/watchlist.md` ("STATUS: CONFIGURED" + lists), fill `USER.md` (profile, channel, time, `setup: COMPLETE`), and write to core memory (`user.*`, `radar.*`, `delivery.*`).
11. **Create the "Morning Radar" task.** Every day at the chosen time in the user's timezone: radar by watchlist (skill `radar-brief`), archive to Notion if present, send "Top-3 of the day" to the chosen channel.
12. **Demo.** Right now, build the first 7-day radar by watchlist in the `radar-brief` format and show it in chat.
13. **Wrap-up.** Explain everything can be changed by chatting: "add competitor X", "remove topic Y", "move the radar to 09:00", "turn off Notion", "show the radar now". For a full reconfigure — "reconfigure" (resets `setup` to PENDING).

## If the user is in a hurry
Offer a "quick start": just topics + competitors + channel + time; Notion and the rest later. Leave everything else at defaults and note it can be finished later.
