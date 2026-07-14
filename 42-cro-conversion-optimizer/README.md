# CRO Conversion Optimizer

Give it a landing page URL or paste your copy, and it runs a conversion audit, rewrites the weak elements into honest conversion-focused variants, and turns the top issues into ranked A/B test hypotheses — logging every round so your pages compound. It delivers recommendations; you apply them to your site.

## Value & ROI
A CRO consultant charges $1,500–5,000 for a single landing-page audit; agencies bill $2,000+/mo for ongoing optimization. Most of that cost is the repeatable part — reading the page against a checklist, rewriting weak copy, and scoring test ideas. This agent does exactly that, on command, for $29/mo (ASCN Start = 10,000 credits) with ZERO external costs and NO API keys. One audit here replaces a four-figure engagement, so payback vs $29 is a realistic 15–50x. It won't replace a senior strategist on your hardest calls — but it turns the routine audit-and-rewrite loop into a same-day deliverable.

## What it does
1. Reads your landing page from a URL (built-in web reading) or the copy you paste.
2. Runs a conversion audit per skill page-audit: scores value-prop clarity, friction, trust/proof, CTA strength, and message-match, and returns a prioritized issue list with severity (high / med / low) and the reason each matters.
3. Rewrites the weak elements per skill copy-rewrite: hero headline, subhead, CTA, key bullets, objection handling — two honest, on-brand options each, no fabricated claims.
4. Turns the top issues into ranked A/B hypotheses per skill test-planner: each with the single metric to move and an ICE score computed by a Python script (never eyeballed).
5. Logs every issue, variant, and hypothesis to the Google Sheet "CRO Log" so later rounds build on what you already tested.
6. Delivers the audit + rewrites + ranked tests to Telegram / ASCN chat.

## Folder contents
- `workspace/` — copied into the ASCN agent workspace (IDENTITY, SOUL, ONBOARDING, AUTOMATIONS, 3 skills, 2 knowledge files).
- `DEPLOY_PROMPT.md` — prompt for Claude Code that transfers everything to ASCN.
- `INTEGRATIONS.md` — integrations (all native, zero external cost) and the optional monthly re-audit cron.

## Quick deploy
1. Open Claude Code in this folder.
2. Paste the contents of `DEPLOY_PROMPT.md`.
3. Send the agent "Hi, let's set up" — it runs its own onboarding (~8 min: product + goal, brand voice + real proof, the checklist, delivery, then a real audit).

## Required integrations
All native, zero external cost, no API keys. Built-in web reading (fetch the page) and built-in web search (benchmarks) are included. Recommended: Google Sheets (the "CRO Log") and Telegram (delivery) — native OAuth, one click. Optional: Notion as a native alternative to Sheets. No secrets, no keys, nothing to pay for outside ASCN.

## Deliberate limitations
- **It recommends, it doesn't publish.** The agent delivers copy and test plans; you apply them to your live site. It never edits or publishes your pages.
- **A/B results need real traffic.** The agent computes ICE and flags samples too small to trust, but you run the test and read the outcome — it never claims a winner from thin data.
- **Psychology is guidance, not a guarantee.** The behavioral principles it uses raise the odds; they don't promise a lift. Every hypothesis is a hypothesis, and correlation is not causation.
- **Rewrites use only real proof.** The agent never invents stats, reviews, or numbers; social proof in copy comes only from the facts you provide.
- **No design or dev work.** It optimizes copy and structure, not page speed, layout code, or visuals — those it flags for your team.
