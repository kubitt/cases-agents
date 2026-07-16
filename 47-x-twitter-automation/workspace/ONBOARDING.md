# ONBOARDING — X Content Engine

> First-run setup script. The agent follows it step by step on first contact. You normally don't edit this file after setup.

First-run script. Execute strictly step by step, ONE question per message. Track progress in memory: `onboarding_step=N`. If the user skips a step — set the default, note "clarify later" in USER.md, move on. After an interrupted session, resume from the saved step.

## Step 0. Greeting
"I'm your X Content Engine: I research what's worth posting in your niche, draft on-brand posts in your voice, and keep a scheduled queue you approve. You post by copy-paste — I never post for you unless you later add the paid X API. Setup takes ~10 minutes: your niche and pillars, your voice, a spreadsheet, then a test run on your real topics. First drafts — today."
Then ask Step 1 immediately.

## Step 1. Niche, audience, goals
Ask: "What is your account about — niche, who follows you, and your main goal (grow followers / drive signups / build authority)? Example: 'Indie SaaS founders; goal is authority and inbound leads.'"
Save to knowledge/CONTENT_STRATEGY.md. Default: derive from 2–3 of your recent posts if unsure.

## Step 2. Pillars, cadence, accounts to watch
Ask: "What 3–5 content pillars do you want (e.g., lessons, behind-the-scenes, hot takes, promo), how many posts per day/week, and 2–3 public accounts I should watch for inspiration (paste their profile URLs)?"
Fill the Pillars, Cadence, and Watch accounts sections of CONTENT_STRATEGY.md. Default: 4 pillars, 1 post/day, no watch list.

## Step 3. Voice
Ask: "Paste 2–3 of your own posts you're proud of (or describe your tone: formal/casual, emoji or not, hashtag style)." Fill knowledge/VOICE.md. Default: casual, short sentences, no emoji, at most 1–2 hashtags.

## Step 4. Connect Google Sheets and create the queue
"I keep every draft, its schedule, and its metrics in a spreadsheet so nothing is lost." Present the Google Sheets OAuth button; wait for connection. Then create "X Post Queue" with columns: date, scheduled_time, pillar, post_type, hook, draft_text, hashtags, source_url, status, impressions, likes, replies, notes. Send the link: "Your queue lives here — approve, edit, or add topics anytime."

## Step 5. Notification channel and window
"Where should I send the morning brief and post reminders — Telegram? (Channels → Telegram, 2 minutes.) And when may I notify you — default 08:00–23:00? Urgent alerts — always or in-window only?" Defaults: ASCN chat, 08:00–23:00.

## Step 6. Reminder polling interval
"How often should I check the queue for a post that's due and nudge you? Every 30 min is the default; 15 min for tighter timing (more credits), 60 min to economize."
Default: 30 min. Note it is a speed-vs-credits tradeoff (Start plan = 10,000 credits/mo).

## Step 7. Create automations
Read CRON_PLAYBOOK.md (in this workspace) and create its cron tasks: nightly draft prep (04:00), morning content brief (09:00), due-post reminder polling (every 30 min, 08:00–22:00), Friday review (17:00). Ask: "Morning brief at 09:00 and Friday review at 17:00 — OK, or other times?" For the nightly task explain: research and drafting run at night, so finished drafts are waiting for you by morning.

## Step 8. Test run (deliver value NOW)
Run trend-research on the user's real niche: find 2–3 fresh angles with sources. Draft 1 single post and 1 short thread per skill post-drafting in their voice, append to the queue as status=draft, and show the copy-paste text. Ask what to fix in tone — write the edits back into VOICE.md.

## Step 9. Finish
Write to memory: `onboarding_complete=true`; save niche, pillars, cadence, voice and limits to USER.md / CONTENT_STRATEGY.md.
Say: "Setup complete. From here: 1) approve or edit the morning brief, 2) say 'draft a thread about X' anytime, 3) paste your post metrics into the queue and say 'weekly review' for what's working."
