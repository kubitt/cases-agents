# Схема таблицы «SaaS-аудит»

> Ваш справочный файл. Агент читает его перед работой и дополняет по ходу. Правьте свободно.
[Агент создаёт таблицу при онбординге и ведёт сам. Пользователь может править вручную — агент подхватывает правки при следующем проходе.]

## Колонки
- vendor — нормализованное имя — Figma
- category — из списка ниже — дизайн
- plan — тариф — Professional
- seats — число мест — 10
- amount — сумма списания — 144
- currency — USD / RUB / EUR — USD
- period — monthly / annual / other — monthly
- last_charge — дата последнего списания — 2026-06-28
- renewal_date — дата продления; расчётная — пометка в notes — 2026-07-28
- payment_method — последние 4 цифры карты — *4242
- source — gmail / csv / gmail+csv / user — gmail+csv
- usage — daily / sometimes / nobody / unknown — sometimes
- flags — zombie / duplicate / price_up / trial_convert — duplicate
- verdict — keep / cut / renegotiate / hold — renegotiate
- saving — экономия $/год; для прогнозов пометка «оценка» — 1296 (оценка)
- action_status — pending / sent / done / — — pending
- notes — свободный текст — активны 11 мест из 20

## Типовые категории SaaS (основа для флага duplicate)
- Инфраструктура и хостинг: AWS, Vercel, DigitalOcean, Selectel
- Домены и почта: Namecheap, Google Workspace, Yandex 360
- Коммуникации: Slack, Zoom, Google Meet
- Дизайн: Figma, Adobe, Canva
- Разработка: GitHub, GitLab, JetBrains, Sentry
- Продажи и CRM: HubSpot, Pipedrive, amoCRM
- Маркетинг и рассылки: Mailchimp, Unisender, Ahrefs, SimilarWeb
- Аналитика: Amplitude, Mixpanel, Hotjar
- Таск-трекеры и доки: Notion, Jira, Asana, Miro
- HR и найм: hh.ru, Huntflow
- Финансы: QuickBooks, Контур
- AI-инструменты: OpenAI, Anthropic, Midjourney
- Безопасность: 1Password, VPN-сервисы
- Личное?: спорные списания — подтвердить у пользователя
- Прочее

Два и более активных вендора одной категории — повод для флага duplicate (исключение — «инфраструктура»: несколько провайдеров там нормально).

## Правила пересчёта
- annual_cost = amount × 12 (monthly) или amount (annual). Валюта приводится к report_currency по текущему курсу; курс фиксируется в notes месячного среза.
- saving для renegotiate = разница текущего и целевого плана («оценка»); после ответа вендора заменить на факт и перевести action_status в done.
