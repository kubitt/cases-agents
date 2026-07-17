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

Всего агентов: **74**. Опубликовано в маркетплейсе: **38**. Не опубликовано / в разработке: **36**.

### Опубликованы в маркетплейсе (38)

| # | Агент | Что делает | Маркетплейс |
|---|---|---|---|
| 01 | [Outbound-машина (AI SDR) / Outbound Machine](01-ai-sdr-outbound-published/) | Персональный SDR: сам ресёрчит каждого проспекта, пишет не-шаблонные письма и ведёт цепочки касаний — вы… | [RU](https://ascn.ai/ru/templates/ai-sdr-agent-outbound-sales-automation) · [EN](https://ascn.ai/en/templates/ai-sdr-agent-outbound-sales-automation) |
| 02 | [AR-коллектор PRO / AR Collector Pro](02-ar-collector-pro-published/) | Возвращает дебиторку без вашего участия: ведёт напоминания по нарастающим стадиям, разбирает ответы долж… | [RU](https://ascn.ai/ru/templates/ai-accounts-receivable-collections-automation) · [EN](https://ascn.ai/en/templates/ai-accounts-receivable-collections-automation) |
| 03 | [Юрист первой линии (redline договоров) / First-Line Contract Redliner](03-contract-redline-published/) | Входящий договор → redline-правки по каждому рискованному пункту и вердикт «подписать / торговаться / эс… | [RU](https://ascn.ai/ru/templates/ai-contract-review-redline-legal-agent) · [EN](https://ascn.ai/en/templates/ai-contract-review-redline-legal-agent) |
| 04 | [RFP/тендер-ответчик / RFP Responder](04-rfp-responder-published/) | RFP или тендерная документация → чек-лист требований с go/no-go и собранный секция-за-секцией ответ на я… | [RU](https://ascn.ai/ru/templates/ai-rfp-response-proposal-automation) · [EN](https://ascn.ai/en/templates/ai-rfp-response-proposal-automation) |
| 05 | [Финансовый пакет + runway (аутсорс-CFO) / CFO Financial Package & Runway](05-cfo-financial-package-published/) | Из сырых выгрузок банка и CRM — месячный финансовый пакет с комментариями к отклонениям и живой 13-недел… | [RU](https://ascn.ai/ru/templates/ai-cfo-financial-reporting-runway-forecast) · [EN](https://ascn.ai/en/templates/ai-cfo-financial-reporting-runway-forecast) |
| 06 | [SaaS-аудитор расходов / SaaS Spend Auditor](06-saas-spend-auditor-published/) | Находит все подписки компании по квитанциям в почте и банковским выпискам, выносит вердикт по каждой и л… | [RU](https://ascn.ai/ru/templates/ai-saas-spend-auditor-cut-subscription-costs) · [EN](https://ascn.ai/en/templates/ai-saas-spend-auditor-cut-subscription-costs) |
| 07 | [HR-скринер PRO / HR Screener PRO](07-hr-screener-pro-published/) | Превращает 300 откликов в шорт-лист с объяснимыми оценками, а транскрипты интервью — в скоркарды с цитат… | [RU](https://ascn.ai/ru/templates/ai-resume-screening-candidate-scoring-agent) · [EN](https://ascn.ai/en/templates/ai-resume-screening-candidate-scoring-agent) |
| 08 | [GEO-оптимизатор / GEO Optimizer](08-geo-optimizer-published/) | Делает ваш сайт цитируемым источником для ChatGPT, Perplexity и AI Overviews: аудит цитируемости, перепи… | [RU](https://ascn.ai/ru/templates/geo-generative-engine-optimization-agent) · [EN](https://ascn.ai/en/templates/geo-generative-engine-optimization-agent) |
| 09 | [Фабрика локальных SEO-страниц / Local SEO Page Factory](09-local-seo-factory-published/) | Для локальных сервисных бизнесов: десятки уникальных страниц «услуга + город/район» с локальными деталям… | [RU](https://ascn.ai/ru/templates/local-seo-landing-page-generator-agent) · [EN](https://ascn.ai/en/templates/local-seo-landing-page-generator-agent) |
| 10 | [Lifecycle-email конструктор / Lifecycle Email Builder](10-lifecycle-email-builder-published/) | Полная система удержания клиентов из одного описания бизнеса: сегменты, ветки писем, копирайт, тайминги… | [RU](https://ascn.ai/ru/templates/lifecycle-email-marketing-automation-agent) · [EN](https://ascn.ai/en/templates/lifecycle-email-marketing-automation-agent) |
| 11 | [Голос клиента → продающий копирайт (VoC-майнер) / VoC Copy Miner](11-voc-copy-miner-published/) | Собирает дословные фразы клиентов из отзывов — ваших и конкурентов — и превращает их в хуки, заголовки и… | [RU](https://ascn.ai/ru/templates/voice-of-customer-copy-mining-agent) · [EN](https://ascn.ai/en/templates/voice-of-customer-copy-mining-agent) |
| 12 | [Battlecards для отдела продаж / Sales Battlecards](12-sales-battlecards-published/) | Боевые карточки по каждому конкуренту из открытых источников + еженедельный мониторинг изменений — прода… | [RU](https://ascn.ai/ru/templates/ai-sales-battlecards-competitive-intelligence) · [EN](https://ascn.ai/en/templates/ai-sales-battlecards-competitive-intelligence) |
| 13 | [Отчёт для руководства + HTML-дашборд / Management Report + Dashboard](13-management-report-published/) | Каждый понедельник — нарративный KPI-отчёт с комментариями к отклонениям и действиями, плюс интерактивны… | [RU](https://ascn.ai/ru/templates/ai-management-kpi-report-dashboard-agent) · [EN](https://ascn.ai/en/templates/ai-management-kpi-report-dashboard-agent) |
| 14 | [Инвестор-апдейт и борд-дек / Investor Update & Board Deck](14-investor-update-published/) | Send-ready письмо инвесторам из реальных цифр в Sheets — с честными lowlights и конкретными asks; по зап… | [RU](https://ascn.ai/ru/templates/ai-investor-update-report-generator) · [EN](https://ascn.ai/en/templates/ai-investor-update-report-generator) |
| 15 | [ICP-инженер из win/loss данных / ICP Engineer](15-icp-engineer-published/) | Выводит портрет идеального клиента из вашей реальной истории сделок: какие сигналы статистически отличаю… | [RU](https://ascn.ai/ru/templates/ai-icp-win-loss-analysis-agent) · [EN](https://ascn.ai/en/templates/ai-icp-win-loss-analysis-agent) |
| 16 | [Хайринг-кит под ключ / Hiring Kit Builder](16-hiring-kit-published/) | Назовите роль — получите полный комплект для найма: JD, вилку зарплаты с источниками, 4-этапную воронку… | [RU](https://ascn.ai/ru/templates/ai-hiring-kit-job-description-offer-generator) · [EN](https://ascn.ai/en/templates/ai-hiring-kit-job-description-offer-generator) |
| 17 | [Бейджи с выставки → пайплайн / Event Leads Pipeline](17-event-leads-pipeline-published/) | CSV со сканами бейджей после выставки → каждый контакт обогащён ресёрчем, отскорен и получает персональн… | [RU](https://ascn.ai/ru/templates/event-lead-capture-follow-up-automation) · [EN](https://ascn.ai/en/templates/event-lead-capture-follow-up-automation) |
| 18 | [Мульти-клиент отчёты для агентств / Agency Client Reports](18-agency-client-reports-published/) | Для агентств (SEO/SMM/перфоманс): месячные брендированные отчёты всем клиентам — за одну сессию вместо н… | [RU](https://ascn.ai/ru/templates/ai-agency-client-reporting-automation) · [EN](https://ascn.ai/en/templates/ai-agency-client-reporting-automation) |
| 19 | [Генератор коммерческих предложений](19-commercial-offer-generator-published/) | Генератор КП: менеджер описывает сделку → структурированное КП в Google Doc | [RU](https://ascn.ai/ru/templates/ai-commercial-proposal-generator) · [EN](https://ascn.ai/en/templates/ai-commercial-proposal-generator) |
| 20 | [Финансовый помощник для малого бизнеса](20-financial-smb-assistant-published/) | Финансовый ассистент для МСБ: учёт, аналитика, Google Sheets интеграция | [RU](https://ascn.ai/ru/templates/ai-financial-assistant-for-small-business) · [EN](https://ascn.ai/en/templates/ai-financial-assistant-for-small-business) |
| 21 | [AI-продавец в Telegram](21-tg-sales-bot-published/) | AI-продавец в Telegram. Выявляет потребность, презентует продукт, закрывает возражения, ведёт к покупке. | [RU](https://ascn.ai/ru/templates/ai-telegram-sales-bot) · [EN](https://ascn.ai/en/templates/ai-telegram-sales-bot) |
| 22 | [SMM-агент для Telegram-каналов](22-tg-smm-agent-published/) | SMM-агент для Telegram-канала. Пишет посты и публикует их — по команде или по расписанию. | [RU](https://ascn.ai/ru/templates/ai-telegram-smm-content-agent) · [EN](https://ascn.ai/en/templates/ai-telegram-smm-content-agent) |
| 23 | [B2B лидогенерация и холодный аутрич](23-b2b-leadgen-published/) | Полный цикл B2B аутрича: находит компании → собирает email → пишет персональные письма → отправляет чере… | [RU](https://ascn.ai/ru/templates/ai-b2b-lead-generation-agent) · [EN](https://ascn.ai/en/templates/ai-b2b-lead-generation-agent) |
| 24 | [Ресёрч компаний для продаж](24-sales-researcher-published/) | B2B-разведчик: собирает полное досье на компанию и контакт за 2-3 минуты. Для подготовки к звонку. | [RU](https://ascn.ai/ru/templates/ai-sales-research-account-prep-agent) · [EN](https://ascn.ai/en/templates/ai-sales-research-account-prep-agent) |
| 25 | [CRM в Google Sheets](25-crm-google-sheets-published/) | Голосовой интерфейс к CRM в Google Sheets. Добавляй сделки, обновляй статусы, получай сводку — через чат… | [RU](https://ascn.ai/ru/templates/ai-crm-in-google-sheets-agent) · [EN](https://ascn.ai/en/templates/ai-crm-in-google-sheets-agent) |
| 26 | [AI-команда для создания контента](26-ai-content-writer-published/) | Из одной идеи — полный контент-пакет: статья, посты LinkedIn/X/Telegram, сохраняет в Google Docs. | [RU](https://ascn.ai/ru/templates/ai-content-writing-team-agent) · [EN](https://ascn.ai/en/templates/ai-content-writing-team-agent) |
| 27 | [Репурпозинг контента по платформам](27-content-repurposer-published/) | Переупаковывает любой контент (YouTube, статья, текст) в посты для LinkedIn, X, Telegram. | [RU](https://ascn.ai/ru/templates/ai-content-repurposing-agent) · [EN](https://ascn.ai/en/templates/ai-content-repurposing-agent) |
| 28 | [SEO-копирайтер](28-seo-copywriter-published/) | SEO-копирайтер: пишет статьи под ключевые слова, оптимизирует существующий контент, анализирует конкурен… | [RU](https://ascn.ai/ru/templates/ai-seo-copywriter-article-generator) · [EN](https://ascn.ai/en/templates/ai-seo-copywriter-article-generator) |
| 29 | [29-market-radar-published](29-market-radar-published/) |  | — |
| 30 | [30-ozon-analyst-published](30-ozon-analyst-published/) |  | — |
| 31 | [Майнер болей аудитории / Pain Miner](31-pain-miner-published/) | Находит, какими словами реальные люди описывают боли, которые закрывает ваш продукт, — из Hacker News, R… | [RU](https://ascn.ai/ru/templates/ai-audience-pain-research-agent) · [EN](https://ascn.ai/en/templates/ai-audience-pain-research-agent) |
| 32 | [Native Comment Finder](32-native-comment-leadgen-published/) | Finds fresh public posts where people describe a problem your product solves, writes a ready-to-paste na… | [RU](https://ascn.ai/ru/templates/native-comment-lead-generation-agent) · [EN](https://ascn.ai/en/templates/native-comment-lead-generation-agent) |
| 33 | [Inbound Sales Pro — ИИ-продажник с полной воронкой](33-inbound-sales-pro-published/) | ИИ-агент входящих продаж: квалифицирует лидов, презентует оффер, обрабатывает возражения по фреймворку A… | [RU](https://ascn.ai/ru/templates/ai-inbound-sales-agent-telegram) · [EN](https://ascn.ai/en/templates/ai-inbound-sales-agent-telegram) |
| 34 | [PPC Audit Agent / Аудитор рекламных кабинетов](34-ppc-audit-agent-published/) | Your personal PPC analyst: audits ad accounts across Google, Meta, LinkedIn, and TikTok with 200+ automa… | [RU](https://ascn.ai/ru/templates/ai-ppc-audit-agent-google-meta-ads) · [EN](https://ascn.ai/en/templates/ai-ppc-audit-agent-google-meta-ads) |
| 35 | [Google Maps Lead Hunter](35-gmaps-lead-hunter-published/) | Search Google Maps by your criteria — niche, location, rating, count — and get a ready contact list with… | [RU](https://ascn.ai/ru/templates/google-maps-lead-scraper-agent) · [EN](https://ascn.ai/en/templates/google-maps-lead-scraper-agent) |
| 37 | [SMM Content Factory](37-smm-content-factory-published/) | Researches trends, writes a weekly batch of posts adapted per social network, generates an image for eac… | — |
| 44 | [Personal Assistant](44-personal-assistant-published/) | Your AI chief of staff for email and meetings: triages the inbox, turns messages and calls into tracked… | — |
| 45 | [Messenger Concierge](45-messenger-concierge-published/) | Your 24/7 front desk in Telegram: answers customers in seconds — questions, orders, bookings, reminders… | — |

### Ещё в разработке / не опубликованы (36)

| # | Агент | Что делает |
|---|---|---|
| 36 | [Pinterest Traffic Agent](36-pinterest-traffic-agent/) | Studies your niche, designs premium pins (AI image + caption + SEO copy), and publishes them to Pinteres… |
| 38 | [Competitor Price Watch](38-competitor-price-watch/) | Checks your competitors' pricing pages every morning, compares them to yesterday, and sends a short summ… |
| 39 | [Warm Lead Nurture](39-warm-lead-nurture/) | Watches leads who said "I'll think about it", and when they go quiet writes a short, personal follow-up… |
| 40 | [Inbound Request Router](40-inbound-request-router/) | Watches your inbound channels, sorts every request by type and urgency, logs it in your CRM, and notifie… |
| 41 | [Ad Creative Generator](41-ad-creative-generator/) | From your brief, produces a batch of ready ad variants — five texts on different hooks, each with its ow… |
| 42 | [CRO Conversion Optimizer](42-cro-conversion-optimizer/) | Give it a landing page URL or paste your copy, and it runs a conversion audit, rewrites the weak element… |
| 43 | [Growth Experiment Engine](43-growth-experiment-engine/) | Runs a disciplined growth-testing program: captures test ideas into an ICE-ranked backlog, designs the c… |
| 46 | [Market Research Factory](46-market-research-factory/) | Mines real user pain from public forums and reviews, ranks it into scored product opportunities, and tur… |
| 47 | [X Content Engine](47-x-twitter-automation/) | Researches what's trending in your niche, drafts on-brand X (Twitter) posts, and keeps a scheduled, appr… |
| 48 | [Daily Reddit Digest](48-daily-reddit-digest/) | Every morning: the top-performing posts from the subreddits you care about — ranked, de-duplicated, and… |
| 49 | [Earnings Tracker](49-earnings-tracker/) | Never miss an earnings report from a company you follow: a weekly look-ahead, then a plain-English, fact… |
| 50 | [Podcast Production Pipeline](50-podcast-production-pipeline/) | Hand off a topic and get back a full production package — research, outline and script, show notes, titl… |
| 51 | [Dynamic Dashboard](51-dynamic-dashboard/) | A live business dashboard that rebuilds itself every morning: it pulls your metrics from connected sourc… |
| 52 | [YouTube Content Engine](52-youtube-content-pipeline/) | Turns fresh, on-trend topics into ready-to-shoot video packages — titles, description, tags, thumbnail b… |
| 53 | [Circle Keeper (Personal CRM)](53-personal-crm/) | Keeps your personal and professional relationships warm — logs who you know, reminds you before you drif… |
| 54 | [Idea to Reality](54-idea-to-reality/) | Turns a raw idea into a validated, structured concept: it captures the idea, checks whether it already e… |
| 55 | [Sales Cadence Keeper](55-sales-cadence/) | Runs your daily follow-up cadence: an evening review captures where each deal stands, and every morning… |
| 56 | [Job-Post Prospector](56-hh-outreach/) | Turns fresh job postings into a warm B2B pipeline: finds companies hiring for a role you can deliver, re… |
| 57 | [Lead Scout (Top-of-Funnel Prospector)](57-lead-generation/) | Finds companies that match your ideal customer, researches and scores each one, and drops a qualified, r… |
| 58 | [SEO Optimizer](58-seo-optimizer/) | Your always-on SEO analyst: finds the keywords worth chasing, audits your pages, writes writer-ready con… |
| 59 | [Social Media Manager](59-social-media-manager/) | Runs your channels like an editor: plans a content calendar by theme, drafts every post and adapts it pe… |
| 60 | [Event Guest Confirmation](60-event-guest-confirmation/) | Runs your event's RSVP loop end to end — drafts and (after your OK) sends confirmation and reminder emai… |
| 61 | [Overnight Mini-App Builder](61-overnight-mini-app-builder/) | You describe a small app or tool; it builds a working MVP overnight and hands it to you by morning — wit… |
| 62 | [Project Manager](62-project-manager/) | Keeps every project on track: a daily standup digest, a board that mirrors your GitHub issues and PRs, a… |
| 63 | [Sales Enablement Copilot](63-sales-enablement/) | Prepares a sharp one-page brief for every sales meeting on your calendar — who's in the room, what to as… |
| 64 | [Ops Assistant](64-ops-assistant/) | Your team's internal operations desk in one place: a daily morning briefing, a weekly ops digest, task a… |
| 65 | [Brand Reputation Monitor](65-brand-reputation-monitor/) | Watches the public web for what people say about your brand, scores every mention positive or negative,… |
| 66 | [Second Brain](66-second-brain/) | Text it anything you want to remember — a note, a link, a book, an idea — and it captures, summarizes, a… |
| 67 | [Task Pilot](67-todoist-task-manager/) | Your personal task manager: captures every task, keeps them prioritized in one list, and hands you a rea… |
| 68 | [X Account Analyst](68-x-account-analysis/) | Turns your X (Twitter) posting history into a plain-language weekly review — which hooks, topics, and fo… |
| 69 | [Small-Business Assistant](69-business-assistant/) | Your right hand for the weekly numbers, the drafts, and the market: one assistant that reviews the busin… |
| 70 | [Business Planning & Reporting Officer](70-business-plugins/) | Drafts your business plans and strategy one-pagers, keeps one live KPI dashboard, and delivers a weekly… |
| 71 | [Social Intel Radar](71-social-intel-radar/) | Tells you what is actually working in your niche — competitor top posts, rising formats, hashtags, and s… |
| 72 | [LinkedIn Page Manager](72-linkedin-page-manager/) | Run a consistent, on-brand company LinkedIn Page without a full-time SMM or a monthly scheduler subscrip… |
| 73 | [Viral Short-Form Writer](73-viral-shortform-writer/) | Turns any topic, link, image, or rough idea into scroll-stopping hooks, ready-to-post captions, and tigh… |
| 74 | [Community Inbox Manager](74-community-inbox-manager/) | Answers pile up faster than you can reply — this agent triages every comment, message, and review you re… |

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
