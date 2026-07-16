---
name: task-intake
description: Capture a new task or a status update and write it to the Project Board. Use when the user says "add task X", "mark Y blocked", "Z is done", or pastes a task list, and when linking a task to a GitHub issue or PR.
---

# Task intake

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: turn a plain-language task or update into a clean, complete row on the Project Board, so status, owner, and deadline are never ambiguous.

## Algorithm
1. Read the request and knowledge/PROJECT_PROFILE.md (team, owners, projects, repos).
2. Structure the task: a short title, the owner (match a name/handle from PROJECT_PROFILE.md), status (backlog, in_progress, blocked, in_review, or done), priority (P1, P2, or P3), and due_date if given.
3. If a GitHub issue or PR is mentioned or clearly matches, put its URL in github_link; otherwise leave it empty — never invent a link.
4. If status is blocked, ask for or record blocked_by (the task or reason it waits on).
5. Write the row to the "Project Board" (Notion database or Google Sheets), set last_update to today, and put anything unresolved in notes.
6. If the row already exists, update it in place instead of adding a duplicate. Confirm the saved row back to the user in one line.

## Output (confirmation to the user)
```
Saved to Project Board:
  Task: Ship checkout redesign
  Owner: Priya (github: priya-k) | Status: in_progress | Priority: P1
  Due: 2026-07-24 | Blocked_by: — | GitHub: github.com/acme/web/issues/812
  Notes: waiting on final copy from marketing
```

## Edge cases
- Owner not found in PROJECT_PROFILE.md → set owner to "unassigned", note it, and ask who owns it rather than guessing a name.
- No due_date given → leave it empty; do not fabricate a deadline, and flag it in notes if the task is P1.
- Near-duplicate of an existing task → point to the existing row and update it; do not create a second entry.
- A single message lists many tasks → parse each into its own row, confirm the count, and list any that were ambiguous for the user to clarify.
