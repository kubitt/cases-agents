# PPC Audit Checklists
All platform checks used by skills ads-audit and ads-platform-deep-dive. Each check has an ID, category, what to evaluate, and PASS/WARNING/FAIL criteria.

## Google Ads (80 checks)

### Conversion Tracking (weight: 25%)

| ID | Check | PASS | WARNING | FAIL |
|---|---|---|---|---|
| G01 | Global site tag (gtag.js) installed | Tag fires on all pages | Tag on >80% pages | Missing or broken |
| G02 | Enhanced Conversions enabled | Active with valid config | Partially configured | Not enabled |
| G03 | Consent Mode V2 implemented | Advanced mode active | Basic mode only | Not implemented |
| G04 | Conversion actions match business goals | All actions aligned to real value | Some actions misaligned | Tracking vanity metrics only |
| G05 | No duplicate conversion actions | Zero duplicates | 1 duplicate | 2+ duplicates |
| G06 | Conversion window appropriate | Matches sales cycle | Default unchanged but reasonable | Mismatched (7-day for long cycle) |
| G07 | Attribution model | Data-driven or position-based | Time decay / linear | Last click only |
| G08 | Conversion value tracking | Dynamic values set | Static values | No values |
| G09 | Phone call tracking | Forwarding numbers + call import | Clicks-to-call only | No call tracking for call business |
| G10 | Offline conversion import | Active with <48h lag | Set up but stale | Not set up (B2B/long cycle) |
| G11 | Cross-device tracking | Active | Partial | Disabled |
| G12 | Server-side tagging (sGTM) | Live and deduped | In progress | Not considered (>$10k/mo spend) |

### Wasted Spend (weight: 20%)

| ID | Check | PASS | WARNING | FAIL |
|---|---|---|---|---|
| G13 | Search term relevance | >85% relevant | 70-85% relevant | <70% relevant |
| G14 | Negative keyword lists | Comprehensive, shared lists | Basic negatives | No negatives or very few |
| G15 | Broad match + Smart Bidding | Broad only with Smart Bidding | Broad with manual bidding | Broad with no bidding strategy |
| G16 | Placement audits (Display/YouTube) | Quarterly review, exclusions active | Some exclusions | Never reviewed |
| G17 | Geographic targeting precision | Presence-only targeting | Presence or interest | Interest-only in local business |
| G18 | Wasted spend % of total | <5% | 5-15% | >15% |
| G19 | Search partners performance | Evaluated, disabled if poor | Enabled unreviewed | Spending >20% with poor metrics |
| G20 | Display network in Search campaigns | Off or performing | Minor bleed | Significant unmonitored spend |
| G21 | Ad schedule alignment | Schedule matches conversion data | Default (all hours) | Active during zero-conversion hours |
| G22 | Device bid adjustments | Set based on performance | Default (no adjustments) | Opposite of performance data |
| G23 | Audience exclusions | Past converters excluded from prospecting | Some exclusions | No exclusions |
| G24 | Budget vs actual spend gap | <5% gap | 5-15% gap | >15% overspend or underspend |

### Account Structure (weight: 15%)

| ID | Check | PASS | WARNING | FAIL |
|---|---|---|---|---|
| G25 | Campaign naming convention | Consistent, descriptive | Partially consistent | No convention / default names |
| G26 | Ad group theme tightness | Single theme per group | 2-3 themes | Kitchen-sink groups |
| G27 | RSA ad count per group | 1-3 active RSAs | 0 RSAs (ETA only) | >5 RSAs competing |
| G28 | Campaign type separation | Search, PMax, Display, Video separated | Some mixing | All in one |
| G29 | PMax asset groups | Themed groups with unique assets | 1-2 generic groups | Single default group |
| G30 | PMax audience signals | Custom segments + lists added | Generic signals | No signals set |
| G31 | PMax brand exclusions | Brand terms excluded (if Search brand exists) | Not set but low brand cannibalization | Brand cannibalizing Search |
| G32 | PMax search themes | Set and relevant | Not used | Irrelevant themes active |
| G33 | Campaign budget distribution | Aligned with performance/goals | Mostly aligned | Top performer underfunded |
| G34 | Shared budgets usage | Not used or used intentionally | Shared budget masking issues | Campaigns competing in shared budget |

