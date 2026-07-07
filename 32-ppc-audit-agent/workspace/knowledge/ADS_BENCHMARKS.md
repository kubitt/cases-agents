# PPC Benchmarks & Scoring System
[INDUSTRY-SPECIFIC VALUES REFINED DURING ONBOARDING — defaults below are cross-industry medians from 2025-2026 data]

## User Context
| Parameter | Value |
|---|---|
| Business type | [FILL DURING ONBOARDING] |
| Monthly ad spend | [FILL DURING ONBOARDING] |
| Primary goal | [FILL DURING ONBOARDING] |
| Target CPA | [FILL DURING ONBOARDING — or "use industry default"] |
| Target ROAS | [FILL DURING ONBOARDING — or "use industry default"] |
| Average order value | [FILL DURING ONBOARDING] |
| Sales cycle length | [FILL DURING ONBOARDING — days from click to conversion] |
| Seasonal patterns | [FILL DURING ONBOARDING — e.g., "Q4 peak", "summer slow"] |

## Scoring Methodology

### Ads Health Score (0-100)
Per-platform score = sum of (category_weight × category_score).
Category score = average of its checks, where PASS=100, WARNING=50, FAIL=0.
Aggregate score = sum of (platform_score × platform_budget_share). If budget unknown — equal weights.

### Grading Scale
| Grade | Score | Interpretation | Action |
|---|---|---|---|
| A | 90-100 | Excellent — well-optimized account | Minor tweaks, focus on scaling |
| B | 75-89 | Good — some improvement areas | Targeted optimizations, 2-4 week sprint |
| C | 60-74 | Average — notable issues | Structured improvement plan, monthly review |
| D | 40-59 | Below average — significant problems | Urgent remediation, weekly check-ins |
| F | <40 | Critical — major intervention needed | Stop scaling, fix fundamentals first |

### Priority Levels
| Priority | Criteria | Timeline |
|---|---|---|
| Critical | Revenue/data loss risk: broken tracking, overspend bugs, compliance violations | Fix immediately (today) |
| High | Significant performance drag: wasted spend >15%, missing negatives, poor audience setup | Fix within 7 days |
| Medium | Optimization opportunity: suboptimal bidding, creative fatigue, missing extensions | Fix within 30 days |
| Low | Best practice gap: naming conventions, minor settings, nice-to-have features | Backlog |

## Industry Benchmarks by Platform

### Google Ads — Search
| Metric | SaaS | E-commerce | Local Service | B2B Enterprise | Info Products | Mobile App | Healthcare | Finance | Agency (avg client) |
|---|---|---|---|---|---|---|---|---|---|
| Avg CPC | $2.50-5.00 | $0.80-2.00 | $2.00-6.00 | $3.00-8.00 | $1.50-4.00 | $1.00-3.00 | $3.00-7.00 | $4.00-10.00 | Varies |
| CTR | 3.5-5.5% | 4.0-6.0% | 4.5-7.0% | 2.5-4.0% | 3.0-5.0% | 3.5-5.5% | 3.0-5.0% | 2.5-4.5% | Varies |
| CVR | 3.0-7.0% | 2.5-4.5% | 5.0-10.0% | 2.0-4.0% | 4.0-8.0% | 2.0-5.0% | 3.0-6.0% | 2.0-5.0% | Varies |
| CPA | $40-80 | $20-50 | $25-60 | $80-200 | $20-60 | $30-80 | $50-120 | $60-150 | Varies |
| ROAS target | 3-5x | 4-8x | N/A (lead) | N/A (lead) | 3-6x | 2-4x | N/A (lead) | N/A (lead) | Varies |

### Meta Ads
| Metric | SaaS | E-commerce | Local Service | B2B Enterprise | Info Products | Mobile App | Healthcare | Finance |
|---|---|---|---|---|---|---|---|---|
| Avg CPM | $10-25 | $8-18 | $6-15 | $15-35 | $8-20 | $5-15 | $10-25 | $12-30 |
| CTR | 0.8-1.5% | 1.0-2.0% | 1.2-2.5% | 0.5-1.0% | 1.0-2.0% | 1.5-3.0% | 0.7-1.5% | 0.5-1.2% |
| CVR | 2.0-5.0% | 1.5-4.0% | 3.0-8.0% | 1.0-3.0% | 2.5-6.0% | 1.0-3.0% | 2.0-5.0% | 1.5-4.0% |
| CPA | $30-80 | $15-45 | $15-40 | $60-200 | $15-50 | $5-30 | $40-100 | $50-150 |

### LinkedIn Ads
| Metric | B2B SaaS | B2B Enterprise | Professional Services | Recruiting |
|---|---|---|---|---|
| Avg CPC | $5-12 | $8-15 | $4-10 | $3-8 |
| CTR | 0.4-0.8% | 0.3-0.6% | 0.5-1.0% | 0.5-1.2% |
| CVR (lead form) | 5-15% | 3-10% | 8-20% | 10-25% |
| CPL | $50-150 | $100-300 | $30-100 | $25-80 |

