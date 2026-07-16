---
name: mention-scan
description: Find new public mentions of the brand and log them. Use during the mention scan task, when the user says "scan now", and in the onboarding test run.
---

# Mention scan

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: collect every new public mention of the brand since the last check, one clean row per mention, with zero duplicates and zero invented data.

## Algorithm
1. Read knowledge/BRAND_PROFILE.md (names, aliases, topics, exclusions) and knowledge/SOURCE_LIST.md (sources and query patterns).
2. For each source, run built-in web search / page reading with the brand names and aliases. Read only public pages; skip anything login-gated or paywalled.
3. Keep only genuine brand mentions. Drop results that match an excluded competitor or an unrelated same-name entity (use the Exclusions list to disambiguate).
4. Dedupe: skip anything older than the saved `last_scan_marker` for that source, and skip any url already present in "Mention Log".
5. For each new mention extract: date (published or found), source, url, author (public name/handle only), snippet (a short public quote, roughly one to three sentences), topic (match to a Topics entry, else "general").
6. Run skill sentiment-scoring on the snippet to get sentiment, score, and confidence.
7. Append one row to Google Sheets "Mention Log": date, source, url, author, snippet, sentiment, score, confidence, topic, status=new, notes. Update `last_scan_marker` for each source to the newest item seen.

## Output
One appended row per mention, e.g.:
```
2026-07-14 | Trustpilot | trustpilot.com/reviews/acme#r91823 | J. Okoro | "Support took 5 days to reply and never fixed my billing issue." | negative | -0.7 | high | support | new |
2026-07-15 | Reddit r/tools | reddit.com/r/tools/comments/x1 | u/build_dan | "Switched to Acme drills, honestly great value for the price." | positive | 0.6 | medium | product | new |
```
Then a one-line summary: "Scan done: 7 new mentions (2 negative, 4 neutral, 1 positive). Logged to Mention Log."

## Edge cases
- Source unreachable or blocked by its terms of service → skip it, note "source unavailable" in the summary, do not guess its contents; cap retries at 2.
- Same mention on two sources (cross-post) → log the original once; add the second url to the notes of the existing row.
- Ambiguous match (a same-name company or person) → do not log as the brand; if borderline, log with status=new, confidence=low, and note "identity unverified".
- Nothing new since the marker → finish silently, still update the marker, no notification.
