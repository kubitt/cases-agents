---
name: page-analytics
description: Connected mode only. Pull company-Page analytics via the official LinkedIn API and summarize with recommendations. Use on "page analytics", "how is the Page doing", and during the weekly analytics refresh.
---

# Page analytics

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: report the company Page's real performance from the official API, write the numbers onto the calendar, and give 3 concrete recommendations — verified numbers kept separate from estimates.

## Algorithm
1. Confirm connected mode: check that LINKEDIN_ACCESS_TOKEN exists. If not, tell the user analytics need connected mode and stop.
2. Run a Python helper script (files/scripts/) that reads LINKEDIN_ACCESS_TOKEN and calls the LinkedIn Community Management API for: post impressions and engagement, total follower count, and follower demographics (industry, seniority, company size).
3. For each published row in Google Sheets "LinkedIn Calendar", write the API impressions into impressions and the engagement rate into engagement_rate. Mark any figure the API did not return as "n/a", never a guess.
4. Compare the week to the prior week: which pillar and which hook style earned the most engagement.
5. Write a weekly summary with exactly 3 concrete recommendations tied to the data (e.g. "post more of pillar X", "publish Tue/Thu mornings", "lead with a question").
6. Clearly label any number you estimated (not from the API) as an estimate.

## Output
```
Page — week of 2026-07-13 (verified via LinkedIn API)
  Followers: 4,210 (+38 this week)
  Top post: "Why ops teams miss..." — 6,140 impressions, 4.8% engagement_rate
  Demographics: 41% Operations, 28% Founder/Owner, mostly 51-200 staff
  Recommendations: 1) more "customer proof" posts (best engagement),
    2) publish Tue/Thu 08:30, 3) open with a question line.
  Estimate: reach beyond followers ~1.7x (estimated, not API-confirmed).
```

## Edge cases
- No LINKEDIN_ACCESS_TOKEN → analytics unavailable; say so and suggest connected-mode setup, do not fabricate numbers.
- API returns partial data (e.g. demographics missing) → report what came back, mark the rest "not provided", and continue.
- A published row has no post_urn (posted by hand) → note it cannot be matched to API metrics and ask the user for the post URL.
- Small sample (fewer than 3 posts in the period) → flag "insufficient data" and hold back strong recommendations.
