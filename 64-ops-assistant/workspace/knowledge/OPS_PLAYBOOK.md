# Ops Playbook

> Your reference file: the definitions and the checklist catalog the agent follows. The agent reads it before every briefing, triage, and checklist run. Edit freely to tune the program.
[FILLED DURING ONBOARDING — user-tunable; the agent follows the current version]

## Priority and status definitions
(plain "field: value" lines — no tables)
- P1: [FILL DURING ONBOARDING — default: blocks a release, a customer, or money; act today]
- P2: [FILL DURING ONBOARDING — default: important this week]
- P3: [FILL DURING ONBOARDING — default: nice-to-have / backlog]
- Task statuses: open, in_progress, blocked, done
- Checklist statuses: on_track, due, overdue, done

## Briefing format
- Daily briefing max length: [FILL DURING ONBOARDING — default 20 lines]
- Order: tasks summary, GitHub, calendar, checklists due, then Top 3 next actions
- Top-3 rule: [FILL DURING ONBOARDING — default: overdue P1 first, then review-blocking PRs, then checklists due today]

## Recurring checklists catalog
(one block per checklist; each maps to a Google Doc in "Ops SOPs")
- checklist_name: [FILL DURING ONBOARDING]
  - cadence: [FILL DURING ONBOARDING — e.g., weekly Monday]
  - owner: [FILL DURING ONBOARDING]
  - sop_doc: [FILL DURING ONBOARDING — the SOP document name]

## Escalation
- When an overdue P1 sits untouched past [FILL DURING ONBOARDING — default 24h]: [FILL DURING ONBOARDING — default: name it first in the briefing and @the owner in Slack, with approval]

## Example filled
- P1 = blocks a release or a paying customer; P2 = this week; P3 = backlog
- Daily briefing max 20 lines; Top 3 = overdue P1, then blocking PRs, then due checklists
- Checklist: Weekly access review | cadence weekly Monday | owner Ana | sop_doc "Access Review SOP"
- Checklist: Month-end finance close | cadence monthly last-weekday | owner Chris | sop_doc "Finance Close SOP"
