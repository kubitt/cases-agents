---
name: build-intake
description: Capture a build request, structure it into a one-night MVP spec, and add it to the Build Queue. Use when the user says "build me X", "add to the queue", or describes something to make.
---

# Build intake

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: turn a rough "build me X" into a clear, one-night-buildable spec and add it to the Build Queue — so each night the agent builds the highest-priority thing without re-asking.

## Algorithm
1. Read the request; read knowledge/BUILD_PREFERENCES.md for the default stack and output style, and knowledge/SPEC_TEMPLATE.md for the spec fields.
2. Structure the spec: name, goal (one sentence), the ONE core feature, inputs, output format (html-app / data-tool / script), constraints, and an acceptance check ("done when ...").
3. Confirm scope: if it's bigger than one night, propose an MVP slice now and park the rest in notes; never queue a spec that can't be built and tested in one night.
4. Pick the type and a priority 1–5 (1 = build first); confirm both with the user.
5. Append a row to Google Sheets "Build Queue" (columns: date_added, name, spec, type, priority, status, artifact_link, notes). Set status=ready only when the spec is complete; otherwise status=queued with a note on what's missing.
6. Confirm the queued item, its type, and its priority.

## Output
```
Queued to Build Queue:
  Name: Expense splitter
  Goal: A single-page tool to split a shared bill across people.
  Core feature: enter total + names + who owes what -> per-person amounts.
  Type: html-app | Inputs: total, names, shares | Output: self-contained index.html
  Acceptance: done when 3 people with uneven shares sum back to the total.
  Priority: 2 | Status: ready
Build Queue now: #1 Standup-notes formatter (p1) | #2 Expense splitter (p2)
```

## Edge cases
- Request too big for one night -> propose an MVP slice, queue that as ready, park the rest in notes; don't queue an un-buildable spec.
- No measurable "done" -> ask for the acceptance check before setting status=ready; a spec with no done-condition stays status=queued.
- Near-duplicate already in the Build Queue -> point to the existing row and don't add a second.
- Harmful or terms-breaking request (scraper, spam, credential tool) -> refuse with the reason and offer a lawful alternative; nothing is queued.
