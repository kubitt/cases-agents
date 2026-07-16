---
name: standup-digest
description: Compile the daily standup or the weekly status report from the Project Board. Use during the daily standup and weekly report tasks, and on "standup now", "status report", or "who's at risk?".
---

# Standup digest

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: hand the user a clear, honest picture of where every project stands — what moved, what is stuck, what is due — plus ready nudge drafts, all for approval before anything is sent.

## Algorithm
1. Read the "Project Board" and knowledge/STATUS_PLAYBOOK.md (at-risk rules, digest format, health rubric, nudge tone).
2. For the daily standup, group tasks into four sections: Moved (status changed since the last standup), Blocked, Due today, and Silent owners (no movement per the at-risk rules). One line per task: owner — task — status/date.
3. Build the at-risk list and draft one short factual nudge per at-risk owner using the tone in STATUS_PLAYBOOK.md — a fact and a question, never blame.
4. For the weekly report, compute per project: completed, opened, aging blockers, at-risk milestones, and a Red/Amber/Green health call with one line of reasoning.
5. Deliver the digest to the user's private channel as a ready-to-post draft. Ask "Post to Slack? (yes / edit)" for the digest and "Send all / numbers / none" for nudges.
6. Post to Slack and send nudges only after the user approves; then record what was posted in notes.

## Output (daily standup draft)
```
Standup — Tue 16 Jul
Moved: Priya — checkout redesign — in_review (PR #812)
Blocked: Dan — payment webhook — 3 days, waiting on infra ticket
Due today: Sam — pricing page copy — in_progress
Silent: Lee — search filters — no movement 4 days
At-risk (2): payment webhook, search filters
Nudge drafts: 1) Dan — payment webhook — "Blocked 3 days on the infra ticket — anything I can unblock?"
Post to Slack? (yes / edit)   Send nudges? (Send all / numbers / none)
```

## Edge cases
- A section is empty → write "none" for it; never pad the standup with filler.
- No data for a project this period → write "data not provided for period"; do not infer progress.
- Owner asked to stop being nudged → skip their nudge draft and note the opt-out; still list the task as at-risk for the user.
- User edits the draft before posting → post the edited version verbatim and save the edit style back to STATUS_PLAYBOOK.md.
