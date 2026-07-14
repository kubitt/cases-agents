# Experiment Method

> Your reference file: the rules the agent uses to score, size, and judge tests. The agent reads it before every intake, design, and analysis. Edit freely to tune the program.
[FILLED DURING ONBOARDING — user-tunable; the agent follows the current version]

## ICE rubric (each 1–10; ice_score = Impact x Confidence x Ease)
- Impact: how much the north-star or target metric moves if it works. [FILL DURING ONBOARDING — anchor examples]
- Confidence: how sure you are it will work, given evidence/precedent. [FILL DURING ONBOARDING]
- Ease: how cheap and fast it is to build and run (10 = trivial). [FILL DURING ONBOARDING]

## Significance and power
- Significance threshold: 95% (alpha 0.05) [FILL DURING ONBOARDING if different]
- Power: 80%
- Test: two-sided two-proportion z-test, always run as a Python script; the p-value is always shown.

## Minimum sample rule
- Do not call any test with fewer than [FILL DURING ONBOARDING — default ~1,000] visitors per variant. Below it, verdict is "insufficient data — need more sample".

## Guardrails
- Every test names one guardrail metric that must not regress. [FILL DURING ONBOARDING — default guardrail: the north-star metric]
- A local win that hurts the guardrail is not shipped.

## Prioritization
- Backlog is ranked by ice_score, highest first. Ties broken by Ease (ship the cheaper one first). [FILL DURING ONBOARDING — adjust]

## Example filled
- ICE anchors: Impact 8 = moves paid conversion; Confidence 6 = one prior signal; Ease 8 = a day of work
- Threshold 95%, power 80%, minimum 1,000/variant
- Default MDE for design: +20% relative | Guardrail default: weekly active teams
