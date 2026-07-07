# Промпт для Claude Code: деплой агента «Майнер болей аудитории» в ASCN

Скопируй текст ниже в Claude Code, запущенный в этой папке (30-pain-miner/).

---

Ты переносишь готового агента «Майнер болей аудитории (Pain Miner)» на платформу ASCN (ascn.ai).

Способ доступа (спроси у меня, если не ясно из окружения):
А) Файловый доступ к воркспейсу агента — копируй файлы напрямую.
Б) MCP воркспейса ASCN (https://api.clawman.ascn.ai/api/v1/mcp, Bearer-ключ из Настройки → API) — передавай содержимое файлов агенту через инструмент `chat` с просьбой сохранить в указанные пути.

Сделай по порядку:

1. Прочитай все файлы папки workspace/ этого проекта.
2. Перенеси в воркспейс агента ASCN:
   - workspace/IDENTITY.md → /data/workspace/IDENTITY.md (заменить содержимое)
   - workspace/SOUL.md → /data/workspace/SOUL.md (заменить содержимое)
   - workspace/ONBOARDING.md → /data/workspace/ONBOARDING.md (новый файл)
   - workspace/skills/pain-miner/SKILL.md → /data/workspace/skills/pain-miner/SKILL.md
   - workspace/knowledge/DOMAIN.md → /data/workspace/knowledge/DOMAIN.md
   - workspace/knowledge/PAIN_SOURCES.md → /data/workspace/knowledge/PAIN_SOURCES.md
   Системные файлы платформы (AGENTS.md, MEMORY_POLICY.md, INTEGRATIONS.md, AUTOMATIONS.md, CHANNELS.md, rules/) НЕ трогай.
3. ВАЖНО про персистентность (проверено на практике): записывай ВСЕ файлы в ОДНОЙ сессии инструментом file_write (не через shell) — иначе платформа теряет часть файлов между сессиями. Затем зарегистрируй навык pain-miner через skills_manage.
4. Автоматизации НЕ создавай сам: еженедельную разведку агент создаст при онбординге, если пользователь согласится.
5. Проверь себя в ОТДЕЛЬНОЙ свежей сессии: через file_read выведи длину каждого перенесённого файла и убедись, что навык pain-miner в списке skills_manage.
6. Напомни мне: обязательных интеграций нет (HN и Stack Exchange без ключей). Опционально при первом диалоге агент предложит Google Sheets/Docs (OAuth) и Telegram; Reddit — ключи в Секретах.
7. Отправь агенту первое сообщение «Привет, начнём настройку» и убедись, что он начал онбординг (представился, назвал время ~5 минут, спросил про домен/продукт).

Критерий готовности: файлы на месте (проверено в свежей сессии), навык зарегистрирован, агент отвечает онбординг-сценарием, а не общими фразами.
