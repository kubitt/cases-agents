# Промпт для Claude Code: деплой агента «VoC-майнер» в ASCN

Скопируй текст ниже в Claude Code, запущенный в этой папке (11-voc-copy-miner-published/).

---

Ты переносишь готового агента «VoC-майнер (голос клиента → копирайт)» на платформу ASCN (ascn.ai).

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
   - workspace/skills/review-mining/SKILL.md → /data/workspace/skills/review-mining/SKILL.md
   - workspace/skills/voc-to-copy/SKILL.md → /data/workspace/skills/voc-to-copy/SKILL.md
   - workspace/knowledge/MINING_SOURCES.md → /data/workspace/knowledge/MINING_SOURCES.md
   - workspace/knowledge/COPY_FRAMEWORKS.md → /data/workspace/knowledge/COPY_FRAMEWORKS.md
   Системные файлы платформы (AGENTS.md, MEMORY_POLICY.md, INTEGRATIONS.md, AUTOMATIONS.md, CHANNELS.md, rules/) НЕ трогай.
3. Автоматизации НЕ создавай сам: единственную (месячное пополнение) агент создаст при онбординге, если пользователь согласится.
4. Проверь себя: выведи список перенесённых файлов и первые 3 строки каждого из воркспейса агента.
5. Напомни мне: при первом диалоге агент запросит Google Sheets и Docs (OAuth-кнопки), опционально Telegram.
6. Отправь агенту первое сообщение «Привет, начнём настройку» и убедись, что он начал онбординг (представился, назвал время ~7 минут, спросил про продукт).

Критерий готовности: файлы на месте, агент отвечает онбординг-сценарием, а не общими фразами.
