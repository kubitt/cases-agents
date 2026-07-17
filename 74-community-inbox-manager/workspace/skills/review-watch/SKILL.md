---
name: review-watch
description: Scan the public review pages the user listed, log new reviews, and draft replies for negative ones. Use during the inbox and review poll, when the user says "check reviews", and in the onboarding test run.
---

# Review watch

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: catch every new public review of the business, log it as one clean row, and have a calm draft reply ready for anything negative before it sits unanswered.

## Algorithm
1. Read knowledge/CHANNEL_SOURCES.md for the list of public review-page URLs to watch (Google Business Profile page, Yelp, marketplace review pages) and knowledge/BRAND_REPLY_VOICE.md for tone and refund/complaint lines.
2. For each review URL, use built-in web page reading to load the page and find reviews newer than the saved poll marker for that page. Read public pages only.
3. Dedupe by url: skip any review whose url or stable id is already in "Inbox Queue". Each review gets its own row.
4. For each new review extract: date, author (public name shown), message (the review text, trimmed), and the star rating if the page shows one. Set channel=review.
5. Score sentiment (negative, neutral, or positive) and set priority: high for any negative or low rating (roughly 1–2 stars), medium for a mixed 3-star, low for clear praise. Intent is complaint for negatives, praise for positives, question if the review asks something.
6. For every negative or low-rated review, draft a calm, policy-based reply in the brand voice right away (never defensive, never argumentative) and set status=drafted. A positive review gets a short thank-you draft, or stays status=new if a thank-you is optional per the voice file.
7. Append one row per review to Google Sheets "Inbox Queue": date, channel, author, message, intent, priority, sentiment, reply_draft, status, notes. Update the poll marker for each page.

## Output
One appended row per review, e.g.:
```
2026-07-14 | review | R. Alvarez | "Waited 40 minutes past my booking and no apology. 2 stars." | complaint | high | negative | "Hi Rafael — I'm sorry about the wait; that isn't the standard we hold. I'd like to make it right — could you send your booking date so we can follow up?" | drafted | Google Business Profile, 2/5
2026-07-14 | review | Priya S. | "Best pastel de nata in town, staff were lovely." | praise | low | positive | "Thank you, Priya — we're so glad you enjoyed it. See you next time." | drafted | Yelp, 5/5
```
Then a one-line summary: "Review scan: 3 new reviews (1 negative, 2 positive). Negative draft ready in Inbox Queue."

## Edge cases
- Review page unreachable, changed layout, or blocked by its terms of service → skip it, note "source unavailable" in the summary, cap retries at 2, never invent a review.
- Same review appears on two pages, or the author edited it → log it once by url; add the second url or the edit to the existing row's notes.
- No rating shown on the page → judge priority from the text sentiment alone and note "no star rating".
- Native mode cannot post the reply back to the review site → the draft waits in the queue for you to paste, unless a Google Business Profile token is added later.
