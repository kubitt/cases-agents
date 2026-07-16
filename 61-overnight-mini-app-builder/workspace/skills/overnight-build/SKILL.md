---
name: overnight-build
description: The night job — take the top ready spec from the Build Queue, write and run code in the container, and produce a working artifact plus a summary. Runs during the Overnight build task in AUTOMATIONS.md.
---

# Overnight build

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: build one working MVP per night. Pick the top ready spec, write and run real code in the container (Python first, TypeScript second), and produce a working artifact the user can open — plus an honest note on what is and isn't tested. This skill runs during the Overnight build task; it does not schedule anything.

## Algorithm
1. Read Google Sheets "Build Queue"; pick the row with status=ready and the lowest-number priority. If none, finish silently — no build, no message.
2. Set that row status=building. Read knowledge/BUILD_PREFERENCES.md for the default stack, output style, and quality bar.
3. If the build needs a library, API, or pattern you're unsure of, use built-in web search and page reading to check current docs before coding. Never guess an API signature.
4. Write the code to files/scripts/ (Python or TypeScript per preference), keep it the simplest thing that meets the acceptance check, and run it in the container to confirm it works.
5. Produce the artifact — a self-contained index.html, a CSV/data file, or a runnable script. Save it to the Drive build folder and put the link in the row's artifact_link.
6. Test against the spec's acceptance check. Record what passed and what you could not verify — never claim untested code works.
7. Set status=built; append to "Build Log" (columns: build_date, name, outcome, artifact_link, summary, next_step). Store the one-line summary in memory for morning delivery. Do not notify now — it is quiet hours.

## Output
```
Built: Expense splitter (html-app)
Outcome: built | Artifact: drive.../overnight-builds/expense-splitter/index.html
Summary: single-file page; enter total + names + shares -> per-person amounts. Runs offline in a browser.
Tested: 3 people with uneven shares sum back to total (pass). Untested: >20 people, negative inputs.
Next step: ship to GitHub? add a rounding rule?
```

## Edge cases
- Nothing at status=ready -> finish silently; do not wake the user and do not build a random thing.
- Won't pass the acceptance check by end of run -> save the best working partial, set outcome=partial, write exactly what's missing in next_step; never mark a broken build as built.
- Spec needs a paid API key or external service -> set status=blocked, note what's needed, and ask in the morning; never spend or sign up on your own.
- Ambiguous requirement found mid-build -> build the most reasonable MVP reading, note the assumption, and flag it for confirmation rather than stalling.
