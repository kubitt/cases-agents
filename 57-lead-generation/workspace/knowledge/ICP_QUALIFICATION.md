# ICP & Qualification Model

> Your reference file. The agent reads it before discovering, researching, and scoring prospects, and updates it as it learns from your edits. Edit freely.
[FILLED DURING ONBOARDING — the agent maintains this file; the user may edit]

## Offer (one line, mirrors OUTREACH_VOICE.md)
- What we sell: [FILL DURING ONBOARDING]
- Main customer benefit, with a number if possible: [FILL DURING ONBOARDING]

## Ideal customer profile
- Niche: [FILL DURING ONBOARDING]
- Company size: [FILL DURING ONBOARDING]
- Geography: [FILL DURING ONBOARDING]
- Decision-maker role: [FILL DURING ONBOARDING]

## Scoring model (5 criteria, 1 point each — fit_score 0–5)
- industry_match — the company is in the target niche
- size_match — headcount / scale is within the target range
- geo_match — located in the target geography
- signal_present — a recent buying signal or event exists (see list below)
- reachable — a contact path or email is findable from public pages
Decision: fit_score >= 3 and no hard red flag → qualified; otherwise disqualified. Unknown = 0, never rounded up.

## Buying signals we value (strongest first)
1. New location / new branch / market expansion
2. Hiring (sales = growth push; support/ops = capacity strain)
3. Funding, acquisition, or leadership change
4. Product/service launch or a visible site redesign without a key feature (e.g. no online booking)
5. Fresh public complaints about capacity or responsiveness
[the agent appends signals that actually correlate with qualified leads]

## Hard red flags (force disqualified)
- [FILL DURING ONBOARDING — e.g. under 5 staff, government body, direct competitor, franchise with central procurement]

## Worked example
- Company: Lakeway Dental | industry_match yes, size_match yes (3 clinics/~40 staff), geo_match yes (Austin), signal_present yes (new Bee Cave clinic), reachable partial (generic email only) → fit_score 4/5 → qualified.
- Company: Solo Smiles | 1 dentist, no recent signal, out of target city → fit_score 1/5 → disqualified (size + geo).
