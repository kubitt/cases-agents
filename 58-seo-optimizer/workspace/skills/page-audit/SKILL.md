---
name: page-audit
description: Audit a single web page for on-page and technical SEO. Use when the user says "audit this page", pastes a URL to review, or during the monthly deep scan of priority pages.
---

# Page audit

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: read one URL and return a short, prioritized fix list a person can act on today — no filler.

## Algorithm
1. Read the page: fetch the HTML and the visible text. Record title, meta description, the H1 and heading outline, word count, canonical tag, and whether structured data (Schema.org markup) is present.
2. On-page checks: title 50–60 characters and includes the target keyword; meta description 140–160 characters; exactly one H1; logical H2/H3 order; the target keyword and its variations used naturally; images have alt text.
3. Content depth: compare length and coverage to the top 3 live results for the page's target keyword — flag thin or missing subtopics (E-E-A-T means the content should show real experience and expertise, not just keywords).
4. Links: count internal links in and out; flag orphan pages and broken links found in the HTML.
5. Technical signals readable without a paid crawler: indexability (noindex tag, robots meta), canonical correctness, mobile viewport tag, HTTPS, and any obvious page-speed red flags. Structured data uses INP for speed, never the retired FID.
6. Pull the page's Search Console numbers (clicks, impressions, position) if connected, for context.
7. Score health 0–100 and sort findings into Critical / High / Medium / Low. Save a Google Doc "SEO Audit — <url>" and append a row to the "Audit Log" tab (columns: date, url, health_score, critical, high, medium, low, top_fix, doc_link).

## Output
Chat summary plus the Doc. Example:
- SEO Audit — /dental-crm | health_score: 62 | critical: 1 | high: 3 | medium: 4 | low: 2
- top_fix: title is 78 chars and missing the main keyword — rewrite to "Dental CRM for Clinics | Acme" (54 chars)
- Also flagged: two H1 tags; meta description missing; 900 words vs ~1,800 in top results.

## Edge cases
- Page unreachable or blocked → note it, do not score, ask the user to check access; cap effort at 3 minutes.
- No target keyword known → infer from the H1 and title, mark it assumed, and confirm with the user.
- Structured data eligible only for some pages → recommend FAQ markup only for government/healthcare pages; never recommend deprecated HowTo markup.
- Very long page (>5,000 words) → audit structure and top sections, note that a full read was sampled.
