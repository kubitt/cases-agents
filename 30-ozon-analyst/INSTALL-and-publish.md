# Ozon Analyst — install & publish

This package turns the agent into a self-serve template: a new seller launches it, the agent runs onboarding (skill `onboarding`), connects Ozon keys, fills cost prices and warehouses, picks a channel, creates the daily tasks, and shows the first two reports.

> ⚠️ This file (INSTALL-and-publish.md) is a guide for you, the author. Do NOT upload it into the agent — it is not part of the agent.

## Where each file goes
The **Files** section is simplest for direct upload — it mirrors the agent's filesystem, so drop each file at the exact path below (keep the folders). You can also use the Brain UI sections.

| File | Direct path (Files section) | Brain UI section |
|---|---|---|
| IDENTITY.md | `/IDENTITY.md` | Brain → Knowledge base (core file) |
| SOUL.md | `/SOUL.md` | Brain → Knowledge base (core file) |
| USER.md | `/USER.md` | Brain → Knowledge base (core file) |
| MEMORY_POLICY.md | `/MEMORY_POLICY.md` | Brain → Memory (policy) — or Files root |
| skills/onboarding/SKILL.md | `/skills/onboarding/SKILL.md` | Brain → Skills (+ Add) |
| skills/ozon-data/SKILL.md | `/skills/ozon-data/SKILL.md` | Brain → Skills (+ Add) |
| skills/profit/SKILL.md | `/skills/profit/SKILL.md` | Brain → Skills (+ Add) |
| skills/stock/SKILL.md | `/skills/stock/SKILL.md` | Brain → Skills (+ Add) |
| files/scripts/pipeline.sh | `/files/scripts/pipeline.sh` | Files section |
| files/scripts/compute_profit.jq | `/files/scripts/compute_profit.jq` | Files section |
| files/scripts/compute_stock.jq | `/files/scripts/compute_stock.jq` | Files section |
| files/data/cost_prices.json | `/files/data/cost_prices.json` | Files section (seller fills) |
| files/data/clusters.json | `/files/data/clusters.json` | Files section (seller fills) |
| INSTALL-and-publish.md | — do not install — | — author guide only — |

Notes:
- Skills must live at `skills/<name>/SKILL.md` — keep the folder per skill.
- IDENTITY / SOUL / USER are the three core knowledge-base files; MEMORY_POLICY sits at the workspace root.
- The engine is `files/scripts/*` (curl + jq). `files/data/*.json` are the seller-filled config; ship them as placeholders.

## How it fits together
- **IDENTITY** gates the first run: if `setup: PENDING` or cost_prices still has the `ВАШ-OFFER-ID` placeholder → onboarding first.
- **onboarding** connects Ozon keys (→ Secrets), fills cost prices + warehouses, picks a channel, creates 3 daily tasks, shows the first reports.
- **ozon-data** runs `pipeline.sh`: curl the Ozon API → jq computes → `results_profit.json` / `results_stock.json`.
- **profit** / **stock** turn those results into two Telegram reports.

## Secrets (Settings → Secrets, never in files)
- `OZON_CLIENT_ID` — Ozon Seller API Client-Id (required)
- `OZON_API_KEY` — Ozon Seller API key (required)
- `OZON_PERF_CLIENT_ID`, `OZON_PERF_CLIENT_SECRET` — Performance API for ads/ДРР (optional)

## Two ways to deploy
1. **Automated push** — from your terminal, set your workspace URL in the script's `BASE` (push-setup.py) and run:
   ```
   ASCN_KEY=<workspace-key> python3 push-setup.py        # via REST
   ASCN_KEY=<workspace-key> python3 push-setup-mcp.py     # via MCP
   ```
   The script sends every file to the agent, which saves them verbatim. Then add the secrets and open the chat — the agent starts onboarding.
2. **Manual** — open `setup-messages.md` and paste each message into the agent's chat in order.

Rotate the workspace key after use — it is passed in pl=aintext during deploy.
