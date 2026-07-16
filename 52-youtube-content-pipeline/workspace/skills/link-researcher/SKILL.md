---
name: link-researcher
description: Turn a link the user shares into a researched, scored backlog idea. Use when the user pastes a URL in chat or drops one in the Slack intake channel.
---

# Link researcher

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: take a single link, understand what makes it interesting for this channel, and log it as a novelty-checked, scored idea in "Idea Backlog" — with enough of an angle that packaging can start.

## Algorithm
1. Read the linked page (title, main points, why it is notable). If the page cannot be read, record the URL and ask the user for one line of context.
2. Read knowledge/CHANNEL_PROFILE.md for niche and audience, and knowledge/PACKAGE_PLAYBOOK.md for the scoring rubric.
3. Research the topic briefly on the open web for supporting or contradicting sources; collect 1–3 source URLs. Note the freshest angle.
4. Novelty check against "Video Catalog" and "Idea Backlog"; mark novel, covered, or near-duplicate. Covered or near-duplicate → point to the existing row instead of adding one.
5. Score the idea 1–10 with the three-factor rubric and write a one-line angle framed for this channel's audience.
6. Append to "Idea Backlog" (status=new; novelty, score, angle, source_urls filled). If the user asks, hand off to content-packager for a starter outline.

## Output
```
Logged from link → Idea Backlog:
  Source: anthropic.com/news/skills
  Topic: "Reusable AI 'skills' explained for non-coders"
  Angle: show how to save repeatable prompts as skills, no code
  Novelty: novel | Score: 8 (high fit, timely)
  Extra sources: 2 URLs. Say "package it" for a full Doc.
```

## Edge cases
- Link is paywalled or unreadable → save the URL, ask for a one-line summary, and do not fabricate the contents.
- Link is off-niche → log it with a low fit score and a one-line reason, or ask whether to skip; don't force it on-brand.
- Topic already in "Video Catalog" or "Idea Backlog" → don't create a duplicate row; reply with the existing row and any new source.
- Link is to another creator's video → treat it as inspiration and analysis only; the resulting idea must be an original take, never a re-upload or copy.
