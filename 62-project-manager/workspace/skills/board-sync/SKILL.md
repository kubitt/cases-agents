---
name: board-sync
description: Poll GitHub issues and PRs and the Project Board for changes and reconcile them. Use during the board sync poll, at the start of every standup, and on "sync the board" or "refresh status".
---

# Board sync

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: keep the Project Board's status honest against GitHub reality and flag at-risk work early — without ever writing to GitHub or Slack.

## Algorithm
1. Read the saved marker board_sync_marker from memory (the timestamp of the last sync).
2. Read GitHub issues and PRs linked in the board's github_link column, plus any updated in the tracked repos since the marker.
3. Mirror state onto the board: an opened issue → in_progress; a PR opened → in_review; a PR merged or issue closed → done; an item labelled or noted as blocked → blocked. Update last_update to the change date. Only the board is written — never GitHub.
4. Read knowledge/STATUS_PLAYBOOK.md and apply the at-risk rules: due within 2 working days, blocked over 2 days, or no movement in 3 working days. Set the at-risk flag in notes.
5. Cross-check due_date against Google Calendar milestones; note any task whose deadline has slipped past its milestone.
6. Save the new marker. If nothing changed, finish silently. Never comment on, label, or close a GitHub issue; never post to Slack.

## Output (internal summary, surfaced in the standup)
```
Synced 14 tasks (3 changed since 08:30):
  #812 checkout redesign: in_progress -> in_review (PR opened)
  #779 payment webhook: still blocked 3 days -> at-risk (blocked_by: infra ticket)
  #740 search filters: no movement 4 days -> at-risk (owner: Dan)
Marker updated to 2026-07-16 09:00.
```

## Edge cases
- GitHub unreachable or rate-limited → keep the last known board state, mark the sync "partial", and report what could not be read; never wipe status.
- A board task with no github_link → sync it by its board fields only; do not guess a matching issue.
- Conflicting state (board says done, issue reopened) → trust GitHub for the code state, flag the conflict in notes, and ask the user which is right.
- Marker missing or first run → treat all tracked items as new, sync once, then set the marker.
