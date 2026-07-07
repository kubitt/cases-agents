# Domain calibration (for finding and scoring leads)

> Your reference file. The agent reads it before working and updates it as it learns. Edit freely.

Reference file, not user-facing. It helps decide who counts as a lead and how to score fit. The product specifics come from onboarding (see ONBOARDING.md → "Product"). Until onboarding is done, use the DEMO defaults below.

## What counts as a lead
A person, in a public post/comment, who:
- describes a problem the owner's product solves, in their own words, or
- asks for a tool / recommendation to do a job the product does, or
- says they want to build/automate something the product handles.

Not a lead: news, benchmarks, hype, pure tech bugs with no job-to-be-done, and marketing copy dressed as a user voice.

## ICP scoring rubric (deterministic — score every lead the same way)
Rate five dimensions 0-2, then compute:

`score = 30*(pain_clarity/2) + 30*(solution_fit/2) + 15*(authority/2) + 15*(reachability/2) + 10*(recency/2)`

Range 0-100. Tiers: **hot / QUALIFIED ≥ 70**, **warm / NEEDS_REVIEW 40-69**, **cold / REJECTED < 40**.

- **pain_clarity** — 0 vague · 1 clear pain · 2 explicit + specific task
- **solution_fit** — 0 the product is a stretch · 1 it helps · 2 near-perfect fit
- **authority** — 0 unknown · 1 works there · 2 owner / decision maker
- **reachability** — 0 no path · 1 can reply in-thread · 2 clear handle/DM
- **recency** — 0 >30 days · 1 last 30 days · 2 last 7 days

Only hot/warm get a comment. Reject anything matching the Anti-ICP or where the product genuinely doesn't help — better to drop than to spam.

## DEMO defaults (used until onboarding fills the real product)
Demo niche = selling done-for-you AI agents (built on ASCN).
- Offer: "I build custom AI agents that take repetitive work off your plate, or get you set up to build your own, no code."
- ICP: founders, solopreneurs, ops/marketing people, agency owners who want an AI agent but don't want to build it from scratch. Global, English.
- Anti-ICP: enterprises with in-house ML teams; pure developers wanting a framework; free-only; sci-fi/AGI seekers.
- Signals to match: wants to build/buy an agent · asks how/which platform · wishes a tool would just DO task X · wants to automate but Zapier/Make is too rigid or too technical.
- Honesty guardrails: no cloud-browser control, no auto-posting to social, no voice calls, no WhatsApp channel; automates clear repeatable tasks — no magic.

## Competitors/tools to recognize in posts
Chat assistants that answer but don't act (ChatGPT, Claude, Gemini). Workflow tools that are rigid/manual (Zapier, Make, n8n). Agent platforms (Lindy, Relevance AI, Gumloop, Manus). When a lead names these with frustration, solution_fit is usually high.

## Tone of comments
Dry, concrete, in the audience's words. No "transformation", "synergy", "unlock", "supercharge". Any numbers must come from the product knowledge base, not invented.