### TikTok Ads
| Metric | E-commerce | Mobile App | Info Products | D2C Brand |
|---|---|---|---|---|
| Avg CPM | $5-12 | $4-10 | $6-14 | $5-12 |
| CTR | 0.8-2.0% | 1.0-3.0% | 0.8-1.8% | 1.0-2.5% |
| CVR | 1.0-3.0% | 2.0-5.0% | 1.5-4.0% | 1.0-3.5% |
| CPA | $10-40 | $3-20 | $10-40 | $15-50 |
| Hook rate (3-sec) benchmark | >35% | >40% | >30% | >35% |

## Industry Strategy Templates

### SaaS
- Primary platforms: Google Ads (Search + PMax) + Meta (retargeting + lookalike).
- Budget split: 60% Google / 30% Meta / 10% LinkedIn (if enterprise).
- Key metrics: trial starts, demo requests, MQL → SQL conversion, LTV:CAC.
- Bidding: Target CPA on Google (need 15+ conv/mo), Cost Cap on Meta.
- Attribution: 30-90 day window, data-driven or position-based.

### E-commerce
- Primary platforms: Google (PMax + Shopping + Search) + Meta (full funnel).
- Budget split: 50% Google / 40% Meta / 10% TikTok (if <35 demo).
- Key metrics: ROAS, AOV, new vs returning customer ratio, MER.
- Bidding: Target ROAS on Google, Cost Cap or Minimum ROAS on Meta.
- Attribution: 7-day click / 1-day view (Meta), data-driven (Google).

### Local Service
- Primary platforms: Google (Search + Local Services Ads) + Meta (local targeting).
- Budget split: 70% Google / 30% Meta.
- Key metrics: calls, form fills, directions, cost per lead, booking rate.
- Bidding: Maximize Conversions with target CPA on Google.
- Attribution: 7-day window typically sufficient.

### B2B Enterprise
- Primary platforms: LinkedIn (ABM + lead gen) + Google (Search for intent) + Meta (retargeting).
- Budget split: 40% LinkedIn / 40% Google / 20% Meta.
- Key metrics: MQL, SQL, pipeline value, CPL, lead-to-opportunity rate.
- Bidding: Manual CPC on LinkedIn (small volumes), Target CPA on Google.
- Attribution: 90-day window, offline conversion import critical.

### Info Products / Courses
- Primary platforms: Meta (full funnel) + Google (Search for intent) + TikTok (awareness).
- Budget split: 50% Meta / 30% Google / 20% TikTok.
- Key metrics: cost per registration, cost per purchase, funnel conversion rates, ROAS.
- Bidding: Cost Cap on Meta, Target CPA on Google.

### Mobile App
- Primary platforms: Google (App campaigns) + Meta (App Install + App Events) + TikTok (App Install).
- Budget split: 40% Google / 35% Meta / 25% TikTok.
- Key metrics: CPI, cost per registration, D7/D30 retention, ARPU, ROAS (D7, D30).
- Bidding: Target CPI on Google, App Event optimization on Meta.

### Real Estate
- Primary platforms: Google (Search) + Meta (local + lookalike).
- Budget split: 60% Google / 40% Meta.
- Key metrics: cost per lead, cost per viewing, lead quality score.
- Special: geographic hyper-targeting, listing feed integration.

### Healthcare
- Primary platforms: Google (Search) + Meta (education + retargeting).
- Budget split: 70% Google / 30% Meta.
- Key metrics: cost per appointment, show rate, patient acquisition cost.
- Special: HIPAA compliance, Special Ad Categories review, restricted targeting.

### Finance
- Primary platforms: Google (Search) + LinkedIn (B2B financial services).
- Budget split: 60% Google / 25% LinkedIn / 15% Meta.
- Key metrics: cost per application, approval rate, cost per funded loan/account.
- Special: Special Ad Categories mandatory, heavy compliance requirements.

### Agency (multi-client)
- Adapt per client using the relevant template above.
- Additional checks: client data isolation, white-label reporting, consistent naming across clients.

### Marketplace Seller (Amazon/Ozon/WB)
- Primary: platform-native ads (Sponsored Products, Brands, Display).
- Key metrics: ACOS, TACOS, organic rank lift, BSR change.
- Budget: start at 10-15% of revenue, scale based on TACOS <15%.

## Budget Sufficiency Rules
| Platform | Minimum effective monthly budget | Rationale |
|---|---|---|
| Google Search | $500 or 15x target CPA | Need 15+ conversions/month for Smart Bidding |
| Google PMax | $1,000 or 30x target CPA | PMax needs more data to optimize |
| Meta | $1,000 or 50x target CPA across ad sets | Each ad set needs 50 conversions/week to exit learning |
| LinkedIn | $1,500 or 30x target CPL | High CPCs require higher minimums |
| TikTok | $500 or 50x target CPA per ad group | Similar to Meta learning requirements |

## Scaling Rules
- Google: increase budget max 20% per week when CPA is stable for 2+ weeks and not in learning phase.
- Meta: increase 15-20% per week. Never double overnight. CBO absorbs better than ad-set budgets.
- LinkedIn: increase 25% per week (smaller volumes, less sensitive).
- TikTok: increase 20% per week. Watch for creative fatigue — scaling often requires new creatives simultaneously.
- Universal: do NOT scale during learning phase. Do NOT scale when tracking is broken. Scale the best-performing campaign first, not the worst.
