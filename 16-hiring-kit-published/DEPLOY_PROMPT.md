# Промпт для Claude Code: деплой агента «Хайринг-кит под ключ» в ASCN

Скопируй текст ниже в Claude Code, запущенный в этой папке (16-hiring-kit-published/).

---

Ты переносишь готового агента «Хайринг-кит под ключ» на платформу ASCN (ascn.ai).

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
   - workspace/skills/role-kit/SKILL.md → /data/workspace/skills/role-kit/SKILL.md
   - workspace/skills/comp-benchmark/SKILL.md → /data/workspace/skills/comp-benchmark/SKILL.md
   - workspace/knowledge/COMPANY_PROFILE.md → /data/workspace/knowledge/COMPANY_PROFILE.md
   - workspace/knowledge/KIT_TEMPLATE.md → /data/workspace/knowledge/KIT_TEMPLATE.md
   Системные файлы платформы (AGENTS.md, MEMORY_POLICY.md, INTEGRATIONS.md, AUTOMATIONS.md, CHANNELS.md, rules/) НЕ трогай.
3. Автоматизации НЕ создавай: единственный опциональный триггер (Drive «вакансия-*») агент предложит сам при онбординге.
4. Проверь себя: выведи список перенесённых файлов и первые 3 строки каждого из воркспейса агента.
5. Напомни мне: при первом диалоге агент запросит Google Docs (обязательно), Sheets и Drive (по желанию).
6. Отправь агенту первое сообщение «Привет, начнём настройку» и убедись, что он начал онбординг (представился, время ~7 минут, спросил про компанию).

Критерий готовности: файлы на месте, агент отвечает онбординг-сценарием, а не общими фразами.
