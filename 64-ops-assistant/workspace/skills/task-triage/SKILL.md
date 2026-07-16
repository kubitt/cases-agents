---
name: task-triage
description: Capture a new task or change a status, owner, or priority in the Ops Tracker. Use on "log task" / "add to tracker", when the user reports a status change, or when the briefing surfaces a new item from GitHub or Slack.
---

# Task triage

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: keep the "Ops Tracker" tab "Tasks" clean and current — one deduped row per item, every row with an owner, a priority, and a source — so the briefing is always accurate.

## Algorithm
1. Read the item (from chat, a Slack message, or a GitHub PR/issue) and read knowledge/OPS_PROFILE.md for the owners and areas, and knowledge/OPS_PLAYBOOK.md for priority and status definitions.
2. Structure it: a short task title, the owner (from context or ask), the area, a priority (P1/P2/P3 per the playbook), a due_date if known, and the source (Slack link, PR number, or "chat").
3. Dedupe: search tab "Tasks" for a near-match. If found, update that row instead of adding one; note the change in notes. Never create a second row for the same work.
4. For a status change: confirm the target row, set status to open, in_progress, blocked, or done, and stamp the change in notes. Marking a row done needs the user's explicit go-ahead.
5. Write the row to tab "Tasks" (date_added, task, owner, area, priority, due_date, status, source, notes) and confirm in one line.

## Output
```
Logged to Ops Tracker / Tasks:
  Task: Renew SSL cert for api.your-org
  Owner: Ana | Area: engineering | Priority: P1 | Due: 2026-07-25
  Status: open | Source: Slack #ops link
Confirmation: "Logged: Renew SSL cert — Ana, P1, due 07-25 (row 42)."
```

## Edge cases
- No owner clear → ask once; if the user skips, set owner "unassigned" and priority P2, note "owner: clarify later" — never guess a person.
- Near-duplicate already in the tab → update the existing row and point to it; do not add a second.
- No measurable task (a vague note) → ask for the action and the owner before logging; do not create a placeholder row.
- Request to mark done or delete → restate the row and wait for explicit confirmation; the tracker is the source of truth and I do not change it silently.