### Keywords (weight: 15%)

| ID | Check | PASS | WARNING | FAIL |
|---|---|---|---|---|
| G35 | Match type strategy | Intentional mix, documented | Default broad everywhere | Random mix, no strategy |
| G36 | Quality Score distribution | >60% QS ≥7 | 40-60% QS ≥7 | <40% QS ≥7 |
| G37 | Low QS keywords (<4) action | Paused or being improved | Identified but no action | Running unmonitored |
| G38 | Keyword cannibalization | No duplicate keywords across groups | Minor overlaps | Same keywords in multiple groups |
| G39 | Single keyword ad groups (SKAGs) | Used appropriately or not needed | Legacy SKAGs unconsolidated | SKAGs with Smart Bidding (conflict) |
| G40 | Long-tail coverage | Present for the niche | Mostly head terms | Only 1-2 word keywords |
| G41 | Keyword to landing page alignment | Keywords map to relevant pages | Some mismatches | Generic homepage for all |
| G42 | Negative keyword conflicts | No conflicts found | Minor conflicts | Negatives blocking converting terms |

### Ads (weight: 15%)

| ID | Check | PASS | WARNING | FAIL |
|---|---|---|---|---|
| G43 | RSA ad strength | Good or Excellent | Average | Poor or no RSAs |
| G44 | Headline variety | 10+ unique headlines per RSA | 5-9 unique | <5 or repetitive |
| G45 | Description variety | 3-4 unique descriptions | 2 descriptions | 1 or repetitive |
| G46 | Pin usage | Strategic pinning or none | Over-pinned (limits combinations) | Pinned everything |
| G47 | Sitelink extensions | 4+ relevant sitelinks | 2-3 sitelinks | None |
| G48 | Callout extensions | 4+ callouts | 2-3 callouts | None |
| G49 | Structured snippets | Present and relevant | Present but generic | None |
| G50 | Image extensions | Present in eligible campaigns | Not present | N/A for some types |
| G51 | Call extensions | Present (if phone business) | Missing for phone business | N/A |
| G52 | Ad copy compliance | No policy warnings | Minor warnings | Disapproved ads running |
| G53 | Landing page experience | Fast, relevant, mobile-friendly | Some issues | Slow, broken, or irrelevant |
| G54 | Ad testing cadence | New variants every 4-6 weeks | Stale (>8 weeks same ads) | Same ads for 3+ months |

### Settings (weight: 10%)

