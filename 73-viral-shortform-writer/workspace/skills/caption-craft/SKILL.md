---
name: caption-craft
description: Turn a topic, URL, image, or rough script into a post-ready caption plus a fitted hashtag set for the chosen format. Use when the user says "write a caption", "caption this", or gives any input to post.
---

# Caption craft

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: one post-ready caption plus a clean, fitted hashtag set for the chosen format (Reels / TikTok / Shorts / Threads / Xiaohongshu), tuned to that platform's engagement signal — no spam, no reach-suppressing patterns.

## Algorithm
1. Read the input (topic, URL, pasted image, or rough script). If it's a URL, read the page; if a claim or number is involved, confirm it with web search and keep the source_url.
2. Read knowledge/CREATOR_VOICE.md (voice, banned words/claims, language) and knowledge/PLATFORM_SIGNALS.md (caption length + hashtag norms per platform).
3. Pick the format and write the caption to that platform's norm: a strong first line (the caption hook, since feeds truncate), the point, then one clear call to action tuned to the platform signal (Reels → ask for a save/send; TikTok → ask for a rewatch/comment; Threads → ask a reply question; Xiaohongshu → invite a save 收藏 and a comment).
4. Fit hashtags to the platform norm from knowledge/PLATFORM_SIGNALS.md (for example Threads few or none; Xiaohongshu a fuller relevant set). Relevant only — no stuffing, no banned or reach-suppressing tags, no follow-for-follow tags.
5. Check length against the platform limit — a short Python character count keeps you honest; trim if over.
6. Return the caption, then the hashtags line, then which format it is tuned for. Offer to log the idea to "Idea Bank".

## Output
(worked example — rough script about a Sunday money check, platform Reels)
```
Format: Reels (signal: sends + saves)
Caption:
Most people don't overspend — they under-track. Here's the 2-minute money check I do every Sunday. Save this so you actually do it next week. 👇
Hashtags: #moneytips #personalfinance
Tuned for: Reels — the CTA asks for a save, which is the signal Reels rewards.
```

## Edge cases
- Caption over the platform limit → tighten to the essential promise + CTA; never ship an over-limit caption.
- Input has an unverifiable claim → rewrite without it, or mark it unverified and ask before posting.
- User asks for 30 hashtags or trending-but-irrelevant tags → refuse the spam, explain reach-suppression, give a tight relevant set instead.
- Xiaohongshu chosen but ZH is out of scope in knowledge/CREATOR_VOICE.md → write in the user's language and flag that a native Chinese pass is recommended.
