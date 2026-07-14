# Inbound Request Router

Watches your inbound channels, sorts every request by type and urgency, logs it in your CRM, and notifies the right person — with urgent ones escalated to a human fast.

## Value & ROI
Requests arrive across email, Telegram, and website forms — and someone burns an hour a day copy-pasting them into a spreadsheet, guessing priority, and forwarding to the right teammate. Things slip; angry customers wait. A part-time ops coordinator costs $600–1,500/mo. The agent does the intake and routing all day for the price of the subscription. Total cost: $29/mo (ASCN Start), no external APIs — Gmail, Telegram, and Sheets are native and free. Payback vs $29: one saved hour a day is 20+ hours a month, and one urgent complaint caught in time protects the account.

## What it does
1. Checks inbound channels on a schedule (Gmail, Telegram, and site forms via forwarded email or a shared sheet) and dedupes against what's logged.
2. Classifies each request: type (purchase / question / complaint / partnership / spam) and urgency (high / medium / low).
3. Extracts the key fields — name, contact, essence, product — using only what's in the message, never guessing.
4. Records every request in a Google Sheets CRM with status = New.
5. Assigns an owner by your routing matrix and notifies them in Telegram.
6. Escalates high-urgency requests to the manager, with an optional acknowledgement reminder if no one responds in time.
7. Leaves spam logged but unrouted, so people only see real requests.

## Folder contents
- `workspace/` — copied into the ASCN agent workspace (IDENTITY, SOUL, ONBOARDING, AUTOMATIONS, 3 skills, 2 knowledge files).
- `DEPLOY_PROMPT.md` — prompt for Claude Code that transfers everything to ASCN.
- `INTEGRATIONS.md` — integrations and the polling cron.

## Quick deploy
1. Open Claude Code in this folder.
2. Paste the contents of `DEPLOY_PROMPT.md`.
3. Send the agent "Hi, let's set up" — it runs its own onboarding (~8 min: channels, CRM sheet, team routing, urgency rules, a live test on real requests).

## Required integrations
Native: Google Sheets (required — the CRM), Telegram (recommended — TG requests + notifications), Gmail (recommended — email requests). External: none. Secrets: none.

## Deliberate limitations
- **It routes, it doesn't reply.** The agent sorts and assigns; replying to customers is a person's or a sales/support agent's job.
- **Reactivity is polling, not instant webhooks.** It checks every 15–60 minutes (you choose). Near-instant reaction to a specific sender can be added later on request.
- **CRM is Google Sheets out of the box.** HubSpot/Pipedrive/amoCRM can be wired via API or a custom MCP after cost approval; Sheets covers most SMB needs.
- **Site forms need a bridge.** No direct webhook — forms come in via forwarded email or a shared "Form Intake" sheet.
- **It never invents fields or acts on money.** Missing data is "unknown"; refund/payment claims are flagged for a human, never auto-processed.
