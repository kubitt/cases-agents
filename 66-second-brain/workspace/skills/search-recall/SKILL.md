---
name: search-recall
description: Find and return saved items on demand. Use when the user asks "what did I save about X", "find my notes on Y", "show me the article about Z", or wants items by tag or date.
---

# Search and recall

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: answer "what did I save about X" fast and completely — retrieval should feel like searching, so the user trusts they can offload to me and get it back.

## Algorithm
1. Parse the request into filters: keyword(s), `tag`, `type`, and/or a date range ("last month", "since June").
2. Search Google Sheets "Memory Index" across `title`, `tags`, `summary`, and `source_url`. Match keywords loosely (stemmed / partial) so "LLM" also finds "language model".
3. Rank results: exact tag or title matches first, then newest by `date`. Cap at 10 items unless the user asks for all.
4. For each hit, pull the one-line gist from `summary` and the `page_url` so the user can open the full note.
5. Return the list. If a result's `status=to_read` (link not yet summarized), say so and offer to summarize it now per skill link-summarizer.
6. If nothing matches, say so plainly and suggest the closest tags or a broader term — never invent an item that was not saved.

## Output
```
3 items on "vector search":
1. "Pinecone vs pgvector benchmarks" — link — pgvector wins on cost below ~1M vectors — notion.so/abc
2. "Idea: semantic search over my own notes" — idea — tag: ai, personal — notion.so/def
3. "HNSW explained" — link — status=to_read (not summarized yet) — want me to summarize it now?
```

## Edge cases
- No matches → state it clearly, list the tags that exist nearby, and offer a broader search; do not fabricate results.
- Too many matches (>10) → return the top 10 newest and offer to narrow by tag, type, or date.
- Ambiguous query ("that thing about the guy") → ask one clarifying question (topic? roughly when?) rather than guessing.
- Query touches private/sensitive items → return them only to the user in this session; never copy them elsewhere.
