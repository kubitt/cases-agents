# CRO Checklist

> Your reference file: the criteria the agent audits against, the psychology it uses, and how it scores tests. The agent reads it before every audit. Edit freely.
[FILLED DURING ONBOARDING — tune the weights and rubric to your niche]

## Audit criteria (page-audit scores each)
- Value-prop clarity — the core promise is obvious within 5 seconds, above the fold.
- Friction — steps, form fields, and decisions before the goal action are minimized.
- Trust / proof — real social proof, guarantees, and risk-reducers sit near the goal action.
- CTA strength — one clear, specific, action-led call to action; no vague "Submit".
- Message-match — the page continues the promise of the ad or source that sent the visitor.
- Weighting (tune per niche): [FILL DURING ONBOARDING — e.g., trust weighted higher for finance/health]

## Behavioral-psychology principles (guidance, not guarantees)
- Clarity beats persuasion — a confused visitor never converts.
- Cognitive load — every extra field or choice costs conversions.
- Loss aversion — "keep your data / cancel anytime" reduces perceived risk.
- Social proof — real numbers and named cases lower hesitation.
- Specificity — concrete outcomes ("10 minutes") beat adjectives ("fast").
- Anchoring & framing — order and reference points shape how an offer reads.

## ICE scoring rubric (test-planner uses this; the script does the math)
- Impact (1–10): how much this could move the primary metric if it wins.
- Confidence (1–10): how sure we are it will win, given evidence and past rounds.
- Ease (1–10): how cheap and fast it is to build and ship.
- Score = Impact × Confidence × Ease (max 1000), computed by the Python script, never guessed.
- Sample-size rule: no test is a "winner" until it has enough conversions per arm to trust. [FILL DURING ONBOARDING — set your minimum per-arm conversions]

## Example filled
- Weighting: trust +1 (regulated SaaS buyers); message-match matters (paid traffic).
- Minimum per-arm conversions before calling a result: 200.
- House rule: ship the highest-ICE test first; run one test at a time.
