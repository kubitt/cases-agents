# Integrations: CRO Conversion Optimizer

Everything this agent needs is native to ASCN. No external costs, no API keys, no secrets.

| Integration | Required? | Purpose | Access / cost |
|---|---|---|---|
| Built-in web reading | Required | Fetch and read the landing page from a URL | Native, no key, free |
| Built-in web search | Recommended | Pull conversion benchmarks for the niche | Native, no key, free |
| Google Sheets | Recommended | The "CRO Log": issues, hypotheses, ICE scores, results | Native OAuth, 1 click |
| Telegram | Recommended | Delivering the audit, rewrites, and ranked tests | Native OAuth channel, 2-min setup |
| Notion | Optional | Native alternative to Google Sheets for the CRO Log | Native OAuth |

Secrets to create before first run: NONE. This agent uses only native integrations — there is no API key, token, or paid third-party service anywhere in it.

Onboarding connection order: product/goal → brand voice/proof → checklist tuning → Google Sheets (or Notion) + Telegram → real audit.

"CRO Log" columns (identical everywhere): date, asset, issue, severity, hypothesis, ice_score, variant, status, result.

Degradation: without Google Sheets (or Notion) — the CRO Log isn't tracked, so rounds don't compound (recommended). Without Telegram — deliverables land in ASCN chat only. Web reading and web search are built in, so an audit always runs even with nothing else connected.

Deliberately absent / notes:
- **No API keys, no external costs.** Web reading, web search, Sheets, Notion, and Telegram are all native to ASCN — the agent adds zero third-party spend on top of the $29/mo plan.
- **It recommends, it doesn't publish.** The agent delivers copy and test plans; you apply them to your live site. It never edits or publishes pages.
- **A/B results need real traffic and honest samples.** The agent computes ICE and flags samples too small to trust; you run the test and read the result.
- **Psychology is guidance, not a guarantee.** Behavioral principles raise the odds; every hypothesis stays a hypothesis until a real test settles it.
- **No page-speed or design work.** The agent optimizes copy and structure, not layout code, load time, or visuals — those it flags for your team.
