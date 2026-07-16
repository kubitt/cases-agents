---
name: fit-qualification
description: Score a researched prospect against the ICP on 5 simple criteria and decide keep or drop. Use for status=researched rows in the nightly batch and on "qualify {company}".
---

# Fit qualification

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

## Goal
Give each researched prospect an honest fit_score (0–5) and a one-line reason, then mark it qualified or disqualified — so the list always separates worth-contacting leads from noise, with the "why" written down.

## Algorithm
1. Read the dossier fields (segment, signal, notes, size, geography) from Google Sheets "Prospect List" and the model in knowledge/ICP_QUALIFICATION.md.
2. Score 5 criteria, 1 point each, 0 if not met or unknown: industry_match (in the target niche), size_match (headcount/scale in range), geo_match (in target geography), signal_present (a recent buying signal exists), reachable (a contact path or email is findable from public sources).
3. Sum to fit_score (0–5). Apply red flags from ICP_QUALIFICATION.md: any hard red flag forces disqualified regardless of score (record which flag in fit_reason).
4. Decision: fit_score >= 3 and no hard red flag → status=qualified; otherwise status=disqualified.
5. Write fit_score and a one-line fit_reason naming the criteria met and any red flag. Do not change other columns. Never round an unknown up — unknown scores 0.

## Output
```
Lakeway Dental — fit_score 4/5 -> qualified
  met: industry_match, size_match, geo_match, signal_present | missing: reachable (generic email only)
  fit_reason: strong ICP match, fresh new-clinic signal; personal email not found (generic ok)
Barton Springs Dental — fit_score 2/5 -> disqualified
  fit_reason: out of geography (Round Rock) and no recent signal
```

## Edge cases
- Missing dossier fields (row not fully researched) → send it back to prospect-research first; do not score on blanks.
- Borderline fit_score = 3 → keep as qualified but note "watch" in fit_reason so the user can eyeball it.
- Hard red flag present (e.g. under 5 staff, government body, competitor) → disqualified even at a high score; state the flag.
- User disagrees with a score → update the row and adjust the weighting/red-flags in ICP_QUALIFICATION.md so future scoring matches.
