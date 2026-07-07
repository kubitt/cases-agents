# Маркеры боли и рецепты источников

## Маркеры боли (фразы, по которым люди жалуются)
Регистронезависимо. Используй для генерации запросов и для предфильтра до разметки.

**EN:** how do I, frustrated with, alternative to, doesn't work, broken, waste of time, hate that, wish there was, tired of, sick of, is there a tool, any way to, struggling with, too complicated, too expensive, gave up on, stuck with, manually, by hand, fed up.

**RU:** как мне, как автоматизировать, бесит, замучился, надоело вручную, не работает, сломалось, альтернатива, есть ли способ, устал от, достало, можно ли как-то, слишком сложно, слишком дорого, забил на, вручную, руками, нет времени на.

Предфильтр: элемент идёт в разметку, только если в тексте есть хотя бы один маркер ИЛИ вопросительная форма ИЛИ явная фрустрация.

## Сборка запросов
Для каждой темы: `seed_keyword` × несколько маркеров. Пример для «сложность Zapier»:
`Zapier too complicated`, `n8n alternative`, `make.com too complex`, `automation without coding`.

---

## Рецепты источников

### Hacker News — Algolia API (без ключа, бесплатно) — приоритет для smoke-теста
- Комментарии: `https://hn.algolia.com/api/v1/search?query=<URL-encoded>&tags=comment&hitsPerPage=20`
- Истории: `https://hn.algolia.com/api/v1/search?query=<URL-encoded>&tags=story&hitsPerPage=20`
- Свежесть: добавь `&numericFilters=created_at_i>UNIXTS` (TS = граница окна).
- Поля ответа (`hits[]`): `comment_text` или `story_text`/`title` → text; `points` или `num_comments` → engagement; `created_at` → timestamp; url = `https://news.ycombinator.com/item?id=<objectID>`; автор `author` → НЕ хранить, только хеш.
- Дёргать через `clawman__web_fetch` (GET по URL) или `shell` + curl.

### Stack Exchange (без ключа — низкий лимит; ключ поднимает лимит)
- `https://api.stackexchange.com/2.3/search/advanced?order=desc&sort=relevance&q=<query>&site=softwarerecommendations`
- Также `site=stackoverflow`, `site=webapps`. Ответ gzip — клиент сам распакует; поля: `items[].title`, `items[].link`, `score` → engagement, `creation_date` → timestamp.

### Reddit (нужен OAuth)
- Если в Секретах есть `REDDIT_CLIENT_ID` + `REDDIT_CLIENT_SECRET`: получи токен на `https://www.reddit.com/api/v1/access_token` (grant_type=client_credentials), затем `https://oauth.reddit.com/search` с `User-Agent`. Сабреддиты под домен: automation, SaaS, Entrepreneur, smallbusiness, nocode, sales, ArtificialIntelligence, ChatGPT.
- Если ключей нет: fallback — `clawman__web_search` по запросу `<seed> site:reddit.com`, затем `clawman__web_fetch` лучших тредов за реальными цитатами.
- ВАЖНО: с мая 2026 Reddit блокирует безавторизационные `.json`-запросы — только OAuth или web_search-fallback. Бесплатный тариф — некоммерческий (для ресёрча — ок).

### Веб / форумы
- `clawman__web_search` по запросу → `clawman__web_fetch` 1–2 самых релевантных страниц за дословными цитатами. Хорошо для IndieHackers, Reddit (через поиск), профильных форумов.

### X / Twitter
- Выкл по умолчанию. Бесплатного чтения нет (с 02.2026). Подключать только через сторонний TwitterAPI.io и только если бесплатных источников мало.

## Приватность и лимиты
- Ник автора → sha256-хеш, в открытом виде не хранить.
- Дедуп по `url` и по нормализованному хешу текста.
- 429 → экспоненциальная пауза, продолжай с другими источниками.
- Идемпотентность: уже собранные `id` помни (`pain_miner_seen_ids`), не пережёвывай повторно.
