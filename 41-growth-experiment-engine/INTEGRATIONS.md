# Integrations: Growth Experiment Engine

| Integration | Required? | Purpose | Access / cost |
|---|---|---|---|
| Google Sheets | Recommended | The "Experiment Ledger": backlog, ICE scores, results, verdicts | Native OAuth, 1 click — $0 |
| Telegram | Recommended | The weekly digest and result-request messages | Native OAuth channel, 2-min setup — $0 |
| Built-in web search | Included | Benchmark conversion rates for a funnel step / industry | Native, no key — $0 |
| Python scripts | Included | ICE ranking, sample-size/power calc, two-proportion z-test | Run in the agent's own container — $0 |
| Notion | Optional | Native alternative to Google Sheets for the ledger | Native OAuth — $0 |

Secrets to create before first run (Settings → Secrets): NONE. This agent needs no API keys or tokens — every integration is native OAuth or runs locally. That is the point: full statistical rigor with zero external spend beyond the $29/mo ASCN plan.

Onboarding connection order: product/funnel → method rubric → Google Sheets (ledger) → Telegram (digest) → score first 3 ideas → weekly digest cron.

Degradation: without Google Sheets — the ledger is held in the workspace files instead, so history still compounds but is less shareable (Notion is the native alternative). Without Telegram — the weekly digest posts in the ASCN chat instead. Web search and the Python scripts always work; the core math never depends on an external service.

Deliberately absent / notes:
- **No ad or analytics-platform connection.** The agent designs, scores, and analyzes; it does not run tests or read live campaign data. You implement variants and paste in the visitor/conversion counts.
- **No paid statistics or CRO tools.** Every calculation — ICE, power/sample size, z-test — is a small Python script, not a third-party API, so there is nothing to pay for and nothing to leak.
- **No guaranteed outcomes.** Significance verdicts describe the data you provide; they never promise a future result, and correlation is never reported as causation.
