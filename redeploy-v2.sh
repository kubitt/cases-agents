#!/bin/bash
# redeploy-v2.sh — Push v2 IDENTITY/SOUL/USER (3 files) to all 10 agents
set -e
source "$(dirname "$0")/.env"
API="https://api.clawman.ascn.ai/api/v1"

push_agent() {
  local NAME="$1"
  local WS="$2"
  local KEY="$3"
  local DIR="$4"

  echo ""
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
  echo "🔄 $NAME"

  local IDENT=$(cat "$DIR/IDENTITY.md")
  local SOUL=$(cat "$DIR/SOUL.md")
  local USER=$(cat "$DIR/USER.md")

  local SID=$(curl -s -X POST "${API}/${WS}/sessions" \
    -H "Authorization: Bearer ${KEY}" -H "Content-Type: application/json" \
    -d '{"name":"redeploy-v2"}' | python3 -c "import sys,json; print(json.load(sys.stdin).get('id',''))")

  if [ -z "$SID" ]; then echo "  ❌ session failed"; return; fi

  local MSG="Перезапиши ПОЛНОСТЬЮ три файла в твоём воркспейсе (полная замена содержимого, не дописывание). Это файлы Базы знаний (Brain → Knowledge):

=== ФАЙЛ 1: IDENTITY.md (должностная инструкция) ===
$IDENT
=== КОНЕЦ IDENTITY.md ===

=== ФАЙЛ 2: SOUL.md (ценности, ограничения, формат вывода, протокол первого запуска) ===
$SOUL
=== КОНЕЦ SOUL.md ===

=== ФАЙЛ 3: USER.md (шаблон данных пользователя — будет заполняться при онбординге) ===
$USER
=== КОНЕЦ USER.md ===

После записи ВСЕХ ТРЁХ файлов подтверди в формате:
- IDENTITY.md: <байт>
- SOUL.md: <байт>
- USER.md: <байт>"

  curl -s -X POST "${API}/${WS}/sessions/${SID}/messages" \
    -H "Authorization: Bearer ${KEY}" -H "Content-Type: application/json" \
    -d "{\"content\": $(echo "$MSG" | python3 -c "import sys,json; print(json.dumps(sys.stdin.read()))")}" > /dev/null

  sleep 22  # 3 files, give it time

  curl -s "${API}/${WS}/sessions/${SID}" \
    -H "Authorization: Bearer ${KEY}" | python3 -c "
import sys, json
d = json.load(sys.stdin)
for m in reversed(d.get('messages', [])):
    if m.get('role') == 'assistant':
        print(m.get('content','')[:500])
        break
"
}

echo "═══════════════════════════════════════"
echo "  Redeploy v2 — IDENTITY + SOUL + USER"
echo "═══════════════════════════════════════"

D="$(dirname "$0")"

push_agent "Sales Researcher" "$SALES_RESEARCHER_WS" "$SALES_RESEARCHER_KEY" "$D/relevance-ai/sales-researcher"
push_agent "Simple Content Repurposer" "$SIMPLE_CONTENT_WS" "$SIMPLE_CONTENT_KEY" "$D/relevance-ai/simple-content-repurposer"
push_agent "AI Content Writing Team" "$AI_CONTENT_WRITING_WS" "$AI_CONTENT_WRITING_KEY" "$D/relevance-ai/ai-content-writing"
push_agent "CRM Google Sheets" "$CRM_SHEETS_WS" "$CRM_SHEETS_KEY" "$D/relevance-ai/crm-google-sheets"
push_agent "B2B Leadgen" "$B2B_LEADGEN_WS" "$B2B_LEADGEN_KEY" "$D/relevance-ai/b2b-leadgen"
push_agent "SEO Copywriter" "$SEO_COPYWRITER_WS" "$SEO_COPYWRITER_KEY" "$D/gumloop/seo-copywriter"
push_agent "TG SMM" "$TG_SMM_WS" "$TG_SMM_KEY" "$D/native/tg-smm"
push_agent "TG Seller" "$TG_SELLER_WS" "$TG_SELLER_KEY" "$D/native/tg-seller"
push_agent "Commercial Offer" "$COMMERCIAL_OFFER_WS" "$COMMERCIAL_OFFER_KEY" "$D/native/commercial-offer"
push_agent "Financial SMB" "$FINANCIAL_SMB_WS" "$FINANCIAL_SMB_KEY" "$D/native/financial-smb"

echo ""
echo "═════════════ REDEPLOY V2 DONE ═════════════"
