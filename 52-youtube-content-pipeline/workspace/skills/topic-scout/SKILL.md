---
name: topic-scout
description: Find and score fresh, on-trend video topics in the channel's niche and log the novel ones to the backlog. Use during the overnight idea scan and when the user says "find me ideas" or "what should I make next?".
---

# Topic scout

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: in one pass, surface 5–10 fresh topic candidates, keep only the ones that are novel and on-brand, score them, and log them to Google Sheets "Idea Backlog" so the best idea is always visible.

## Algorithm
1. Read knowledge/CHANNEL_PROFILE.md for niche, audience, voice, and banned topics; read knowledge/PACKAGE_PLAYBOOK.md for the scoring rubric.
2. Search the open web for recent developments, questions, and trends in the niche (news, forums, community threads, "how to" searches), favoring the last 7 days. Collect the source URL for each candidate.
3. Novelty check: compare each candidate to "Video Catalog" (already published) and "Idea Backlog" (already logged). Mark novelty as novel, covered, or near-duplicate. Drop covered and near-duplicate.
4. Score each surviving candidate 1–10 using the three-factor rubric (fit, trend heat, differentiation). Write a one-line angle: the specific take that fits this channel.
5. Skip anything on the banned-topics list. Append the rest to "Idea Backlog" with status=new, and the columns novelty, score, angle, source_urls filled.
6. Return the new ideas sorted by score for the pitch digest.

## Output
```
Scouted 4 new ideas → Idea Backlog:
  1. "Cline vs Cursor for non-coders" — angle: side-by-side for founders who can't read code — score 9 (novel) — src: theverge.com/...
  2. "Local LLMs on a $500 laptop" — angle: budget setup, no cloud bills — score 8 (novel) — src: reddit.com/r/LocalLLaMA/...
  3. "Prompt folders that scale" — angle: your 'skills' system, explained simply — score 7 (novel) — src: news.ycombinator.com/...
  4. "Voice-to-code demo" — angle: hands-free coding walkthrough — score 6 (novel) — src: youtube.com/...
Dropped: 2 covered (already in Video Catalog), 1 near-duplicate of backlog row #12.
```

## Edge cases
- No fresh topics found → say so, do not pad the list with stale or off-niche ideas; suggest widening the date window or an adjacent sub-niche.
- Candidate touches a banned topic → skip silently, do not log it, do not pitch it.
- Near-duplicate of an existing backlog row → don't add a new row; note the stronger source on the existing row instead.
- Trend looks strong but off-brand for this audience → mark it low fit and low score with a one-line reason, don't inflate the score to fill the digest.
