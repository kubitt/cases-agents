# Промпт для Claude Code: деплой агента «Lifecycle-email конструктор» в ASCN

Скопируй текст ниже в Claude Code, запущенный в этой папке (10-lifecycle-email-builder/).

---

Ты переносишь готового агента «Lifecycle-email конструктор» на платформу ASCN (ascn.ai).

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
   - workspace/skills/campaign-architect/SKILL.md → /data/workspace/skills/campaign-architect/SKILL.md
   - workspace/skills/flow-copywriter/SKILL.md → /data/workspace/skills/flow-copywriter/SKILL.md
   - workspace/knowledge/LIFECYCLE_MAP_TEMPLATE.md → /data/workspace/knowledge/LIFECYCLE_MAP_TEMPLATE.md
   - workspace/knowledge/BRAND_VOICE.md → /data/workspace/knowledge/BRAND_VOICE.md
   Системные файлы платформы (AGENTS.md, MEMORY_POLICY.md, INTEGRATIONS.md, AUTOMATIONS.md, CHANNELS.md, rules/) НЕ трогай.
3. Автоматизации НЕ создавай сам: их создаст агент на финальном шаге онбординга по ONBOARDING.md (агент прочитает их из workspace/AUTOMATIONS.md).
4. Проверь себя: выведи список перенесённых файлов и первые 3 строки каждого из воркспейса агента.
5. Напомни мне: при первом диалоге агент запросит Google Docs и Sheets (OAuth-кнопки), опционально Gmail и Telegram.
6. Отправь агенту первое сообщение «Привет, начнём настройку» и убедись, что он начал онбординг (представился, назвал время настройки ~10 минут, спросил про бизнес).

Критерий готовности: файлы на месте, агент отвечает онбординг-сценарием, а не общими фразами.
