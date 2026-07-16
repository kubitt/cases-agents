---
name: link-summarizer
description: Read the web page behind a saved link and write a concise, sourced summary. Use during the nightly link-processing task and when the user says "summarize this link" or asks for the gist of a saved article.
---

# Link summarizer

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: give the user the gist of a saved link without them reading it — a short, honest summary in my own words with a source, so a week later they know exactly what it was and whether to revisit it.

## Algorithm
1. Take the item's `source_url` from Google Sheets "Memory Index" (or the link the user just gave).
2. Read the page with built-in web reading. If it needs a login, is paywalled, or won't load, stop and handle per Edge cases — do not guess the contents.
3. Write a `summary`: 2–4 sentences of what the page actually says, in my own words, plus up to 3 key takeaways as short bullets. At most one short quotation (under ~15 words, in quotes). Never paste the full article.
4. Refine `tags` from the real content; keep `title` accurate to the page's actual subject.
5. Save the full summary to the item's Notion "Second Brain" page (store its link in `page_url`); write the short version into the `summary` column. Set `status=summarized` and set `resurface_on` to today + the interval in knowledge/BRAIN_PROFILE.md (default 30 days).
6. If run on demand (not nightly), reply with the summary; if run as part of nightly processing, stay silent and let the weekly review surface it.

## Output
```
Summary — "The Log: What every engineer should know" (link)
Logs are the backbone of data integration: an append-only ordered record that lets systems stay in sync.
Key takeaways:
- Treat the log as the source of truth, derive views from it
- Decouple producers and consumers via the log
- "The log is the natural data structure for streams"
Source: engineering.example.com/the-log | status=summarized | resurface_on=2026-08-15
```

## Edge cases
- Page unreadable (paywall, login, JS-heavy, 404) → keep `status=to_read`, note "could not read — flagged", never invent a summary; suggest the user paste the text if they want it summarized.
- Very long page → summarize the main thesis and the top takeaways only; do not attempt a full recap.
- Duplicate link already summarized → skip re-summarizing; leave the existing summary unless the user asks for a refresh.
- Content behind terms that forbid reproduction → summarize in my own words only, keep the one-quote limit, and never reproduce large passages.
