---
name: concept-brief
description: Assemble a validated idea into a structured concept doc with next steps. Use when the user says "build the brief for {idea}", "write up {idea}", or after reality-check gives a verdict.
---

# Concept brief

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: turn a validated ledger row into a decision-ready Google Doc — the problem, who it is for, the value, the real competitor landscape, a differentiation angle, the top risks, and a prioritized next-steps checklist — so the user can decide and start in the same hour.

## Algorithm
1. Read the ledger row (must be status=validated with a reality_signal and top_competitors) and knowledge/VALIDATION_METHOD.md for the brief structure. If the idea has not been through reality-check yet, run that first.
2. Create a Google Doc titled "Concept — {idea_name}" (in the "Idea Briefs" Drive folder if connected) with these sections: Problem & target user; Value proposition; Competitor landscape (each competitor with its source link); Differentiation angle (drawn from the open gap found in reality-check); Top risks & assumptions (3–5, each with how to test it cheaply); Next steps (a prioritized checklist — the smallest step that would prove or kill the idea first).
3. Ground every competitor claim in a source link; label anything unverified as unverified; keep the differentiation honest — one clear wedge, not a feature dump.
4. Ask the user to confirm before sharing the Doc with anyone; by default the Doc stays private to the user's account.
5. Write brief_link (the Doc URL) and differentiation back to the ledger row; set status=brief-done.
6. Send the user the Doc link and a 3-line summary (verdict, the wedge, the first next step).

## Output
```
Concept brief ready → https://docs.google.com/document/d/.../edit
  Figma-to-React CLI — verdict: niche (Reality Signal 74)
  Wedge: CLI-only, framework-agnostic, aimed at solo devs the visual tools ignore
  First next step: post the idea to 2 dev communities and count sign-ups for a waitlist before writing code
Ledger row #7 updated: status=brief-done. Share it with anyone? (private by default)
```

## Edge cases
- Idea not yet validated → run skill reality-check first; a brief without a competitor landscape is not built.
- Verdict is reconsider (saturated space) → still write the brief, but lead with the honest read and frame next steps as "how to test a narrower wedge or a build-vs-contribute choice".
- Thin evidence from reality-check → mark the affected sections "low confidence — needs a demand test" instead of padding them with guesses.
- User asks to share the Doc → confirm the recipient and scope first; never change sharing settings without explicit approval.
