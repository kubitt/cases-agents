# Промпт для Claude Code: деплой агента «Battlecards для отдела продаж» в ASCN

Скопируй текст ниже в Claude Code, запущенный в этой папке (12-sales-battlecards/).

---

Ты переносишь готового агента «Battlecards для отдела продаж» на платформу ASCN (ascn.ai).

Способ доступа (спроси у меня, если не ясно из окружения):
А) Файловый доступ к воркспейсу агента — тогда копируй файлы напрямую.
Б) MCP воркспейса ASCN (https://api.clawman.ascn.ai/api/v1/mcp, Bearer-ключ из Настройки → API) — тогда передавай содержимое файлов агенту через инструмент `chat` с просьбой сохранить в указанные пути.

Сделай по порядку:

1. Прочитай все файлы папки workspace/ этого проекта.
2. Перенеси в воркспейс агента ASCN:
   - workspace/IDENTITY.md → /data/workspace/IDENTITY.md (заменить содержимое)
   - workspace/SOUL.md → /data/workspace/SOUL.md (заменить содержимое)
   - workspace/ONBOARDING.md → /data/workspace/ONBOARDING.md (новый файл)
   - workspace/skills/battlecard-builder/SKILL.md → /data/workspace/skills/battlecard-builder/SKILL.md
   - workspace/skills/competitor-diff/SKILL.md → /data/workspace/skills/competitor-diff/SKILL.md
   - workspace/knowledge/BATTLECARD_TEMPLATE.md → /data/workspace/knowledge/BATTLECARD_TEMPLATE.md
   - workspace/knowledge/OUR_POSITIONING.md → /data/workspace/knowledge/OUR_POSITIONING.md
   Системные файлы платформы (AGENTS.md, MEMORY_POLICY.md, INTEGRATIONS.md, AUTOMATIONS.md, CHANNELS.md, rules/) НЕ трогай.
3. Автоматизации НЕ создавай сам: их создаст агент на финальном шаге онбординга по файлу ONBOARDING.md (текст задачи уже лежит в AUTOMATIONS.md этой папки — при желании сверь).
4. Проверь себя: выведи список перенесённых файлов и первые 3 строки каждого из воркспейса агента.
5. Напомни мне вручную: при первом диалоге агент сам запросит подключение Google Sheets и Google Docs (OAuth-кнопки в чате) и предложит канал Slack/Telegram для пятничных дайджестов.
6. Отправь агенту первое сообщение «Привет, начнём настройку» и убедись, что он начал онбординг по шагам (представился, назвал время настройки ~10 минут, задал первый вопрос про продукт и рынок).

Критерий готовности: файлы на месте, агент отвечает онбординг-сценарием, а не общими фразами.
