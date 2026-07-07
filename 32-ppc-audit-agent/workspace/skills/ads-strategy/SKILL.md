---
name: ads-strategy
description: Strategic ad planning, budget allocation, and A/B test design. Use when the user says "plan", "strategy", "budget allocation", "media plan", "A/B test", "how to split budget", "scale my ads", "plan for Q3", or asks for strategic (not diagnostic) advice.
---

# Ads Strategy & Planning

Goal: produce an actionable strategic plan — budget allocation, platform mix, bidding strategy, scaling roadmap, or A/B test design — grounded in the user's actual performance data and industry benchmarks.

## Algorithm

### For strategic planning / budget allocation:
1. Read memory for business_type, monthly_spend, primary_goal, active_platforms. Load knowledge/ADS_BENCHMARKS.md for industry templates.
2. If recent audit data exists in "PPC Audit History" — use actual per-platform scores and efficiency metrics as the basis. If no audit — recommend running one first, but proceed with user-provided numbers if they insist.
3. Select the industry template from ADS_BENCHMARKS.md (12 types: SaaS, E-commerce, Local Service, B2B Enterprise, Info Products, Mobile App, Real Estate, Healthcare, Finance, Agency, Marketplace Seller, General).
4. Build the plan:
   - Platform mix recommendation with budget % per platform, rationale tied to the user's goal and business type.
   - Bidding strategy per platform: which strategy, why, minimum conversion volume required, what to do if volume is too low.
   - Scaling rules: when to increase budget (CPA stable for 2+ weeks, not in learning phase), by how much (max 20%/week for Google, 15-20% for Meta), when to pull back.
   - Creative requirements: number of variants needed per platform, refresh cadence, format priorities.
   - Timeline: phased roadmap (Week 1-2: foundation, Week 3-4: optimize, Month 2+: scale).
5. Include the financial model: projected CPA/ROAS at the recommended budget, break-even analysis, scenario table (conservative/moderate/aggressive).

### For A/B test design:
1. Clarify what's being tested: creative, landing page, audience, bidding strategy, copy, offer.
2. Calculate required sample size: use the formula from ADS_BENCHMARKS.md (baseline conversion rate, minimum detectable effect, confidence level 95%, power 80%).
3. Estimate duration: daily traffic to the test × sample size needed = days. If >60 days — recommend a larger effect size target or more traffic.
4. Design the test structure: control vs variant, one variable only, platform-specific setup instructions (Google Experiments, Meta A/B test tool, manual split).
5. Define success criteria BEFORE the test starts: primary metric, secondary guardrail metrics, minimum runtime, when to call it (statistical significance reached AND minimum sample).

## Output

### Strategic plan:
```
# Ad Strategy: [Business Type] — $[Budget]/mo

## Recommended Platform Mix
| Platform | Budget | % | Why |
|---|---|---|---|
| Google Ads | $3,000 | 60% | High-intent search captures bottom-funnel demand |
| Meta Ads | $1,500 | 30% | Prospecting + retargeting at scale |
| LinkedIn | $500 | 10% | ABM for enterprise targets only |

## Bidding Strategy
- Google: Target CPA at $45 (current avg $52, benchmark $40). Requires 15+ conv/month — currently at 22, sufficient.
- Meta: Cost cap at $50. Advantage+ campaign budget across 3 ad sets.

## Scaling Roadmap
Week 1-2: [specific actions]...
Week 3-4: [specific actions]...
Month 2+: [criteria for scaling]...

## Financial Model
| Scenario | Monthly Spend | Est. CPA | Est. Conversions | ROAS |
|---|---|---|---|---|
| Conservative | $5,000 | $55 | 91 | 3.2x |
| Moderate | $5,000 | $45 | 111 | 3.9x |
| Aggressive | $7,500 | $42 | 179 | 4.2x |
```

### A/B test:
```
# A/B Test Design: [What's Being Tested]
- Hypothesis: [specific, measurable]
- Sample size needed: [N] per variant ([calculation])
- Estimated duration: [N] days at [traffic]/day
- Success metric: [metric] improves by >[N]% with p<0.05
- Guardrails: [secondary metrics] must not drop by >[N]%
- Setup: [platform-specific instructions]
```

## Edge cases
- Budget too low for recommended platforms → reduce to fewer platforms, explain the tradeoff. Never spread $500/mo across 4 platforms.
- No conversion data yet (new account) → recommend a learning phase plan: start with traffic/engagement optimization, switch to conversion optimization after 50+ conversions.
- User wants to test too many variables → explain why one-variable-at-a-time matters, propose a sequential testing calendar.
- Conflicting goals (e.g., maximize leads AND minimize CPA below market rate) → name the tradeoff explicitly, present scenarios for each priority.
