# Промпт для Claude Code: деплой агента «Бейджи с выставки → пайплайн» в ASCN

Скопируй текст ниже в Claude Code, запущенный в этой папке (17-event-leads-pipeline/).

---

Ты переносишь готового агента «Бейджи с выставки → пайплайн» на платформу ASCN (ascn.ai).

Способ доступа (спроси у меня, если не ясно из окружения):
А) Файловый доступ к воркспейсу агента — копируй файлы напрямую.
Б) MCP воркспейса ASCN (https://api.clawman.ascn.ai/api/v1/mcp, Bearer-ключ из Настройки → API) — передавай содержимое файлов агенту через инструмент `chat` с просьбой сохранить в указанные пути.

Сделай по порядку:

1. Прочитай все файлы папки workspace/ этого проекта.
2. Перенеси в воркспейс агента ASCN:
   - workspace/IDENTITY.md → /data/workspace/IDENTITY.md (заменить содержимое)
   - workspace/SOUL.md → /data/workspace/SOUL.md (заменить содержимое)
   - workspace/ONBOARDING.md → /data/workspace/ONBOARDING.md (новый файл)
   - workspace/AUTOMATIONS.md → /data/workspace/AUTOMATIONS.md (новый; агент читает его при создании кронов)
   - workspace/skills/badge-enrich/SKILL.md → /data/workspace/skills/badge-enrich/SKILL.md
   - workspace/skills/followup-sequencer/SKILL.md → /data/workspace/skills/followup-sequencer/SKILL.md
   - workspace/knowledge/ENRICH_SCHEMA.md → /data/workspace/knowledge/ENRICH_SCHEMA.md
   - workspace/knowledge/EVENT_TEMPLATES.md → /data/workspace/knowledge/EVENT_TEMPLATES.md
   Системные файлы платформы (AGENTS.md, MEMORY_POLICY.md, INTEGRATIONS.md, AUTOMATIONS.md, CHANNELS.md, rules/) НЕ трогай.
3. Автоматизации НЕ создавай сам: триггер Drive агент создаст при онбординге, остальное — динамически при кампаниях (агент прочитает их из workspace/AUTOMATIONS.md).
4. Проверь себя: выведи список перенесённых файлов и первые 3 строки каждого из воркспейса агента.
5. Напомни мне: при первом диалоге агент запросит Google Sheets, Gmail, Drive (OAuth-кнопки), опционально Telegram.
6. Отправь агенту первое сообщение «Привет, начнём настройку» и убедись, что он начал онбординг (представился, время ~8 минут, спросил про ICP).

Критерий готовности: файлы на месте, агент отвечает онбординг-сценарием, а не общими фразами.
