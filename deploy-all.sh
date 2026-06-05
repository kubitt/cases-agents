#!/bin/bash
# deploy-all.sh — Deploy all 10 agents to their workspaces
# Usage: ./deploy-all.sh
# Requires: .env file with all workspace credentials

set -e
source "$(dirname "$0")/.env"

API="https://api.clawman.ascn.ai/api/v1"

deploy_agent() {
  local NAME="$1"
  local WS="$2"
  local KEY="$3"
  local SOUL_PATH="$4"

  echo ""
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
  echo "🚀 Deploying: $NAME"
  echo "   Workspace: $WS"

  # Read SOUL.md
  SOUL=$(cat "$SOUL_PATH")

  # Create session
  SESSION_ID=$(curl -s -X POST "${API}/${WS}/sessions" \
    -H "Authorization: Bearer ${KEY}" \
    -H "Content-Type: application/json" \
    -d '{"name":"onboarding-deploy"}' | python3 -c "import sys,json; d=json.load(sys.stdin); print(d.get('id',''))")

  if [ -z "$SESSION_ID" ]; then
    echo "   ❌ Failed to create session"
    return 1
  fi
  echo "   Session: $SESSION_ID"

  # Build deploy message
  DEPLOY_MSG="Ты — $NAME. Запиши следующее содержимое в файл SOUL.md своего воркспейса, используя доступные тебе инструменты записи файлов:

---
$SOUL
---

После записи подтверди: сколько байт записано и первые 3 строки файла."

  # Send message
  curl -s -X POST "${API}/${WS}/sessions/${SESSION_ID}/messages" \
    -H "Authorization: Bearer ${KEY}" \
    -H "Content-Type: application/json" \
    -d "{\"content\": $(echo "$DEPLOY_MSG" | python3 -c "import sys,json; print(json.dumps(sys.stdin.read()))")}" > /dev/null

  echo "   ⏳ Waiting for agent to write files..."
  sleep 12

  # Read response
  RESPONSE=$(curl -s "${API}/${WS}/sessions/${SESSION_ID}" \
    -H "Authorization: Bearer ${KEY}" | python3 -c "
import sys, json
d = json.load(sys.stdin)
for m in reversed(d.get('messages', [])):
    if m.get('role') == 'assistant':
        print(m.get('content','')[:300])
        break
")

  echo "   ✅ Agent response: $RESPONSE"
  echo "   Done: $NAME"
}

echo "═══════════════════════════════════════"
echo "  ASCN Agent Deployment — 10 Agents"
echo "═══════════════════════════════════════"

deploy_agent "Sales Researcher" "$SALES_RESEARCHER_WS" "$SALES_RESEARCHER_KEY" \
  "$(dirname "$0")/relevance-ai/sales-researcher/SOUL.md"

deploy_agent "Simple Content Repurposer" "$SIMPLE_CONTENT_WS" "$SIMPLE_CONTENT_KEY" \
  "$(dirname "$0")/relevance-ai/simple-content-repurposer/SOUL.md"

deploy_agent "AI Content Writing Team" "$AI_CONTENT_WRITING_WS" "$AI_CONTENT_WRITING_KEY" \
  "$(dirname "$0")/relevance-ai/ai-content-writing/SOUL.md"

deploy_agent "CRM в Google Sheets" "$CRM_SHEETS_WS" "$CRM_SHEETS_KEY" \
  "$(dirname "$0")/relevance-ai/crm-google-sheets/SOUL.md"

deploy_agent "B2B Leadgen" "$B2B_LEADGEN_WS" "$B2B_LEADGEN_KEY" \
  "$(dirname "$0")/relevance-ai/b2b-leadgen/SOUL.md"

deploy_agent "SEO Copywriter" "$SEO_COPYWRITER_WS" "$SEO_COPYWRITER_KEY" \
  "$(dirname "$0")/gumloop/seo-copywriter/SOUL.md"

deploy_agent "TG SMM" "$TG_SMM_WS" "$TG_SMM_KEY" \
  "$(dirname "$0")/native/tg-smm/SOUL.md"

deploy_agent "TG Seller" "$TG_SELLER_WS" "$TG_SELLER_KEY" \
  "$(dirname "$0")/native/tg-seller/SOUL.md"

deploy_agent "Commercial Offer Generator" "$COMMERCIAL_OFFER_WS" "$COMMERCIAL_OFFER_KEY" \
  "$(dirname "$0")/native/commercial-offer/SOUL.md"

deploy_agent "Financial Agent for SMB" "$FINANCIAL_SMB_WS" "$FINANCIAL_SMB_KEY" \
  "$(dirname "$0")/native/financial-smb/SOUL.md"

echo ""
echo "═══════════════════════════════════════"
echo "  ✅ All 10 agents deployed!"
echo "═══════════════════════════════════════"
