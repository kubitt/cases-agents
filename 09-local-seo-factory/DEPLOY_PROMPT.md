# Промпт для Claude Code: деплой агента «Фабрика локальных SEO-страниц» в ASCN

Скопируй текст ниже в Claude Code, запущенный в этой папке (09-local-seo-factory/).

---

Ты переносишь готового агента «Фабрика локальных SEO-страниц» на платформу ASCN (ascn.ai).

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
   - workspace/skills/page-matrix/SKILL.md → /data/workspace/skills/page-matrix/SKILL.md
   - workspace/skills/page-generator/SKILL.md → /data/workspace/skills/page-generator/SKILL.md
   - workspace/knowledge/PAGE_TEMPLATE.md → /data/workspace/knowledge/PAGE_TEMPLATE.md
   - workspace/knowledge/LOCAL_SIGNALS.md → /data/workspace/knowledge/LOCAL_SIGNALS.md
   Системные файлы платформы (AGENTS.md, MEMORY_POLICY.md, INTEGRATIONS.md, AUTOMATIONS.md, CHANNELS.md, rules/) НЕ трогай.
3. Автоматизации НЕ создавай сам: их создаст агент на финальном шаге онбординга по файлу ONBOARDING.md (агент прочитает их из workspace/AUTOMATIONS.md).
4. Проверь себя: выведи список перенесённых файлов и первые 3 строки каждого из воркспейса агента.
5. Напомни мне вручную: подключить интеграции (Google Sheets, Google Docs, Google Drive, опционально Search Console) при первом диалоге с агентом — онбординг сам их запросит; подключить канал Telegram, если нужен.
6. Отправь агенту первое сообщение «Привет, начнём настройку» и убедись, что он начал онбординг по шагам (представился, назвал время настройки ~15 минут, задал первый вопрос про бизнес и услуги).

Критерий готовности: файлы на месте, агент отвечает онбординг-сценарием, а не общими фразами.
