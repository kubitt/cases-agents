---
name: prospect-discovery
description: Turn a plain brief ("dental clinics in Austin, 25 companies") into a deduped list of candidate companies in the Sheet. Use on "find {niche} in {location}", on a standing search brief, and to top up the list with new candidates.
---

# Prospect discovery

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

## Goal
From a brief, produce a clean list of real candidate companies that plausibly match the ICP, deduped against what is already in the Sheet — added as status=new for research to pick up. Quality of match beats raw count.

## Algorithm
1. Read the brief: niche, location, and how many. Missing count → default to the nightly batch_size. Read knowledge/ICP_QUALIFICATION.md for the target profile.
2. Use built-in web search: run several angle queries ("{niche} in {location}", "best {niche} {location}", "{niche} companies {location} directory", relevant trade-association or review-site listings). Collect company names + website URLs from the results.
3. Keep only entries that look like a real business site (not aggregators, marketplaces, or job boards). Capture: company, website, and the source URL where you found it.
4. Dedupe against Google Sheets "Prospect List": skip any company or website already present (case-insensitive; ignore www/trailing slash).
5. Append the survivors as new rows: company, website, source, added_date, status=new. Leave contact_name, role, email, segment, fit_score, fit_reason, signal, first_touch empty for later steps.
6. Report how many were found, how many were new vs duplicates, and any queries that returned thin results.

## Output
```
Discovery: "dental clinics in Austin" — target 25
Found 31 candidates, added 22 new (9 already in the list).
Added examples: Lakeway Dental (lakewaydental.com), Barton Springs Dental (bartonspringsdental.com), ...
Thin query: "dental clinics Austin directory" returned mostly aggregators — skipped.
All 22 set to status=new; nightly batch will research and score them.
```

## Edge cases
- Brief too broad ("agencies in the US") → ask for a tighter niche + city, or cap to batch_size and note the list is a sample, not exhaustive.
- Results are mostly directories/aggregators (Yelp, marketplaces) → do not add the aggregator; open its listing only to find real company sites, and log the aggregator as source.
- Duplicate company under a different domain → keep the existing row, add the alternate domain to notes, do not create a second row.
- No credible candidates found → report it honestly and suggest a different location or niche wording; never pad the list with irrelevant names.
