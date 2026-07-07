# Промпт для Claude Code: деплой агента «AR-коллектор PRO» в ASCN

Скопируй текст ниже в Claude Code, запущенный в этой папке (02-ar-collector-pro/).

---

Ты переносишь готового агента «AR-коллектор PRO» на платформу ASCN (ascn.ai).

Способ доступа (спроси у меня, если не ясно из окружения):
А) Файловый доступ к воркспейсу агента — тогда копируй файлы напрямую.
Б) MCP воркспейса ASCN (https://api.clawman.ascn.ai/api/v1/mcp, Bearer-ключ из Настройки → API) — тогда передавай содержимое файлов агенту через инструмент `chat` с просьбой сохранить в указанные пути.

Сделай по порядку:

1. Прочитай все файлы папки workspace/ этого проекта.
2. Перенеси в воркспейс агента ASCN:
   - workspace/IDENTITY.md → /data/workspace/IDENTITY.md (заменить содержимое)
   - workspace/SOUL.md → /data/workspace/SOUL.md (заменить содержимое)
   - workspace/ONBOARDING.md → /data/workspace/ONBOARDING.md (новый файл)
   - workspace/skills/dunning-sequence/SKILL.md → /data/workspace/skills/dunning-sequence/SKILL.md
   - workspace/skills/reply-triage/SKILL.md → /data/workspace/skills/reply-triage/SKILL.md
   - workspace/knowledge/DUNNING_PLAYBOOK.md → /data/workspace/knowledge/DUNNING_PLAYBOOK.md
   - workspace/knowledge/REGISTER_SCHEMA.md → /data/workspace/knowledge/REGISTER_SCHEMA.md
   Системные файлы платформы (AGENTS.md, MEMORY_POLICY.md, INTEGRATIONS.md, AUTOMATIONS.md, CHANNELS.md, rules/) НЕ трогай.
3. Автоматизации НЕ создавай сам: их создаст агент на финальном шаге онбординга по файлу ONBOARDING.md (тексты задач уже лежат в AUTOMATIONS.md этой папки — при желании сверь).
4. Проверь себя: выведи список перенесённых файлов и первые 3 строки каждого из воркспейса агента.
5. Напомни мне вручную: подключить интеграции (Gmail и Google Sheets) при первом диалоге с агентом — онбординг сам их запросит; подключить канал Telegram, если нужен.
6. Отправь агенту первое сообщение «Привет, начнём настройку» и убедись, что он начал онбординг по шагам (представился, назвал время настройки ~10 минут, задал первый вопрос — как сейчас ведётся учёт счетов).

Критерий готовности: файлы на месте, агент отвечает онбординг-сценарием, а не общими фразами.
