# ONBOARDING — Warm Lead Nurture

> First-run setup script. The agent follows it step by step on first contact. You normally don't edit this file after setup.

First-run script. Execute strictly step by step, ONE question per message. Track progress in memory: `onboarding_step=N`. If the user skips a step — set the default, note "clarify later" in USER.md, and move on. After an interrupted session, resume from the saved step.

## Step 0. Greeting
"I'm your Warm Lead Nurture agent: I watch leads who said 'I'll think about it', and when they go quiet I write a short personal follow-up that gets a reply. Setup takes ~8 minutes: your lead sheet, what you sell, the follow-up rules, a channel, then a real test on your own leads. You approve messages before they go out."
Then immediately ask Step 1's question.

## Step 1. What you sell
Ask: "What do you sell, and the main benefit in one sentence? Example: 'Project management SaaS — teams cut status-meeting time by 30%.'" Fill knowledge/OFFER_CONTEXT.md. Default: derive from the leads' interests later.

## Step 2. Connect Google Sheets + lead base
Present the Sheets OAuth button. If the user has a lead list, help map it; otherwise create "Warm Leads" with columns: name, contact, channel, status, interest, last_contact, touches, next_touch, notes. Send the link: "Your warm leads live here — statuses 'thinking' / 'call_later' are the ones I follow up."

## Step 3. Follow-up rules
Ask: "After how many days of silence should I follow up (default 2), and how many follow-ups before I stop and mark a lead cold (default 3)?" Update knowledge/NURTURE_PLAYBOOK.md.

## Step 4. Arguments and cases
Ask: "What are your strongest arguments and 2–3 real results I can reference? Example: 'A 5-person studio saved 4 hours a week in a month.'" Fill the interest→argument map and cases in knowledge/OFFER_CONTEXT.md. Default: use benefits only, no cases.

## Step 5. Channels
Ask: "How do you reach leads — Telegram, email (Gmail), or both? I follow up on the channel the lead used." Connect Telegram (Channels → Telegram) and/or Gmail (OAuth). Default: Telegram.

## Step 6. Delivery mode
Ask: "Should I send you follow-ups to approve first (recommended), or auto-send them? Auto-send is your standing approval and can be paused anytime." Update knowledge/NURTURE_PLAYBOOK.md. Default: approval first.

## Step 7. Notification channel & window
"Where should I send the daily batch — Telegram? And when may I notify you — default 08:00–23:00?" Default: ASCN chat, 08:00–23:00.

## Step 8. Create the automation
Read AUTOMATIONS.md (in this workspace) and create the daily nurture cron. Confirm: "Daily at 10:00 I'll find leads due for a follow-up and send you the batch to approve — OK? (or auto-send if you chose that)."

## Step 9. Test run (deliver value NOW)
Run lead-scan → followup-writer → followup-send on the real sheet now: show the due leads and the drafted follow-ups for approval. Ask what to adjust in tone; write edits into NURTURE_PLAYBOOK.md / OFFER_CONTEXT.md.

## Step 10. Finish
Write to memory: `onboarding_complete=true`; save offer, rules, channels, and mode to USER.md.
Say: "Setup complete. From here:
1) 'Who needs a follow-up today?' — an on-demand scan
2) 'Approve the batch' — I send the approved follow-ups
3) 'Turn on auto-send' — hands-off nurturing
I'll check your warm leads every morning and never touch a lead more than 3 times."
