---
name: ads-platform-deep-dive
description: Single-platform deep analysis with 60-80 checks. Use when the user says "deep dive Google", "analyze my Meta ads", "check my LinkedIn", "TikTok audit", or names a specific platform for focused analysis.
---

# Platform Deep Dive

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: exhaustive single-platform audit with every applicable check, detailed category breakdowns, and platform-specific recommendations that go deeper than the full audit.

## Algorithm

1. **Identify platform.** From the user's request, determine which platform: Google Ads, Meta Ads, LinkedIn Ads, or TikTok Ads. If ambiguous — ask.

2. **Collect context.** Read memory for business_type, monthly_spend (for this platform), primary_goal. Load knowledge/ADS_BENCHMARKS.md for the relevant industry benchmarks.

3. **Gather platform data.** Pull the last 30 days (minimum) from the connected integration. Request 90 days if available for trend analysis. Key data sets by platform:
   - **Google:** campaigns + ad groups + keywords + search terms + conversion actions + change history + auction insights + asset reports + quality scores + geographic report + device report + ad schedule report.
   - **Meta:** campaigns + ad sets + ads + pixel diagnostics + audience overlap + creative breakdown (placement, age, gender) + frequency data + Advantage+ settings + conversion lift data if available.
   - **LinkedIn:** campaigns + creatives + audience demographics + conversion tracking + lead gen form data + company targeting + engagement metrics.
   - **TikTok:** campaigns + ad groups + ads + pixel/events API diagnostics + creative analytics (hook rate, avg watch time) + audience insights + Smart+ performance + shop ads if applicable.

4. **Run ALL checks.** Load knowledge/ADS_CHECKLISTS.md, go to the platform section. Evaluate EVERY check (not just the top-level ones from the full audit). For each: check_id, status (PASS/WARNING/FAIL), evidence, recommendation, estimated impact where quantifiable.

5. **Category deep dive.** For each scoring category, provide:
   - Category score and contributing checks.
   - The single biggest improvement opportunity in this category.
   - Comparison to industry benchmark (from ADS_BENCHMARKS.md).

6. **Platform-specific analysis.** Beyond the checklist:
   - **Google:** Quality Score distribution histogram, wasted spend by search term cluster, PMax asset group performance, AI Max feature adoption.
   - **Meta:** Creative fatigue analysis (frequency vs CTR decay), Advantage+ audience expansion rate, Andromeda creative diversity check (are there 10+ genuinely distinct creatives?).
   - **LinkedIn:** Audience size vs budget ratio, ABM list match rates, lead quality vs volume tradeoff.
   - **TikTok:** Hook rate analysis (3-second view rate), sound-on compliance check, creative refresh cadence, Shop ads ROAS if applicable.

7. **Build action plan.** Group recommendations into: This Week (critical/high, <2 hours each), This Month (medium, structured projects), and Backlog (low, nice-to-have). Each item: what to do, why, expected impact, effort estimate.

8. **Store in Sheets.** Add a detailed row to "PPC Audit History" with the platform score and full category_scores JSON.

## Output

Full report with:
- Platform Health Score [0-100] and Grade [A-F]
- Category breakdown table (6 categories with scores, weights, and key findings)
- All checks results table (check_id, status, one-line detail) — collapsed by default, expanded on "show all checks"
- Platform-specific insights section (the analysis from step 6)
- Action plan in three tiers (This Week / This Month / Backlog)
- Comparison to previous deep dive if one exists in the sheet

## Edge cases
- Platform connected but user has a different MCC/manager account → ask which account to audit; don't guess.
- Campaign types the agent doesn't recognize (beta features, new campaign subtypes) → note as "unscored campaign type [name]" rather than forcing checks that don't apply.
- Very low spend (<$500/mo) → adjust recommendations: skip advanced features (incrementality, creative testing at scale), focus on fundamentals (tracking, targeting, waste elimination). Note: "At this spend level, focus on these 5 high-impact areas before scaling."
- User asks for a platform that isn't connected → offer alternatives: "Connect [platform] for automated analysis, or paste your data: export the campaign report as CSV, or share screenshots of the dashboard with date range visible."
