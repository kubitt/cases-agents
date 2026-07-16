---
name: task-capture
description: Turn a raw note into a structured task and log it to the Task List. Use when the user says "add task…", "remind me to…", "capture this", or pastes something to do.
---

# Task capture

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

## Goal
Turn a raw note into one clean, structured task in the Google Sheets "Task List" — with a priority, a project, and a due date only if the user actually gave one — so the list stays trustworthy and free of duplicates.

## Algorithm
1. Read the note. Read knowledge/TASK_SETUP.md for the project list and knowledge/PRIORITY_RULES.md for the priority scheme.
2. Extract: a short action-first task name, the project it belongs to, an estimate if implied, and a due_date ONLY if the user stated one (a date or "by Friday"); otherwise leave due_date blank.
3. Assign a priority (P1/P2/P3) from the rules. If it is unclear and the task looks important, ask one quick question; otherwise default to P2 and note it.
4. Check for a near-duplicate already in the Task List (same action + project). If found, point to the existing row instead of adding a second.
5. Append a row: date_added=today, task, project, priority, due_date, estimate, status=inbox, source (chat/forward), notes, date_done blank.
6. Confirm in one line so the user sees exactly what was logged.

## Output
```
Logged: Renew domain before it expires · P1 · due 2026-07-24 · project Home · status inbox
(near-duplicate check: none found)
```

## Edge cases
- No due date given → leave due_date blank; never invent one, and do not assume "today".
- Several tasks in one message → split into separate rows, one per action, and confirm the count.
- Vague note ("look into pricing") → keep it as status=inbox and ask for the one concrete next action at triage rather than guessing.
- Near-duplicate already exists → flag it and point to the existing row; do not create a second entry.
