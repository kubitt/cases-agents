# AI Agent Cases for ASCN

Подборка готовых кейсов AI-агентов на базе платформы [ASCN Agent](https://ascn.ai). Каждый агент — это рабочий шаблон с доказанной бизнес-ценностью, опубликованный на [маркетплейсе ASCN](https://ascn.ai).

Здесь собраны полные исходники агентов в открытом формате — структура, промпты, скиллы, знания, автоматизации. Всё, что работает внутри платформы, продублировано здесь, чтобы было понятно, как устроен каждый агент и что он делает.

## Быстрый старт — скопировать агента за 1 минуту

Любой агент из этого репозитория можно воспроизвести в ASCN за один промпт:

1. Создайте нового агента на [ascn.ai](https://ascn.ai)
2. Скиньте ему ссылку на папку нужного агента, например:
   ```
   https://github.com/kubitt/cases-agents/tree/main/01-ai-sdr-outbound
   ```
3. Напишите промпт:
   > Сделай полную копию этого агента, сохраняя всю структуру файлов и папок
4. Агент воспроизведёт всё: роль, характер, скиллы, базу знаний, онбординг
5. Дальше дорабатывайте под себя — настройте интеграции, добавьте свои данные

## Каталог агентов

Всего агентов: **45**. Опубликовано в маркетплейсе: **35** (папки 01–35). Не опубликовано: **10** (36–45).

### Опубликованы в маркетплейсе (35)

| # | Агент | Что делает | Маркетплейс |
|---|---|---|---|
| 01 | [Outbound-машина (AI SDR)](01-ai-sdr-outbound-published/) | Персональный SDR: сам ресёрчит каждого проспекта, пишет не-шаблонные письма и ведёт цепочки касаний — вы… | [RU](https://ascn.ai/ru/templates/ai-sdr-agent-outbound-sales-automation) · [EN](https://ascn.ai/en/templates/ai-sdr-agent-outbound-sales-automation) |
| 02 | [AR-коллектор PRO](02-ar-collector-pro-published/) | Возвращает дебиторку без вашего участия: ведёт напоминания по нарастающим стадиям, разбирает ответы… | [RU](https://ascn.ai/ru/templates/ai-accounts-receivable-collections-automation) · [EN](https://ascn.ai/en/templates/ai-accounts-receivable-collections-automation) |
| 03 | [Юрист первой линии (redline договоров)](03-contract-redline-published/) | Входящий договор → redline-правки по каждому рискованному пункту и вердикт «подписать / торговаться /… | [RU](https://ascn.ai/ru/templates/ai-contract-review-redline-legal-agent) · [EN](https://ascn.ai/en/templates/ai-contract-review-redline-legal-agent) |
| 04 | [RFP/тендер-ответчик](04-rfp-responder-published/) | RFP или тендерная документация → чек-лист требований с go/no-go и собранный секция-за-секцией ответ на… | [RU](https://ascn.ai/ru/templates/ai-rfp-response-proposal-automation) · [EN](https://ascn.ai/en/templates/ai-rfp-response-proposal-automation) |
| 05 | [Финансовый пакет + runway (аутсорс-CFO)](05-cfo-financial-package-published/) | Из сырых выгрузок банка и CRM — месячный финансовый пакет с комментариями к отклонениям и живой… | [RU](https://ascn.ai/ru/templates/ai-cfo-financial-reporting-runway-forecast) · [EN](https://ascn.ai/en/templates/ai-cfo-financial-reporting-runway-forecast) |
| 06 | [SaaS-аудитор расходов](06-saas-spend-auditor-published/) | Находит все подписки компании по квитанциям в почте и банковским выпискам, выносит вердикт по каждой и… | [RU](https://ascn.ai/ru/templates/ai-saas-spend-auditor-cut-subscription-costs) · [EN](https://ascn.ai/en/templates/ai-saas-spend-auditor-cut-subscription-costs) |
| 07 | [HR-скринер PRO](07-hr-screener-pro-published/) | Превращает 300 откликов в шорт-лист с объяснимыми оценками, а транскрипты интервью — в скоркарды с… | [RU](https://ascn.ai/ru/templates/ai-resume-screening-candidate-scoring-agent) · [EN](https://ascn.ai/en/templates/ai-resume-screening-candidate-scoring-agent) |
| 08 | [GEO-оптимизатор](08-geo-optimizer-published/) | Делает ваш сайт цитируемым источником для ChatGPT, Perplexity и AI Overviews: аудит цитируемости,… | [RU](https://ascn.ai/ru/templates/geo-generative-engine-optimization-agent) · [EN](https://ascn.ai/en/templates/geo-generative-engine-optimization-agent) |
| 09 | [Фабрика локальных SEO-страниц](09-local-seo-factory-published/) | Для локальных сервисных бизнесов: десятки уникальных страниц «услуга + город/район» с локальными деталями,… | [RU](https://ascn.ai/ru/templates/local-seo-landing-page-generator-agent) · [EN](https://ascn.ai/en/templates/local-seo-landing-page-generator-agent) |
| 10 | [Lifecycle-email конструктор](10-lifecycle-email-builder-published/) | Полная система удержания клиентов из одного описания бизнеса: сегменты, ветки писем, копирайт, тайминги —… | [RU](https://ascn.ai/ru/templates/lifecycle-email-marketing-automation-agent) · [EN](https://ascn.ai/en/templates/lifecycle-email-marketing-automation-agent) |
| 11 | [Голос клиента → продающий копирайт (VoC-майнер)](11-voc-copy-miner-published/) | Собирает дословные фразы клиентов из отзывов — ваших и конкурентов — и превращает их в хуки, заголовки и… | [RU](https://ascn.ai/ru/templates/voice-of-customer-copy-mining-agent) · [EN](https://ascn.ai/en/templates/voice-of-customer-copy-mining-agent) |
| 12 | [Battlecards для отдела продаж](12-sales-battlecards-published/) | Боевые карточки по каждому конкуренту из открытых источников + еженедельный мониторинг изменений — продавцы… | [RU](https://ascn.ai/ru/templates/ai-sales-battlecards-competitive-intelligence) · [EN](https://ascn.ai/en/templates/ai-sales-battlecards-competitive-intelligence) |
| 13 | [Отчёт для руководства + HTML-дашборд](13-management-report-published/) | Каждый понедельник — нарративный KPI-отчёт с комментариями к отклонениям и действиями, плюс интерактивный… | [RU](https://ascn.ai/ru/templates/ai-management-kpi-report-dashboard-agent) · [EN](https://ascn.ai/en/templates/ai-management-kpi-report-dashboard-agent) |
| 14 | [Инвестор-апдейт и борд-дек](14-investor-update-published/) | Send-ready письмо инвесторам из реальных цифр в Sheets — с честными lowlights и конкретными asks; по… | [RU](https://ascn.ai/ru/templates/ai-investor-update-report-generator) · [EN](https://ascn.ai/en/templates/ai-investor-update-report-generator) |
| 15 | [ICP-инженер из win/loss данных](15-icp-engineer-published/) | Выводит портрет идеального клиента из вашей реальной истории сделок: какие сигналы статистически отличают… | [RU](https://ascn.ai/ru/templates/ai-icp-win-loss-analysis-agent) · [EN](https://ascn.ai/en/templates/ai-icp-win-loss-analysis-agent) |
| 16 | [Хайринг-кит под ключ](16-hiring-kit-published/) | Назовите роль — получите полный комплект для найма: JD, вилку зарплаты с источниками, 4-этапную воронку… | [RU](https://ascn.ai/ru/templates/ai-hiring-kit-job-description-offer-generator) · [EN](https://ascn.ai/en/templates/ai-hiring-kit-job-description-offer-generator) |
| 17 | [Бейджи с выставки → пайплайн](17-event-leads-pipeline-published/) | CSV со сканами бейджей после выставки → каждый контакт обогащён ресёрчем, отскорен и получает персональный… | [RU](https://ascn.ai/ru/templates/event-lead-capture-follow-up-automation) · [EN](https://ascn.ai/en/templates/event-lead-capture-follow-up-automation) |
| 18 | [Мульти-клиент отчёты для агентств](18-agency-client-reports-published/) | Для агентств (SEO/SMM/перфоманс): месячные брендированные отчёты всем клиентам — за одну сессию вместо… | [RU](https://ascn.ai/ru/templates/ai-agency-client-reporting-automation) · [EN](https://ascn.ai/en/templates/ai-agency-client-reporting-automation) |
| 19 | [Генератор коммерческих предложений](19-commercial-offer-generator-published/) | Генератор КП: менеджер описывает сделку → структурированное КП в Google Doc | [RU](https://ascn.ai/ru/templates/ai-commercial-proposal-generator) · [EN](https://ascn.ai/en/templates/ai-commercial-proposal-generator) |
| 20 | [Финансовый помощник для малого бизнеса](20-financial-smb-assistant-published/) | Финансовый ассистент для МСБ: учёт, аналитика, Google Sheets интеграция | [RU](https://ascn.ai/ru/templates/ai-financial-assistant-for-small-business) · [EN](https://ascn.ai/en/templates/ai-financial-assistant-for-small-business) |
| 21 | [AI-продавец в Telegram](21-tg-sales-bot-published/) | AI-продавец в Telegram. Выявляет потребность, презентует продукт, закрывает возражения, ведёт к покупке. | [RU](https://ascn.ai/ru/templates/ai-telegram-sales-bot) · [EN](https://ascn.ai/en/templates/ai-telegram-sales-bot) |
| 22 | [SMM-агент для Telegram-каналов](22-tg-smm-agent-published/) | SMM-агент для Telegram-канала. Пишет посты и публикует их — по команде или по расписанию. | [RU](https://ascn.ai/ru/templates/ai-telegram-smm-content-agent) · [EN](https://ascn.ai/en/templates/ai-telegram-smm-content-agent) |
| 23 | [B2B лидогенерация и холодный аутрич](23-b2b-leadgen-published/) | Полный цикл B2B аутрича: находит компании → собирает email → пишет персональные письма → отправляет через… | [RU](https://ascn.ai/ru/templates/ai-b2b-lead-generation-agent) · [EN](https://ascn.ai/en/templates/ai-b2b-lead-generation-agent) |
| 24 | [Ресёрч компаний для продаж](24-sales-researcher-published/) | B2B-разведчик: собирает полное досье на компанию и контакт за 2-3 минуты. Для подготовки к звонку. | [RU](https://ascn.ai/ru/templates/ai-sales-research-account-prep-agent) · [EN](https://ascn.ai/en/templates/ai-sales-research-account-prep-agent) |
| 25 | [CRM в Google Sheets](25-crm-google-sheets-published/) | Голосовой интерфейс к CRM в Google Sheets. Добавляй сделки, обновляй статусы, получай сводку — через чат. | [RU](https://ascn.ai/ru/templates/ai-crm-in-google-sheets-agent) · [EN](https://ascn.ai/en/templates/ai-crm-in-google-sheets-agent) |
| 26 | [AI-команда для создания контента](26-ai-content-writer-published/) | Из одной идеи — полный контент-пакет: статья, посты LinkedIn/X/Telegram, сохраняет в Google Docs. | [RU](https://ascn.ai/ru/templates/ai-content-writing-team-agent) · [EN](https://ascn.ai/en/templates/ai-content-writing-team-agent) |
| 27 | [Репурпозинг контента по платформам](27-content-repurposer-published/) | Переупаковывает любой контент (YouTube, статья, текст) в посты для LinkedIn, X, Telegram. | [RU](https://ascn.ai/ru/templates/ai-content-repurposing-agent) · [EN](https://ascn.ai/en/templates/ai-content-repurposing-agent) |
| 28 | [SEO-копирайтер](28-seo-copywriter-published/) | SEO-копирайтер: пишет статьи под ключевые слова, оптимизирует существующий контент, анализирует конкурентов. | [RU](https://ascn.ai/ru/templates/ai-seo-copywriter-article-generator) · [EN](https://ascn.ai/en/templates/ai-seo-copywriter-article-generator) |
| 29 | [Market Radar](29-market-radar-published/) | Мониторинг рынка и конкурентов, дайджест изменений. | [RU](https://ascn.ai/ru/templates/ai-market-competitor-intelligence-radar) · [EN](https://ascn.ai/en/templates/ai-market-competitor-intelligence-radar) |
| 30 | [Ozon-аналитик](30-ozon-analyst-published/) | Аналитика продаж и прибыли для селлера Ozon. | [RU](https://ascn.ai/ru/templates/ai-ozon-seller-analytics-profit-agent) · [EN](https://ascn.ai/en/templates/ai-ozon-seller-analytics-profit-agent) |
| 31 | [Майнер болей аудитории](31-pain-miner-published/) | Находит, какими словами реальные люди описывают боли, которые закрывает ваш продукт, — из Hacker News,… | [RU](https://ascn.ai/ru/templates/ai-audience-pain-research-agent) · [EN](https://ascn.ai/en/templates/ai-audience-pain-research-agent) |
| 32 | [Native Comment Finder](32-native-comment-leadgen-published/) | Finds fresh public posts where people describe a problem your product solves, writes a ready-to-paste… | [RU](https://ascn.ai/ru/templates/native-comment-lead-generation-agent) · [EN](https://ascn.ai/en/templates/native-comment-lead-generation-agent) |
| 33 | [Inbound Sales Pro — ИИ-продажник с полной воронкой](33-inbound-sales-pro-published/) | ИИ-агент входящих продаж: квалифицирует лидов, презентует оффер, обрабатывает возражения по фреймворку… | [RU](https://ascn.ai/ru/templates/ai-inbound-sales-agent-telegram) · [EN](https://ascn.ai/en/templates/ai-inbound-sales-agent-telegram) |
| 34 | [PPC Audit Agent](34-ppc-audit-agent-published/) | Your personal PPC analyst: audits ad accounts across Google, Meta, LinkedIn, and TikTok with 200+ automated… | [RU](https://ascn.ai/ru/templates/ai-ppc-audit-agent-google-meta-ads) · [EN](https://ascn.ai/en/templates/ai-ppc-audit-agent-google-meta-ads) |
| 35 | [Google Maps Lead Hunter](35-gmaps-lead-hunter-published/) | Search Google Maps by your criteria — niche, location, rating, count — and get a ready contact list with… | [RU](https://ascn.ai/ru/templates/google-maps-lead-scraper-agent) · [EN](https://ascn.ai/en/templates/google-maps-lead-scraper-agent) |

### Ещё в разработке / не опубликованы (10)

| # | Агент | Что делает |
|---|---|---|
| 36 | [Pinterest Traffic Agent](36-pinterest-traffic-agent/) | Studies your niche, designs premium pins (AI image + caption + SEO copy), and publishes them to Pinterest… |
| 37 | [SMM Content Factory](37-smm-content-factory/) | Researches trends, writes a weekly batch of posts adapted per social network, generates an image for each,… |
| 38 | [Competitor Price Watch](38-competitor-price-watch/) | Checks your competitors' pricing pages every morning, compares them to yesterday, and sends a short summary… |
| 39 | [Warm Lead Nurture](39-warm-lead-nurture/) | Watches leads who said "I'll think about it", and when they go quiet writes a short, personal follow-up… |
| 40 | [Inbound Request Router](40-inbound-request-router/) | Watches your inbound channels, sorts every request by type and urgency, logs it in your CRM, and notifies… |
| 41 | [Ad Creative Generator](41-ad-creative-generator/) | From your brief, produces a batch of ready ad variants — five texts on different hooks, each with its own… |
| 42 | [CRO Conversion Optimizer](42-cro-conversion-optimizer/) | Give it a landing page URL or paste your copy, and it runs a conversion audit, rewrites the weak elements… |
| 43 | [Growth Experiment Engine](43-growth-experiment-engine/) | Runs a disciplined growth-testing program: captures test ideas into an ICE-ranked backlog, designs the… |
| 44 | [Personal Assistant](44-personal-assistant/) | AI chief of staff for email & calendar: triages the inbox, turns emails and meetings into tracked tasks, watches deadlines, sends a morning brief — drafts replies, never sends. |
| 45 | [Messenger Concierge](45-messenger-concierge/) | 24/7 front desk in Telegram: answers customers, takes orders, books appointments, sends reminders — only from your facts, escalates the rest. |

## Структура папки агента

```
NN-agent-name/
├── README.md          # витрина: что делает, ценность, ROI
├── DEPLOY_PROMPT.md   # промпт для деплоя в ASCN
├── INTEGRATIONS.md    # какие интеграции нужны
├── AUTOMATIONS.md     # cron-задачи и триггеры
└── workspace/         # рабочее пространство агента
    ├── IDENTITY.md    # роль, функции, границы
    ├── SOUL.md        # характер + правила безопасности
    ├── ONBOARDING.md  # пошаговый онбординг пользователя
    ├── skills/        # скиллы с алгоритмами (premium)
    └── knowledge/     # шаблоны и плейбуки (premium)
```

## Ссылки

- [ASCN Agent](https://ascn.ai) — платформа для создания AI-агентов
- [Маркетплейс](https://ascn.ai) — все агенты доступны для установки
