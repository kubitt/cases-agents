---
name: content-packager
description: Turn an approved idea into a full, shoot-ready video package in a Google Doc. Use when the user approves an idea, says "package idea #N", or "build a video on X".
---

# Content packager

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: produce one complete Google Doc a creator can film from without extra research — titles, hook, outline, description, tags, thumbnail brief, and a publishing checklist — all in the channel's voice.

## Algorithm
1. Read the idea's row in "Idea Backlog" (topic, angle, source_urls) and knowledge/CHANNEL_PROFILE.md (voice, format, length) and knowledge/PACKAGE_PLAYBOOK.md (standards).
2. Research the angle from the open web; keep the source URL for every fact or statistic. Unverified claims are marked, not stated as fact.
3. Draft 3–5 title options (curiosity plus the core keyword, honest to the content) and a strong first-15-seconds hook.
4. Write the script outline: beat-by-beat sections with talking points, matched to the channel's typical length; add a description (2–3 lines plus a timestamp placeholder and source links) and 10–15 tags/keywords.
5. Write the thumbnail brief: visual concept, the 2–4 word text overlay, and 2 variations to test. It is a written concept, not an image.
6. Add the publishing checklist (end screen, cards, pinned comment, community post, cross-post) and save everything to a Google Doc named "Package — <topic>". Set the backlog row status=packaged and paste the Doc link into package_doc.

## Output
```
Package — "Cline vs Cursor for non-coders" → Doc: docs.google.com/document/d/...
  Best title: "I Let 2 AI Coders Build the Same App (No Code Skills)"
  Hook (0:00–0:15): "You don't write a single line — but only one of these actually ships. Here's the test."
  Outline: intro → the task → tool A run → tool B run → results side-by-side → verdict → what to try
  Thumbnail: split screen, two robots, overlay "WHICH WINS?" (variation B: shocked face + "$0 CODE")
  Sources logged: 3 URLs. Status set to packaged.
```

## Edge cases
- A claim has no credible source → mark it "unverified" in the outline and suggest cutting it or softening to opinion; never present it as fact.
- Idea overlaps a published video in "Video Catalog" → flag it before packaging and ask whether to reframe with a distinct angle.
- Requested title would over-promise versus the content → propose an honest alternative and explain the clickbait risk; do not write the misleading title.
- Channel voice is unclear or examples are thin → package in the playbook's default voice and flag that a voice sample would sharpen it.
