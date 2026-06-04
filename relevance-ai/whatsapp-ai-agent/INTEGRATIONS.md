# Интеграции

| Сервис (Relevance AI) | Есть в ASCN | Аналог / Статус |
|---|---|---|
| WhatsApp actions: Get All Chats | ❌ | Нет нативной интеграции |
| WhatsApp actions: Get All Messages | ❌ | Нет нативной интеграции |
| WhatsApp actions: Send Message | ❌ | Нет нативной интеграции |
| WhatsApp actions: Start New Chat | ❌ | Нет нативной интеграции |
| WhatsApp actions: Get User Profile | ❌ | Нет нативной интеграции |
| Memory (Save/Delete) | ✅ | Встроенная память ASCN |

## Как подключить WhatsApp к ASCN (варианты)

**Вариант 1 — Twilio WhatsApp API**
- Бесплатный trial: 15.50$ кредитов
- Нужен: Twilio аккаунт + верифицированный WhatsApp номер
- Ссылка: twilio.com/whatsapp

**Вариант 2 — 360dialog**
- Бесплатный trial есть
- Официальный WhatsApp Business API провайдер
- Дешевле Twilio для продакшена

**Вариант 3 — Waba.io / Chat-API**
- Неофициальные решения (дешевле, но риски блокировки)
- Популярны в СНГ

## Заметки

Основной блокер для деплоя — отсутствие WhatsApp в ASCN.
Как только появится интеграция — этот агент первым идёт в продакшен.
