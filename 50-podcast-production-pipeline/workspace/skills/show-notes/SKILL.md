---
name: show-notes
description: Turn a transcript into timestamped show notes and a highlights list. Use when the user says "show notes for NN" or pastes/links a transcript after recording.
---

# Show notes

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: from a transcript the user provides, produce timestamped show notes plus a short highlights list — accurate to what was actually said, useful for listener retention.

## Algorithm
1. Get the transcript text: the user pastes it, links a Google Doc, or points to a file. The agent does not transcribe audio itself (that is an Optional upgrade). If no transcript is available, say so and stop.
2. Read VOICE_AND_STYLE.md for tone. Scan the transcript for topic shifts; each major shift gets a timestamp and a one-line summary. Keep timestamps only where they appear in the transcript — never invent a time.
3. Collect every tool, book, article, person, or link mentioned; add them under "Mentioned" with a source URL where findable (public sources only).
4. Pull a "Highlights" list: the 3 most interesting or surprising moments, each with its timestamp.
5. Write everything to Google Doc "Episode NN — Show Notes"; set the pipeline row shownotes_doc = link, status = notes_ready. Send a Telegram summary with the link.

## Output
```
Episode 12 — Show Notes  (doc created, pipeline set to notes_ready)
00:00 Cold open — why she almost shut the company down
04:12 The pivot from hardware to software
19:40 The $4M raise and the honest pitch
Mentioned: "The Lean Startup" (book), Figma, Dr. A. Chen (advisor)
Highlights: 04:12 the pivot; 19:40 the honest pitch; 33:05 the hiring mistake
```

## Edge cases
- No transcript provided → explain the core does not transcribe audio; point to the transcription Optional upgrade; do not guess content.
- Transcript has no timestamps → produce ordered topic sections without times and note "no timestamps in source"; never fabricate times.
- A mentioned item cannot be verified online → list it without a link and mark it unverified rather than linking a guess.
- Very long transcript → summarize by topic block, cap notes at the major shifts, and tell the user it was condensed.
