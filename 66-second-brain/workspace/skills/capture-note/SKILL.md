---
name: capture-note
description: Capture anything the user wants to remember into the Memory Index and Second Brain store. Use when the user says "save this", "remember", "note that", pastes a link, or sends a thought, book, quote, person, or task.
---

# Capture note

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: turn whatever the user sends into a clean, findable item in one move — classified, tagged, titled, and stored — with the capture confirmed in a single line. Capture must feel effortless.

## Algorithm
1. Read the incoming message. Read knowledge/BRAIN_PROFILE.md for the user's capture types and tag taxonomy, and knowledge/INDEX_SCHEMA.md for column meanings and allowed values.
2. Decide the `type`: note / link / idea / book / quote / person / task. If the message contains a URL, `type=link`; if it is a to-do, `type=task`; otherwise pick the closest.
3. Write a short `title` (max ~8 words). Preserve the user's original wording verbatim as the note body — never rewrite it.
4. Assign 1–3 `tags` from the taxonomy; if nothing fits, propose a new tag rather than force-fitting.
5. Set `status`: `new` for a link (so nightly processing will summarize it), `to_read` if the user says they'll read it later, and `summarized` for any non-link once its body is stored (nothing more to process).
6. Append a row to Google Sheets "Memory Index" (date, type, title, source_url, tags, status, summary, resurface_on, page_url). Create a Notion "Second Brain" page with the full content and put its link in `page_url`. For pure notes, write a one-line gist into `summary`.
7. Confirm in one line. Do not summarize a link now — the nightly task does that; just store it as status=new.

## Output
```
Saved: "Book — Designing Data-Intensive Applications" (book) — tags: engineering, reading
Index row added; Notion page created. It'll surface in your next weekly review.
```

## Edge cases
- Near-duplicate already in the index (same URL or near-identical title) → point to the existing row, update its tags if needed, do not create a second entry.
- Message bundles several items (e.g. three links in one text) → create one row per item, confirm the count.
- Ambiguous type or no fitting tag → make a best guess, mark it, and offer the user a one-word correction rather than guessing silently.
- Sensitive personal content (health, finances, private people) → store it only in the user's own index/store, never in agent memory or examples.
