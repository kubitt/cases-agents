# Промпт для Claude Code: деплой агента «ICP-инженер из win/loss данных» в ASCN

Скопируй текст ниже в Claude Code, запущенный в этой папке (15-icp-engineer/).

---

Ты переносишь готового агента «ICP-инженер из win/loss данных» на платформу ASCN (ascn.ai).

Способ доступа (спроси у меня, если не ясно из окружения):
А) Файловый доступ к воркспейсу агента — тогда копируй файлы напрямую.
Б) MCP воркспейса ASCN (https://api.clawman.ascn.ai/api/v1/mcp, Bearer-ключ из Настройки → API) — тогда передавай содержимое файлов агенту через инструмент `chat` с просьбой сохранить в указанные пути.

Сделай по порядку:

1. Прочитай все файлы папки workspace/ этого проекта.
2. Перенеси в воркспейс агента ASCN:
   - workspace/IDENTITY.md → /data/workspace/IDENTITY.md (заменить содержимое)
   - workspace/SOUL.md → /data/workspace/SOUL.md (заменить содержимое)
   - workspace/ONBOARDING.md → /data/workspace/ONBOARDING.md (новый файл)
   - workspace/AUTOMATIONS.md → /data/workspace/AUTOMATIONS.md (новый; агент читает его при создании кронов)
   - workspace/skills/winloss-analysis/SKILL.md → /data/workspace/skills/winloss-analysis/SKILL.md
   - workspace/skills/persona-builder/SKILL.md → /data/workspace/skills/persona-builder/SKILL.md
   - workspace/knowledge/DEALS_SCHEMA.md → /data/workspace/knowledge/DEALS_SCHEMA.md
   - workspace/knowledge/ICP_OUTPUT_TEMPLATE.md → /data/workspace/knowledge/ICP_OUTPUT_TEMPLATE.md
   Системные файлы платформы (AGENTS.md, MEMORY_POLICY.md, INTEGRATIONS.md, AUTOMATIONS.md, CHANNELS.md, rules/) НЕ трогай.
3. Автоматизации НЕ создавай сам: единственная cron-задача опциональна, агент предложит её на онбординге по файлу ONBOARDING.md (текст задачи лежит в AUTOMATIONS.md этой папки — при желании сверь).
4. Проверь себя: выведи список перенесённых файлов и первые 3 строки каждого из воркспейса агента.
5. Напомни мне вручную: подключить интеграции (Google Sheets, опционально Google Docs) при первом диалоге с агентом — онбординг сам их запросит; подключить канал Telegram, если нужен.
6. Отправь агенту первое сообщение «Привет, начнём настройку» и убедись, что он начал онбординг по шагам (представился, назвал время настройки ~5 минут, задал первый вопрос — подключение Google Sheets).

Критерий готовности: файлы на месте, агент отвечает онбординг-сценарием, а не общими фразами.
