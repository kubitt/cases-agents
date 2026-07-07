# Промпт для Claude Code: деплой агента «Inbound Sales Pro» в ASCN

Скопируй текст ниже в Claude Code, запущенный в этой папке (30-inbound-sales-pro/).

---

Ты переносишь готового агента «Inbound Sales Pro» на платформу ASCN (ascn.ai).

Способ доступа (спроси у меня, если не ясно из окружения):
А) Файловый доступ к воркспейсу агента — тогда копируй файлы напрямую.
Б) MCP воркспейса ASCN (Bearer-ключ из Настройки → API) — тогда передавай содержимое файлов агенту через инструмент `chat` с просьбой сохранить в указанные пути.
В) REST API ASCN — передавай файлы через POST /sessions/{id}/messages.

Сделай по порядку:

1. Прочитай все файлы папки workspace/ этого проекта.
2. Перенеси в воркспейс агента ASCN:
   - workspace/IDENTITY.md → IDENTITY.md (заменить содержимое)
   - workspace/SOUL.md → SOUL.md (заменить содержимое)
   - workspace/ONBOARDING.md → ONBOARDING.md (новый файл)
   - workspace/AUTOMATIONS.md → /data/workspace/AUTOMATIONS.md (новый; агент читает его при создании кронов)
   - workspace/skills/onboarding/SKILL.md → skills/onboarding/SKILL.md
   - workspace/skills/qualify-lead/SKILL.md → skills/qualify-lead/SKILL.md
   - workspace/skills/present-offer/SKILL.md → skills/present-offer/SKILL.md
   - workspace/skills/handle-objections/SKILL.md → skills/handle-objections/SKILL.md
   - workspace/skills/close-deal/SKILL.md → skills/close-deal/SKILL.md
   - workspace/knowledge/capabilities.md → knowledge/capabilities.md
   - workspace/knowledge/service.md → knowledge/service.md
   - workspace/knowledge/pricing.md → knowledge/pricing.md
   - workspace/knowledge/objections.md → knowledge/objections.md
   Системные файлы платформы (AGENTS.md, MEMORY_POLICY.md, INTEGRATIONS.md, AUTOMATIONS.md, CHANNELS.md, rules/) НЕ трогай.
3. Автоматизации НЕ создавай: агент предложит их на финальном шаге онбординга.
4. Проверь себя: выведи список перенесённых файлов и первые 3 строки каждого из воркспейса.
5. Отправь агенту первое сообщение «Привет, начнём настройку» и убедись, что он начал онбординг.
