# Memory Index Schema

> Your reference file. It documents how the "Memory Index" spreadsheet is structured so capture, search, and review stay consistent. Edit if you rename a column — the agent follows this file.
[FILLED DURING ONBOARDING — the agent creates the sheet from this schema and keeps it in sync]

## Table: "Memory Index" (Google Sheets)
(one row per captured item; plain field — meaning lines, no tables inside this file)
- date — when the item was captured (YYYY-MM-DD)
- type — one of: note, link, idea, book, quote, person, task
- title — short title, max ~8 words
- source_url — the original link (blank for a pure note)
- tags — comma-separated topics from the taxonomy in BRAIN_PROFILE.md
- status — one of: new, to_read, summarized, archived, done
- summary — my short summary (for links) or the gist (for notes); full text lives on the Notion page
- resurface_on — date the item should come back in a weekly review (YYYY-MM-DD, blank if none)
- page_url — link to the full Notion "Second Brain" page (or Google Doc) for this item

## Status meanings
- new — just captured link, not yet summarized (nightly processing will pick it up)
- to_read — a link the user wants later, or one that could not be read
- summarized — has a summary; the normal resting state for processed items
- archived — kept but hidden from reviews (only on user request)
- done — a task that is completed (only on user request)

## Store: Notion database "Second Brain"
- Each index row links to one Notion page via `page_url` holding the full note or summary.
- Without Notion, the full text lives in the `summary` cell of the Memory Index instead.

## Worked example (one filled row)
- date: 2026-08-11
- type: link
- title: The Log explained
- source_url: engineering.example.com/the-log
- tags: ai, engineering
- status: summarized
- summary: Append-only log as the backbone of data integration; derive views from it.
- resurface_on: 2026-09-10
- page_url: notion.so/second-brain/the-log

## Rules for this file
- Column names here are the single source of truth — they must match IDENTITY, the skills, and CRON_PLAYBOOK exactly.
- Never invent columns per item; extra detail goes on the Notion page, not into new spreadsheet columns.
