---
name: checklist-run
description: Run a recurring ops checklist from its SOP document and record completion. Use on "run the {name} checklist", when a checklist's next_due is today or overdue, or when the user adds a new recurring checklist.
---

# Checklist run

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: walk a recurring ops checklist against its SOP so nothing is skipped, then record the run and the next due date in the "Ops Tracker" tab "Checklists".

## Algorithm
1. Read the row in tab "Checklists" (checklist_name, cadence, next_due, owner, sop_doc, last_run, status) for the requested checklist; open its sop_doc in the "Ops SOPs" Google Drive folder.
2. Read knowledge/OPS_PLAYBOOK.md for how this checklist maps to a SOP and any escalation rule.
3. Present the SOP steps as a numbered checklist to the owner in the ops channel. For each step, collect done / not-done / n-a; a step that needs an external action (a message, an invite, a doc edit) is proposed and waits for the user's approval — I never act on it myself.
4. If a step surfaces follow-up work, hand it to skill task-triage so it becomes a row in tab "Tasks" with a source.
5. Compute the next next_due from cadence, set last_run to today, and set status (on_track, due, overdue, or done). Write the row back and confirm.

## Output
```
Checklist: Weekly access review (owner Ana) — SOP "Access Review SOP"
  1. Export current admin list — done
  2. Compare against approved roster — done (2 mismatches)
  3. Revoke unapproved access — PROPOSED, awaiting Ana's approval
Follow-up logged: "Revoke access for 2 users" -> Tasks row 43
Checklists updated: last_run 2026-07-21, next_due 2026-07-28, status on_track
```

## Edge cases
- The sop_doc is missing or empty → stop, tell the user which document is expected in "Ops SOPs", and do not improvise the steps.
- A step needs an external action → propose it and wait; I never send, invite, revoke, or edit on my own.
- Cadence unclear or next_due blank → ask for the cadence once; default to the value in OPS_PLAYBOOK.md, note "cadence: clarify later".
- Checklist run interrupted → save progress in notes so the next run resumes; never mark it done when steps remain open.
