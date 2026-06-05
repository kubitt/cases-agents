#!/bin/bash
# audit-all.sh — Audit all 10 agents
set -e
source "$(dirname "$0")/.env"
API="https://api.clawman.ascn.ai/api/v1"

audit_agent() {
  local NAME="$1"
  local WS="$2"
  local KEY="$3"

  echo ""
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
  echo "🔍 $NAME ($WS)"

  SESSION_ID=$(curl -s -X POST "${API}/${WS}/sessions" \
    -H "Authorization: Bearer ${KEY}" \
    -H "Content-Type: application/json" \
    -d '{"name":"audit"}' | python3 -c "import sys,json; print(json.load(sys.stdin).get('id',''))")

  if [ -z "$SESSION_ID" ]; then
    echo "  ❌ Failed to create session"
    return
  fi

  MSG='Проведи самодиагностику и ответь СТРОГО в этом формате (без лишнего текста):

== FILES ==
[список всех файлов в твоём воркспейсе с размером в байтах]

== INTEGRATIONS ==
[список подключённых интеграций — Google Sheets, Gmail, Telegram, и т.д. со статусом подключено/не подключено]

== SOUL_LINES ==
[количество строк в файле SOUL.md]

== ISSUES ==
[если есть проблемы — опиши их одной строкой; если всё ок — напиши OK]'

  curl -s -X POST "${API}/${WS}/sessions/${SESSION_ID}/messages" \
    -H "Authorization: Bearer ${KEY}" \
    -H "Content-Type: application/json" \
    -d "{\"content\": $(echo "$MSG" | python3 -c "import sys,json; print(json.dumps(sys.stdin.read()))")}" > /dev/null

  sleep 15

  curl -s "${API}/${WS}/sessions/${SESSION_ID}" \
    -H "Authorization: Bearer ${KEY}" | python3 -c "
import sys, json
d = json.load(sys.stdin)
for m in reversed(d.get('messages', [])):
    if m.get('role') == 'assistant':
        print(m.get('content',''))
        break
"
}

audit_agent "Sales Researcher" "$SALES_RESEARCHER_WS" "$SALES_RESEARCHER_KEY"
audit_agent "Simple Content Repurposer" "$SIMPLE_CONTENT_WS" "$SIMPLE_CONTENT_KEY"
audit_agent "AI Content Writing Team" "$AI_CONTENT_WRITING_WS" "$AI_CONTENT_WRITING_KEY"
audit_agent "CRM Google Sheets" "$CRM_SHEETS_WS" "$CRM_SHEETS_KEY"
audit_agent "B2B Leadgen" "$B2B_LEADGEN_WS" "$B2B_LEADGEN_KEY"
audit_agent "SEO Copywriter" "$SEO_COPYWRITER_WS" "$SEO_COPYWRITER_KEY"
audit_agent "TG SMM" "$TG_SMM_WS" "$TG_SMM_KEY"
audit_agent "TG Seller" "$TG_SELLER_WS" "$TG_SELLER_KEY"
audit_agent "Commercial Offer" "$COMMERCIAL_OFFER_WS" "$COMMERCIAL_OFFER_KEY"
audit_agent "Financial SMB" "$FINANCIAL_SMB_WS" "$FINANCIAL_SMB_KEY"

echo ""
echo "═════════════ AUDIT DONE ═════════════"
