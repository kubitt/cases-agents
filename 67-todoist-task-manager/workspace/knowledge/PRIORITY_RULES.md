# Priority Rules

> Your reference file: how the agent ranks tasks and builds the daily plan. The agent follows this file over any casual chat phrasing. Edit freely.
[FILLED DURING ONBOARDING — the agent maintains this file; the user may edit]

## Priority labels
- P1: [FILL DURING ONBOARDING — default: must happen or has a hard deadline]
- P2: [FILL DURING ONBOARDING — default: important but no fixed date]
- P3: [FILL DURING ONBOARDING — default: nice to have]

## Daily ranking order
(the order the daily plan fills today's must-dos)
1. Overdue tasks (past due_date, not done) — flagged OVERDUE
2. Due today
3. P1 with no due date
4. Fill remaining capacity with P2 by oldest date_added
5. P3 only if capacity remains → shown as "if time"

## Capacity and rollover
- Daily capacity: [FILL DURING ONBOARDING — default 5 must-dos]
- Rollover: unfinished status=today tasks return to status=next each morning and are re-ranked
- Overload: if must-dos exceed capacity, the agent asks what to drop — it never pads the day

## Definition of done
- A task is done only when the user says so: status=done and date_done set
- Done tasks stay in the Task List for the weekly review; they are not deleted

## Example filled
- P1 = client-facing or hard deadline · P2 = moves a project forward · P3 = optional cleanup
- Capacity: 5 must-dos/day · Rollover on · P3 shown only when the day is light
