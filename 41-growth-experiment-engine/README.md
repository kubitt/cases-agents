# Growth Experiment Engine

Runs a disciplined growth-testing program: captures test ideas into an ICE-ranked backlog, designs the chosen experiment, and — when you paste the results — computes statistical significance honestly and gives a verdict. A weekly digest surfaces finished-test verdicts and the top 3 experiments to run next. You implement the variants; it brings the rigor.

## Value & ROI
A growth or CRO consultant costs $2,000–5,000/mo, and undisciplined testing quietly wastes ad budget by calling winners on noise — a "+30% lift" on 40 visitors that reverses next week. This agent enforces the discipline: it scores every idea by ICE, sizes each test before you run it, and refuses to declare a winner until a Python two-proportion z-test says so — showing the p-value every time. Total cost: $29/mo (ASCN Start, 10,000 credits) with ZERO external costs — no API keys, no paid tools. Honest payback vs $29: roughly 15–50x versus a consultant, and far more once it stops one bad "winner" from scaling on a false read.

## What it does
1. Captures a test idea, structures it (hypothesis, the ONE metric, target), scores it by ICE via a Python script, and appends it to the "Experiment Ledger" — re-ranked.
2. Designs a chosen experiment: variant A/B, single success metric, guardrail metric, required sample size per variant (Python power calc), and an estimated duration from your traffic.
3. On results (visitors + conversions per variant) runs a Python two-proportion z-test → p-value, relative uplift %, and a verdict: winner (95%+), no significant difference, or insufficient data.
4. Every Monday 08:00 sends a digest: finished-test verdicts plus the top 3 experiments to run next by ICE.

## Folder contents
- `workspace/` — copied into the ASCN agent workspace (IDENTITY, SOUL, ONBOARDING, AUTOMATIONS, 3 skills, 2 knowledge files).
- `DEPLOY_PROMPT.md` — prompt for Claude Code that transfers everything to ASCN.
- `INTEGRATIONS.md` — integrations, zero costs, and the one weekly digest cron.

## Quick deploy
1. Open Claude Code in this folder.
2. Paste the contents of `DEPLOY_PROMPT.md`.
3. Send the agent "Hi, let's set up" — it runs its own onboarding (~9 min: product + funnel, method rubric, ledger, then it scores your first 3 ideas live).

## Required integrations
All native, zero external cost. Google Sheets (native OAuth — the "Experiment Ledger") and Telegram (native — the weekly digest) are recommended; built-in web search pulls benchmark conversion rates; Python scripts run in the agent's own container. Notion is an optional native alternative to Sheets. Secrets: NONE — no API keys or tokens are ever required.

## Deliberate limitations
- **It designs, scores, and analyzes — it does not run experiments.** You implement the A/B variants in your own tools and paste back the results; it never touches ad or analytics platforms or spends budget.
- **Significance is only as good as the sample.** It refuses to call a winner on thin data — samples below the minimum are flagged "insufficient data", never declared.
- **ICE scores and duration forecasts are estimates**, only as honest as the inputs you give; they rank and plan, they don't predict outcomes.
- **No guarantee any single test wins.** Most experiments show no significant difference — that is a normal, useful result, not a failure.
