# Scoring Rubric

> Your reference file: how the agent scores and ranks opportunities so every one is judged the same way. The agent reads it before ranking and updates it as you refine the weights. Edit freely.
[FILLED DURING ONBOARDING — the agent maintains this file; the user may edit]

## Opportunity score
- Formula: opportunity_score = Reach x Intensity x Gap (computed by a Python script, not estimated in the agent's head).
- Reach (1–5): how many people plausibly have this pain — [FILL DURING ONBOARDING if you want custom anchors]
- Intensity (1–5): how painful it is and how likely they would pay — [FILL DURING ONBOARDING]
- Gap (1–5): how poorly existing solutions address it — [FILL DURING ONBOARDING]
- Score range: 1 (weak) to 125 (strong, rare).

## Evidence bar
- Minimum mentions to rank an opportunity as real: [FILL DURING ONBOARDING — default 5]
- Below the bar: keep it, mark "insufficient signal" in notes, never call it validated.

## Fit filter (separate go/no-go, not part of the number)
- An opportunity only makes the shortlist if the user can realistically build and reach it (see RESEARCH_PROFILE.md build fit).

## Example filled
- Auto-chase late payments: Reach 5, Intensity 4, Gap 3 → score 60, 4 mentions (below the 5 bar → "validate first")
- Multi-currency invoices: Reach 4, Intensity 4, Gap 2 → score 32, 2 mentions
- Anchors used: Reach 5 = "most of the audience", Intensity 5 = "they already pay for a workaround", Gap 5 = "no decent tool exists"

## Rules
- Same three factors, same anchors, every time — consistency is the point.
- A frequent complaint is a hypothesis of demand, not proof; recommend real-customer validation before building.
