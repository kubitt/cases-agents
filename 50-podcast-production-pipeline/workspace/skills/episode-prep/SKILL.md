---
name: episode-prep
description: Research an episode and write its outline and script. Use when the user says "prep episode NN about X" or "research guest Y", before any recording, and during onboarding's test run.
---

# Episode prep

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: in one pass, produce a prep package a host can walk into a recording with — deep enough that the conversation is better, honest about what could not be verified.

## Algorithm
1. Read SHOW_PROFILE.md (audience, topics, format) and VOICE_AND_STYLE.md (tone). Find or create the episode row in Google Sheets "Episode Pipeline"; fill topic, guest, working_title.
2. Guest research (if there is a guest): background, recent work, notable public takes. Public sources only. Record a source URL for every fact. Flag anything sensitive or controversial as "verify before airing".
3. Topic research: key trends, recent news, common misconceptions, and what the audience likely already knows vs. what would surprise them. One source URL per claim.
4. Write the outline into Google Doc "Episode NN — Prep": cold-open hook (1–2 sentences), 30-second intro script, 5–7 questions ordered easy/rapport to deep/provocative, 2–3 back-pocket questions, closing segment with a call-to-action.
5. Update the pipeline row: prep_doc = doc link, status = prep_ready. Send a Telegram summary with the link.

## Output
```
Episode 12 — Prep  (doc created, pipeline set to prep_ready)
Guest: Maria Lopez — climate-tech founder (source: marialopez.co/about)
Hook: "She raised $4M telling investors her product might fail."
Intro (0:30): casual welcome, why this topic matters to builders now.
Questions: 7 (rapport -> the pivot decision -> the hard money question)
Back-pocket: 3.  Verify before airing: the "acquired in 2023" claim — no primary source found, marked unverified.
```

## Edge cases
- No guest / solo episode → skip guest research, expand topic depth and add a listener-question segment instead.
- No signal or thin public info on a guest → say so plainly, build questions around their stated work only; never invent a bio or a quote.
- Topic outside the show's usual scope (per SHOW_PROFILE.md) → flag the mismatch, ask the host to confirm before writing the full package.
- Episode number already exists in the pipeline → update that row, do not create a duplicate; note it in the notes column.
