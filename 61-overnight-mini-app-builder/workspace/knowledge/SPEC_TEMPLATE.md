# Spec Template and Queue Structure

> Your reference file: what a good build request contains, plus the columns of the Build Queue and Build Log. The agent reads it during intake so every spec is buildable in one night. Edit freely.
[FILLED DURING ONBOARDING — defaults set with you; the agent follows the current version]

## A good spec has these fields
- name: a short handle for the build
- goal: one sentence — what it's for
- core feature: the ONE thing it must do
- inputs: what the user gives it
- output format: html-app / data-tool / script
- constraints: [FILL DURING ONBOARDING — e.g., single file, no paid API, works offline]
- acceptance check: "done when ..." — a concrete, testable condition

## Build Queue columns (Google Sheets)
- date_added, name, spec, type, priority, status, artifact_link, notes
- status values: queued, ready, building, built, shipped, blocked
- priority: 1–5, 1 = build first

## Build Log columns (Google Sheets)
- build_date, name, outcome, artifact_link, summary, next_step
- outcome values: built, partial, blocked

## Rules for a buildable spec
- One night, one MVP: if it can't be built and tested in a night, slice it.
- Every spec names its acceptance check; no done-condition -> it stays status=queued.
- No secrets in specs; keys go to platform Secrets, never into the sheet or the code.

## Example filled
- name: Expense splitter | goal: split a shared bill across people
- core feature: total + names + shares -> per-person amounts | inputs: total, names, shares
- output format: html-app | constraints: single self-contained file, works offline
- acceptance check: done when 3 people with uneven shares sum back to the total
