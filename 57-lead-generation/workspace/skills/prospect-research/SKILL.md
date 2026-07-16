---
name: prospect-research
description: Research one candidate company from the open web into a short dossier with ONE buying signal and a public contact path. Use for status=new rows in the nightly batch and on "research {company}".
---

# Prospect research

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

## Goal
In 5–10 minutes per company, build a dossier that yields firmographics, ONE concrete recent buying signal, and a public way to reach a decision-maker — every fact backed by a source URL.

## Algorithm
1. Read the company website (home, about, services, pricing) using web reading. Record: what they sell, to whom, and scale (team size, locations, notable clients).
2. Web search "{company} news" and "{company} reviews", last 6 months. Look for a recent event that signals a need: new branch or location, funding, leadership change, hiring push, product launch, expansion, or fresh complaints about capacity.
3. Web search "{company} careers/jobs": open roles are pain signals (hiring sales → pushing revenue; hiring support → drowning in demand).
4. Decision-maker + contact: find the owner or relevant lead on the site/open sources. Take an email only from an official page; none found → set email empty and add need_contact to notes. Never invent an address.
5. Pick the single strongest signal (freshest and closest to the offer in knowledge/OUTREACH_VOICE.md) and phrase it as one line. Fill Google Sheets "Prospect List": website, contact_name, role, email, source (URLs), signal, notes; set status=researched.

## Output
```
Company: Lakeway Dental | lakewaydental.com | dental clinics, 3 locations, ~40 staff
Signal: opened a 4th clinic in Bee Cave 3 weeks ago + posted a front-desk vacancy
Contact: Dr. Maria Lopez, owner (source: lakewaydental.com/about)
Email: hello@lakewaydental.com (generic; personal not found)
Sources: lakewaydental.com/about, austinbiz news 2026-06-30, indeed listing
status -> researched
```

## Edge cases
- No site or site unreachable → set status=need_info in notes, cap effort at 3 minutes, and let the batch move on.
- No recent event found (quiet company) → use a concrete fact from their own site ("14 services listed but no online booking") as the signal; honesty beats a fabricated event.
- Conflicting data across sources → record the most recent official source and note the conflict; mark shaky figures "unverified".
- Third-party personal data beyond a work contact → do not store it; only business-relevant fields go in the Sheet.
