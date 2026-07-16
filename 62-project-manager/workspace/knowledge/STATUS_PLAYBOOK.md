# Status Playbook

> Your reference file: the rules for what counts as at-risk, how the standup looks, and how nudges are worded. The agent reads it before every digest and updates it from your edits. Edit freely.
[FILLED DURING ONBOARDING — the agent maintains this file; the user may edit]

## Status values and flow
- Allowed statuses: backlog, in_progress, blocked, in_review, done
- Normal flow: backlog -> in_progress -> in_review -> done; blocked can happen at any stage

## At-risk, stale, and blocked rules
(plain "rule: value" lines — no tables)
- At-risk if due within: [FILL DURING ONBOARDING — default 2 working days]
- Blocked too long if blocked over: [FILL DURING ONBOARDING — default 2 days]
- Stale if no movement for: [FILL DURING ONBOARDING — default 3 working days]

## Weekly health rubric (Red / Amber / Green)
- Green: no at-risk tasks, no slipped milestones
- Amber: one or more at-risk tasks, or a milestone at risk
- Red: a P1 task blocked over 3 days, or a missed milestone

## Standup format
- Sections in order: Moved, Blocked, Due today, Silent owners, At-risk, Nudge drafts
- One line per task: owner — task — status/date. Empty section → write "none".

## Nudge tone
- A fact plus a question, never blame; one nudge per owner per task per day; stop if the owner opts out.

## Example filled
- At-risk if due within 2 working days ; blocked over 2 days ; no movement for 3 working days
- Health this week: Website redesign = Amber (checkout PR in review, payment webhook blocked 3 days); Mobile app = Green
- Nudge: "@dan payment webhook has been blocked 3 days on the infra ticket — anything I can help unblock today?"
