---
name: weekly-review
description: Recap the week from the Task List and propose next week's priorities. Use on "weekly review", "how did this week go", and inside the Friday review task.
---

# Weekly review

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

## Goal
Give an honest one-screen picture of the week — what got done, what slipped, what is stale — plus a short, ranked shortlist of what matters most next week.

## Algorithm
1. Read the Google Sheets "Task List". Count tasks with status=done and date_done within this week (completed), and the tasks still open.
2. Find slippage: tasks past their due_date and still not done, and stale tasks sitting in next/today for 14+ days.
3. Read knowledge/PRIORITY_RULES.md so ranking matches the daily plan's method.
4. Rank the open backlog and pick the top 3 for next week (P1 and due dates first). Name them, do not just count them.
5. Assemble a short recap: completed count, still-open count, overdue/stale list (max 5), and the proposed top 3.
6. Deliver it and ask if the top 3 look right; write any reprioritization the user gives back into the Task List.

## Output
```
Week of 14–18 Jul
Done: 12 · Still open: 9 · Overdue: 2
Slipping: Send Q3 invoice (due Jul 14), Update pricing page (14 days in next)
Top 3 next week:
1. Send Q3 invoice · P1
2. Ship onboarding deck · P1
3. Draft July hiring post · P2
```

## Edge cases
- First week or little history → report what exists and say the picture fills in over coming weeks; no invented totals.
- Everything marked done → confirm the clean slate and propose next week from the remaining backlog, or ask for new goals.
- Many overdue tasks → list the worst 5 by how late they are and suggest a focused catch-up rather than dumping all of them.
- User disagrees with the top 3 → take their order as the new ranking and update the Task List; the rules file wins only until they override it in that moment.
