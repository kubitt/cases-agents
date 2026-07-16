# Analysis Method

> Your reference file: how the agent classifies and scores posts. Change the definitions or thresholds and the agent will follow the new version. Edit freely.
[FILLED DURING ONBOARDING — the agent maintains this file; the user may edit]

## Scoring
- engagement_rate: [FILL DURING ONBOARDING — default (likes + reposts + replies) / impressions x 100]
- "high engagement": [FILL DURING ONBOARDING — default: top 20% of your own posts by engagement_rate]
- Minimum sample: [FILL DURING ONBOARDING — default: a topic/format/hook group needs 5+ posts to be ranked; below that = insufficient data]
- Central value: use the median, not the mean, so one viral post does not fake a pattern.

## Format labels
- single / thread / image / video / poll / quote (a thread = post with linked follow-ups)

## Hook labels (from the opening line)
- question — opens by asking the reader something
- bold-claim — opens with a strong assertion
- story — opens with a personal narrative
- list — "N things that..."
- how-to — teaches a concrete method
- contrarian — argues against common belief
- news — reacts to a recent event
- other — fits none of the above

## Honesty rules (never skip)
- Verified vs unverified: numbers from the user's own analytics export are verified; anything read from public pages or estimated is unverified. Analyze the two separately.
- Never invent a missing metric — leave it blank and write "data not provided".
- Correlation is not causation: every pattern linked to a result is a hypothesis until proven, and labeled so.

## Example filled
- engagement_rate = (likes + reposts + replies) / impressions x 100
- high engagement = top 20% of own posts | minimum sample = 5 posts | central value = median
- Sample read: how-to threads median 5.9%, question hooks 4.1%, image-only 1.8% — how-to threads flagged [fact], build-in-public pillar (4 posts) flagged insufficient data.
