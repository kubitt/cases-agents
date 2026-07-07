---
name: ads-audit
description: Full multi-platform PPC audit with 200+ checks and Ads Health Score. Use when the user says "audit", "check my ads", "full audit", "how are my ads doing", or during the weekly scheduled audit task.
---

# Full PPC Audit

Goal: evaluate all connected ad platforms in one pass, produce an Ads Health Score (0-100, A-F), and deliver a prioritized action plan that a marketer can execute this week.

## Algorithm

1. **Collect context.** Read memory for business_type, monthly_spend, primary_goal, active_platforms. If missing — ask before proceeding (benchmarks will be wrong without context).

2. **Gather data per platform.** For each connected platform, pull the last 30 days of data:
   - Google Ads: campaigns, ad groups, keywords, search terms, conversion actions, change history, asset performance.
   - Meta Ads: campaigns, ad sets, ads, pixel events, audience definitions, creative performance, Advantage+ settings.
   - LinkedIn Ads: campaigns, creatives, conversion tracking, audience segments, lead gen forms.
   - TikTok Ads: campaigns, ad groups, ads, pixel/events API setup, creative performance, Smart+ settings.
   If a platform is not connected: check if the user provided CSV/screenshot data in chat. If neither — skip with a note "Platform not analyzed: no data source."

3. **Run checks per platform.** Load knowledge/ADS_CHECKLISTS.md, go to the relevant platform section. Evaluate each check as PASS / WARNING / FAIL based on the data. Record: check_id, status, evidence (the specific data point), recommendation if WARNING or FAIL.

4. **Score.** Per platform, calculate the weighted category score per knowledge/ADS_BENCHMARKS.md scoring methodology:
   - Google: Conversion Tracking 25%, Wasted Spend 20%, Account Structure 15%, Keywords 15%, Ads 15%, Settings 10%.
   - Meta: Tracking & Privacy 25%, Audience & Targeting 20%, Creative Quality 20%, Campaign Structure 15%, Budget & Bidding 10%, Compliance 10%.
   - LinkedIn: Tracking 20%, Targeting & Audiences 25%, Creative & Copy 20%, Campaign Structure 15%, Budget & Bidding 10%, Compliance 10%.
   - TikTok: Tracking & Privacy 20%, Creative Quality 25%, Targeting 20%, Campaign Structure 15%, Budget & Bidding 10%, Compliance 10%.
   Each check in a category: PASS=100, WARNING=50, FAIL=0. Category score = average of its checks × weight. Platform score = sum of weighted categories.
   Aggregate score = weighted average by platform budget share. If budget unknown — equal weights.

5. **Grade.** A: 90-100, B: 75-89, C: 60-74, D: 40-59, F: <40.

6. **Prioritize findings.** Assign priority to each WARNING/FAIL:
   - Critical: revenue/data loss risk (broken tracking, overspending bug, compliance violation). Fix immediately.
   - High: significant performance drag (wasted spend >15%, missing negative keywords, poor audience setup). Fix within 7 days.
   - Medium: optimization opportunity (suboptimal bidding, creative fatigue, missing extensions). Fix within 30 days.
   - Low: best practice gap, minor impact. Backlog.
   Sort all findings by priority, then by estimated dollar impact.

7. **Identify Quick Wins.** Pick the top 3 findings that are High/Critical priority AND can be fixed in <1 hour. These go at the top of the report.

8. **Store results.** Add rows to Google Sheets "PPC Audit History": one per platform + one aggregate. Columns: date, platform ("aggregate" for the summary row), score, grade, category_scores (JSON string), top_issues (top 5 as text), action_items (quick wins), spend_analyzed, wasted_spend_pct.

9. **Deliver report.** Format per IDENTITY response format. If a previous audit exists in the sheet — include trend comparison (score change, new/resolved issues).

## Output

```
# Ads Health Score: 62/100 (Grade C)

## Platform Breakdown
| Platform | Score | Grade | Budget Share | Top Issue |
|---|---|---|---|---|
| Google Ads | 71 | C | 60% | 23% search terms hidden; no negative keyword strategy |
| Meta Ads | 48 | D | 30% | Pixel firing on wrong events; 4 duplicate conversions |
| LinkedIn Ads | 67 | C | 10% | Lead Gen forms not tracking downstream conversion |

## Quick Wins (do this week)
1. [Critical] Fix Meta pixel duplicate conversion actions — currently double-counting, inflating ROAS by ~40%. (1 hour)
2. [High] Add 47 negative keywords from Google search term report — estimated $850/mo wasted spend. (30 min)
3. [High] Pause 3 Meta ad sets in learning limited for >7 days — consolidate budget into performing sets. (15 min)

## Top Findings (by priority)
1. [Critical] Meta: 4 duplicate conversion actions...
2. [High] Google: 23% of spend on irrelevant search terms...
3. [High] Meta: 6 ad sets stuck in learning limited...
4. [Medium] Google: no responsive search ad testing...
5. [Medium] LinkedIn: using manual CPC on lead gen campaigns...

## Trend vs Last Audit
Google: 71 → (first audit) | Meta: 48 → (first audit)
```

## Edge cases
- Platform connected but no campaigns / zero spend in 30 days → score N/A, note "no active campaigns", skip from aggregate.
- Data for <7 days → run the audit but caveat: "Data window is [N] days; some checks (learning phase, trend analysis) may be unreliable. Re-run after 30 days for a full picture."
- User provides CSV/screenshots instead of API → analyze what's available, list which checks were skipped due to missing data, note the gap in the report.
- One platform dominates spend (>80%) → still audit all, but highlight that the dominant platform drives the aggregate score and focus recommendations there.
- Audit finds zero issues (all PASS) → congratulate, suggest advanced optimization areas (incrementality testing, creative testing velocity, attribution modeling), don't manufacture problems.
