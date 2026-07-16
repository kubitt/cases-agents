---
name: preference-tuning
description: Turn the user's daily feedback on the digest into durable preference rules. Use on "liked it", "too many memes", "more how-tos", or any reaction to a digest.
---

# Preference tuning

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: convert casual feedback into clear, durable rules in knowledge/DIGEST_PREFERENCES.md so tomorrow's digest is sharper than today's.

## Algorithm
1. Read the user's feedback and the digest it refers to (today's rows in "Reddit Digest Log").
2. Translate it into one or two concrete rules: an include, an exclude, a category weight, a length change, or a subreddit tweak. Example: "too many memes" -> exclude category=meme.
3. Read knowledge/DIGEST_PREFERENCES.md; if the new rule conflicts with an existing one, confirm with the user which wins — do not silently overwrite.
4. Write the updated rules back to knowledge/DIGEST_PREFERENCES.md, dated, so the change is visible.
5. Record the feedback in the feedback column of today's "Reddit Digest Log" rows.
6. Confirm the change in one line and note it applies from the next digest.

## Output (confirmation)
```
Preferences updated (2026-07-16):
+ exclude category = meme
+ prefer categories: how-to, discussion (ranked higher)
+ drop posts older than 24h from r/news
Applies from tomorrow's digest. Say "show my rules" anytime to review.
```

## Edge cases
- Vague feedback ("meh today") → ask one specific question (which posts missed?) rather than guessing a rule.
- Contradicts an existing rule → surface the conflict and let the user pick; never overwrite a stated rule silently.
- One-off reaction vs a standing rule → confirm whether to make it permanent before writing it to the file.
- Feedback about a subreddit not on the list → offer to add or remove it in SUBREDDIT_LIST.md instead of forcing it into preferences.
