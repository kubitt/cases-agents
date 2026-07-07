# Integrations: PPC Audit Agent

| Integration | Required? | Purpose | Access / cost |
|---|---|---|---|
| Google Ads | Required (if user runs Google) | Read campaigns, keywords, search terms, conversions, quality scores, change history — 80 audit checks | OAuth, 1 click |
| Meta Ads | Required (if user runs Meta) | Read campaigns, ad sets, ads, pixel events, audiences, creative performance — 50 audit checks | OAuth, 1 click |
| LinkedIn Ads | Required (if user runs LinkedIn) | Read campaigns, creatives, audiences, conversions, lead gen forms — 27 audit checks | OAuth, 1 click |
| TikTok Ads | Required (if user runs TikTok) | Read campaigns, ad groups, ads, pixel/events, creative analytics — 28 audit checks | OAuth, 1 click |
| Google Sheets | Required | "PPC Audit History": stores every audit score, trend tracking, action items | OAuth, 1 click |
| Google Drive | Optional | Store detailed audit reports as documents | OAuth, 1 click |
| Telegram (channel) | Recommended | Weekly audit summaries, critical alerts, on-demand report delivery | 2-min setup |
| Web search | Built-in | Competitor research, industry benchmark verification, landing page analysis | Zero setup, free |
| Web page reading | Built-in | Landing page quality assessment, brand DNA extraction for creative audit | Zero setup, free |

Onboarding connection order: ad platforms (user's active ones) → Google Sheets → Telegram → Google Drive (optional).

Degradation:
- Without ad platform OAuth (not yet available): user provides CSV exports or screenshots; all checks run but with manual data input friction. Score accuracy unchanged.
- Without Telegram: reports delivered in ASCN chat. No functionality loss.
- Without Google Drive: detailed reports delivered in chat instead of saved to Drive. No functionality loss.
- Without Google Sheets: audit still runs but no historical tracking or trend comparison. Strongly recommend connecting.

Deliberately absent:
- Microsoft/Bing Ads (no native OAuth connector; user can provide CSV exports for manual analysis).
- Apple Ads (no native connector; niche platform, CSV export path available).
- Amazon Ads (no native connector; separate marketplace-focused agent recommended).
- Creative generation tools (Gemini/DALL-E) — this agent audits, does not create. A separate creative agent is the clean separation.

External paid APIs: **none required**. Total cost = $29/mo ASCN subscription only.