| ID | Check | PASS | WARNING | FAIL |
|---|---|---|---|---|
| G55 | Bidding strategy alignment | Strategy matches goal and volume | Reasonable but suboptimal | Manual CPC with enough volume for Smart |
| G56 | Target CPA/ROAS values | Set based on actual performance | Default or arbitrary | Unrealistic targets |
| G57 | Budget sufficiency | Budget allows 15+ conversions/month | 5-15 conversions | <5 conversions (can't learn) |
| G58 | Location targeting settings | "Presence" selected | "Presence or interest" for local | Default unchanged for local |
| G59 | Language targeting | Matches audience | Overly broad | Wrong language |
| G60 | IP exclusions | Competitors/internal excluded | Some exclusions | None for B2B |
| G61 | Auto-apply recommendations | Reviewed and curated | All auto-applied | Conflicting auto-applies active |
| G62 | AI Max for Search enabled | Evaluated and decision documented | Not evaluated | Enabled without monitoring |
| G63 | AI Max brand exclusions | Set if brand campaigns exist | Not set | Brand terms leaking |
| G64 | AI Max negative keyword discipline | Negatives from Search applied | Partial coverage | No negatives in AI Max |

---

## Meta Ads (50 checks)

### Tracking & Privacy (weight: 25%)

| ID | Check | PASS | WARNING | FAIL |
|---|---|---|---|---|
| M01 | Meta Pixel installed | Active, all events firing | Partial events | Missing or broken |
| M02 | Conversions API (CAPI) | Active, deduped with pixel | Configured but not deduped | Not set up (>$5k/mo spend) |
| M03 | Event Match Quality (EMQ) | >6 for key events | 4-6 | <4 |
| M04 | Aggregated Event Measurement (AEM) | Configured, 8 events prioritized | Partially set up | Not configured |
| M05 | Domain verification | Verified | Pending | Not started |
| M06 | Duplicate conversion events | Zero | 1 duplicate | 2+ duplicates |
| M07 | Custom conversion values | Dynamic values for purchase | Static values | No values |
| M08 | iOS 14.5+ configuration | Prompt implemented, events prioritized | Partial setup | Not addressed |
| M09 | UTM parameter consistency | Consistent naming, GA4 aligned | Inconsistent | No UTMs |
| M10 | Offline conversion import | Active (if applicable) | Set up but stale | Not set up (for offline business) |

### Audience & Targeting (weight: 20%)

| ID | Check | PASS | WARNING | FAIL |
|---|---|---|---|---|
| M11 | Audience overlap | <20% overlap between ad sets | 20-35% overlap | >35% overlap (self-competition) |
| M12 | Lookalike quality | Based on purchasers/high-value | Based on all visitors | Low-quality seed (<1000) |
| M13 | Custom audience freshness | Updated within 30 days | 30-90 days | >90 days stale |
| M14 | Advantage+ audience expansion | Intentional: on/off with rationale | Default enabled, unreviewed | Expansion undermining targeting |
| M15 | Retargeting windows | Aligned with sales cycle | Default 30 days unchanged | Too long or too short |
| M16 | Exclusions | Purchasers excluded from prospecting | Partial exclusions | No exclusions |
| M17 | Geographic targeting | Relevant to business | Overly broad | Wrong regions |
| M18 | Age/gender targeting | Data-informed or broad | Arbitrary restrictions | Excluding converting demographics |

### Creative Quality (weight: 20%)

| ID | Check | PASS | WARNING | FAIL |
|---|---|---|---|---|
| M19 | Creative diversity | 10+ genuinely distinct creatives | 5-9 creatives | <5 creatives (Andromeda penalty) |
| M20 | Format variety | Static + video + carousel | 2 formats | Single format only |
| M21 | Placement optimization | Assets sized for Feed + Stories + Reels | Most placements covered | One size for all |
| M22 | Creative refresh cadence | New creatives every 2-4 weeks | Every 4-8 weeks | Same creatives >8 weeks |
| M23 | Video quality | Hook in first 3 seconds, sound-on | Average quality | Poor quality / no hook |
| M24 | Ad copy testing | Multiple primary text variants | 1-2 variants | Single copy everywhere |
| M25 | CTA button alignment | CTA matches objective | Generic CTA | Misleading CTA |
| M26 | Creative fatigue detection | Monitored, fatigued ads rotated | Some monitoring | No monitoring (rising frequency + falling CTR) |
| M27 | UGC / social proof | Present in creative mix | Not present but appropriate | N/A |
| M28 | Text-to-image ratio | <20% text on images | 20-30% text | >30% text (delivery penalty) |

### Campaign Structure (weight: 15%)

| ID | Check | PASS | WARNING | FAIL |
|---|---|---|---|---|
| M29 | Campaign budget optimization (CBO) | Intentional on/off per campaign | All CBO or all ad-set budget | Mix without rationale |
| M30 | Ad set count per campaign | 3-5 ad sets with distinct audiences | 1-2 or >7 | Single ad set or >10 competing |
| M31 | Advantage+ Shopping campaigns | Evaluated for e-commerce | Not evaluated | Running poorly unmonitored |
| M32 | Learning phase management | Ad sets exit learning <7 days | Some stuck in learning | >50% ad sets in "learning limited" |
| M33 | Campaign naming convention | Consistent, descriptive | Partial | No convention |
| M34 | Funnel separation | Prospecting, retargeting, retention separated | Partial separation | All mixed |

### Budget & Bidding (weight: 10%)

| ID | Check | PASS | WARNING | FAIL |
|---|---|---|---|---|
| M35 | Budget ≥5x CPA per ad set | All ad sets sufficient | Some below threshold | Most below (can't exit learning) |
| M36 | Bid strategy alignment | Cost cap or bid cap set appropriately | Lowest cost (acceptable for testing) | No strategy at high spend |
| M37 | Spend pacing | Smooth daily spend | Minor fluctuations | Burning budget early in the day |
| M38 | Budget scaling approach | 15-20% per week max | Larger jumps with monitoring | Doubling budget overnight |

### Compliance (weight: 10%)

| ID | Check | PASS | WARNING | FAIL |
|---|---|---|---|---|
| M39 | Special Ad Categories | Declared if applicable | Not applicable | Required but not declared |
| M40 | Ad policy compliance | All ads approved | Minor warnings | Rejected/restricted ads |
| M41 | Landing page policy | Compliant, no misleading claims | Minor issues | Policy violation |
| M42 | Privacy policy on landing page | Present and current | Present but outdated | Missing |

---

## LinkedIn Ads (27 checks)

### Tracking (weight: 20%)

| ID | Check | PASS | WARNING | FAIL |
|---|---|---|---|---|
| L01 | Insight Tag installed | Active on all pages | Partial | Missing |
| L02 | Conversion tracking | Events configured, firing | Partially set up | Not configured |
| L03 | Revenue tracking | Values passed | No values | N/A for lead gen |
| L04 | UTM parameters | Consistent, GA4 aligned | Inconsistent | Missing |

### Targeting & Audiences (weight: 25%)

| ID | Check | PASS | WARNING | FAIL |
|---|---|---|---|---|
| L05 | Audience size vs budget | Audience >50k for broad, appropriate for ABM | Marginal | Audience too small for budget |
| L06 | Job function targeting | Specific, decision-maker focused | Broad | Irrelevant functions |
| L07 | Company targeting (ABM) | Matched audience with 1000+ companies | Small list or generic | No list for ABM campaigns |
| L08 | Seniority targeting | Aligned with buyer persona | Too broad | Wrong seniority |
| L09 | Audience exclusions | Competitors, current customers excluded | Partial | No exclusions |
| L10 | Retargeting setup | Website, video, lead gen retargeting | 1 retargeting type | No retargeting |
| L11 | Lookalike audiences | Based on converters | Based on visitors | Low quality seed |

### Creative & Copy (weight: 20%)

| ID | Check | PASS | WARNING | FAIL |
|---|---|---|---|---|
| L12 | Ad format variety | Single image + video + carousel/document | 2 formats | Single format |
| L13 | Headline quality | Benefit-focused, <70 chars | Feature-focused | Generic/clickbait |
| L14 | CTA alignment | Matches funnel stage | Generic CTA | Misleading |
| L15 | Creative testing | 4+ variants per campaign | 2-3 variants | Single creative |
| L16 | Lead gen form length | ≤5 fields for top-funnel | 6-8 fields | >8 fields (drop-off) |
| L17 | Lead gen form prefill | LinkedIn prefill enabled | Partial | Not using prefill |

### Campaign Structure (weight: 15%)

| ID | Check | PASS | WARNING | FAIL |
|---|---|---|---|---|
| L18 | Campaign objective alignment | Objective matches actual goal | Suboptimal objective | Wrong objective |
| L19 | Campaign organization | By funnel stage and audience | Loosely organized | Everything in 1-2 campaigns |
| L20 | Budget distribution | Performance-based | Equal split | Worst performer gets most |

### Budget & Bidding (weight: 10%)

| ID | Check | PASS | WARNING | FAIL |
|---|---|---|---|---|
| L21 | Bid strategy | Aligned with goal and volume | Manual CPC at scale | No strategy |
| L22 | Daily budget sufficiency | Enough for 1+ daily conversions | Marginal | Below minimum effective |
| L23 | Cost per lead vs benchmark | Within 20% of industry | 20-50% above | >50% above with no plan |

### Compliance (weight: 10%)

| ID | Check | PASS | WARNING | FAIL |
|---|---|---|---|---|
| L24 | Ad policy compliance | All approved | Warnings | Rejected |
| L25 | Special categories compliance | Declared if needed | N/A | Violation |

---

## TikTok Ads (28 checks)

### Tracking & Privacy (weight: 20%)

| ID | Check | PASS | WARNING | FAIL |
|---|---|---|---|---|
| T01 | TikTok Pixel installed | Active, events firing | Partial | Missing |
| T02 | Events API configured | Active, deduped with pixel | Set up but not deduped | Not configured (>$5k/mo) |
| T03 | Event deduplication | event_id dedup active | Partial | No dedup (double-counting) |
| T04 | ttclid parameter passing | Preserved through funnel | Partially | Stripped or lost |
| T05 | Attribution window | Appropriate for business | Default unchanged | Mismatched |

### Creative Quality (weight: 25%)

| ID | Check | PASS | WARNING | FAIL |
|---|---|---|---|---|
| T06 | Sound-on creative | All video has sound/music | Most have sound | Silent video (platform penalty) |
| T07 | Hook rate (3-sec view) | >40% | 25-40% | <25% |
| T08 | Video length | 15-30 sec (sweet spot) | 31-60 sec | <5 sec or >60 sec |
| T09 | Native TikTok feel | Looks like organic content | Somewhat polished | Obviously an ad / repurposed from other platforms |
| T10 | Creative volume | 5+ active creatives per ad group | 3-4 | <3 |
| T11 | Creative refresh | New creatives every 1-2 weeks | Every 2-4 weeks | Same creatives >4 weeks |
| T12 | CTA clarity | Clear, single CTA | Vague CTA | No CTA or confusing |
| T13 | Vertical format | 9:16 for all placements | Mix of ratios | Horizontal video |

### Targeting (weight: 20%)

| ID | Check | PASS | WARNING | FAIL |
|---|---|---|---|---|
| T14 | Audience definition | Specific interests + behaviors | Broad only | Too narrow (<100k) |
| T15 | Lookalike audiences | Based on converters | Based on engagement | Low quality seed |
| T16 | Retargeting | Video viewers + web visitors | One type | No retargeting |
| T17 | Audience exclusions | Converters excluded from prospecting | Partial | No exclusions |
| T18 | Smart+ targeting | Evaluated with performance data | Enabled unreviewed | Conflicting with manual |

### Campaign Structure (weight: 15%)

| ID | Check | PASS | WARNING | FAIL |
|---|---|---|---|---|
| T19 | Campaign objective | Matches actual goal | Suboptimal | Wrong objective |
| T20 | Ad group organization | Themed groups, clear testing structure | Loosely organized | Everything in one group |
| T21 | Smart+ campaigns | Evaluated for the business | Not evaluated | Running poorly unmonitored |

### Budget & Bidding (weight: 10%)

| ID | Check | PASS | WARNING | FAIL |
|---|---|---|---|---|
| T22 | Budget ≥50x CPA per ad group | Sufficient | Marginal (20-50x) | <20x (can't learn) |
| T23 | Bid strategy alignment | Matches goal and data volume | Acceptable but suboptimal | Wrong strategy |
| T24 | Spending pacing | Smooth and within 10% of budget | Minor spikes | Erratic or consistently under |

### Compliance (weight: 10%)

| ID | Check | PASS | WARNING | FAIL |
|---|---|---|---|---|
| T25 | Ad policy compliance | All approved | Warnings | Rejected ads |
| T26 | Restricted industries | Compliant with local regulations | Minor gaps | Violation |
| T27 | Shop ads compliance | Product listings accurate | Minor discrepancies | Misleading listings |
| T28 | Landing page quality | Fast, mobile, relevant | Some issues | Broken or misleading |
