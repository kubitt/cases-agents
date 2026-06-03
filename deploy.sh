#!/bin/bash
# Деплой клонированного агента в ASCN через chat API
# Использование: ./deploy.sh relevance-ai/lead-qualifier

set -e

AGENT_DIR="$1"
AGENT_JSON="${AGENT_DIR}/agent.json"
API_BASE="https://api.clawman.ascn.ai/api/v1"

# Загружаем переменные из .env (не хранится в git)
if [ -f "$(dirname "$0")/.env" ]; then
  source "$(dirname "$0")/.env"
fi

WS_ID="${ASCN_WORKSPACE_ID:?Нужно задать ASCN_WORKSPACE_ID в cloned-agents/.env}"
API_KEY="${ASCN_API_KEY:?Нужно задать ASCN_API_KEY в cloned-agents/.env}"

if [ -z "$AGENT_DIR" ] || [ ! -f "$AGENT_JSON" ]; then
  echo "Использование: ./deploy.sh <путь-к-агенту>"
  echo "Пример: ./deploy.sh relevance-ai/lead-qualifier"
  exit 1
fi

NAME=$(jq -r '.name' "$AGENT_JSON")
SOUL=$(jq -r '.soul.system_prompt' "$AGENT_JSON")
INTEGRATIONS=$(jq -r '.integrations.required | join(", ")' "$AGENT_JSON")
AUTOMATIONS=$(jq -c '.automations' "$AGENT_JSON")
CATEGORY=$(jq -r '.category' "$AGENT_JSON")
DESCRIPTION=$(jq -r '.description' "$AGENT_JSON")

echo "Деплой агента: $NAME"
echo "Категория: $CATEGORY"
echo "Интеграции: $INTEGRATIONS"
echo ""

# Формируем промпт установки
DEPLOY_PROMPT="Настрой себя как новый агент со следующими параметрами:

**Имя:** $NAME
**Категория:** $CATEGORY
**Описание:** $DESCRIPTION

**Системный промпт:**
$SOUL

**Нужные интеграции:** $INTEGRATIONS

**Автоматизации:**
$AUTOMATIONS

Подтверди что понял конфигурацию и готов работать по этим инструкциям."

# Создаём сессию
echo "Создаём сессию..."
SESSION=$(curl -s -X POST "${API_BASE}/${WS_ID}/sessions" \
  -H "Authorization: Bearer ${API_KEY}" \
  -H "Content-Type: application/json" \
  -d "{\"name\": \"deploy-${NAME}\"}")

SESSION_ID=$(echo "$SESSION" | jq -r '.id')
echo "Сессия создана: $SESSION_ID"

# Отправляем промпт
echo "Отправляем конфигурацию агенту..."
RESPONSE=$(curl -s -X POST "${API_BASE}/${WS_ID}/sessions/${SESSION_ID}/messages" \
  -H "Authorization: Bearer ${API_KEY}" \
  -H "Content-Type: application/json" \
  -d "{\"content\": $(echo "$DEPLOY_PROMPT" | jq -Rs .)}")

echo ""
echo "Ответ агента:"
echo "$RESPONSE" | jq -r '.content // .message // .'

# Обновляем статус в agent.json
TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
TMP=$(mktemp)
jq ".deploy.status = \"deployed\" | .deploy.workspace_id = \"${WS_ID}\" | .deploy.deployed_at = \"${TIMESTAMP}\" | .deploy.deploy_prompt = $(echo "$DEPLOY_PROMPT" | jq -Rs .)" "$AGENT_JSON" > "$TMP"
mv "$TMP" "$AGENT_JSON"

echo ""
echo "Статус обновлён: deployed"
echo "Workspace: $WS_ID"
echo "Сессия: $SESSION_ID"
