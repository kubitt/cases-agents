# Промпт для Claude Code: деплой агента «Outbound-машина (AI SDR)» в ASCN

Скопируй текст ниже в Claude Code, запущенный в этой папке (01-ai-sdr-outbound-published/).

---

Ты переносишь готового агента «Outbound-машина (AI SDR)» на платформу ASCN (ascn.ai).

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
   - workspace/skills/prospect-research/SKILL.md → /data/workspace/skills/prospect-research/SKILL.md
   - workspace/skills/outreach-sequence/SKILL.md → /data/workspace/skills/outreach-sequence/SKILL.md
   - workspace/knowledge/ICP_PLAYBOOK.md → /data/workspace/knowledge/ICP_PLAYBOOK.md
   - workspace/knowledge/VOICE.md → /data/workspace/knowledge/VOICE.md
   Системные файлы платформы (AGENTS.md, MEMORY_POLICY.md, INTEGRATIONS.md, AUTOMATIONS.md, CHANNELS.md, rules/) НЕ трогай.
3. Автоматизации НЕ создавай сам: их создаст агент на финальном шаге онбординга по файлу ONBOARDING.md (агент прочитает их из workspace/AUTOMATIONS.md).
4. Проверь себя: выведи список перенесённых файлов и первые 3 строки каждого из воркспейса агента.
5. Напомни мне вручную: при первом диалоге агент сам запросит подключение Gmail и Google Sheets (OAuth-кнопки в чате) и предложит подключить Telegram-канал.
6. Отправь агенту первое сообщение «Привет, начнём настройку» и убедись, что он начал онбординг по шагам (представился, назвал время настройки ~10 минут, задал первый вопрос про ICP).

Критерий готовности: файлы на месте, агент отвечает онбординг-сценарием, а не общими фразами.
