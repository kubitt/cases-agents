---
name: signal-research
description: Research a hiring company before outreach. Use for every new company in the pipeline, on "research company X", and during the night sweep for rows with status=new.
---

# Signal research

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: in 5-10 minutes, build a short dossier that yields ONE concrete hiring signal for a personal opener, with a source_url for every fact.

## Algorithm
1. Read the posting: role title, seniority, salary or budget hint, location, and what the role would own. Save posted_role and budget_signal; keep the posting link as source_url.
2. Read the company site (home, about, product/services): what they sell, to whom, and scale (team, locations, clients).
3. Web search "<company> news", "<company> hiring", last 6 months: is this one role or many? Multiple hires or a repeated repost = stronger pain. Note the strongest signal.
4. Map the signal to knowledge/OFFER_ICP.md: state the bridge as "posted role -> their likely pain -> how your service covers it faster or cheaper".
5. Decision-maker: find the hiring manager, founder, or recruiter on the site or official pages. Take emails from official public pages only; none found -> set need_contact in notes and NEVER invent an address.

## Output (to the "Outreach Pipeline" columns budget_signal/source_url/notes; full dossier on request)
```
Company: BrightDesk | brightdesk.io | B2B support software, ~40 staff, 1 office
Posted role: Customer Support Lead, salary listed 90-110k
Budget signal: hiring a full-time lead + 2 support reps posted this week (multi-hire)
Bridge: scaling support headcount -> slow first-response, rising cost -> AI triage clears the backlog without 3 hires
Contact: Maria Ortiz, Head of Ops (source: brightdesk.io/team)
Email: hiring@brightdesk.io (generic; personal not found)
source_url: [posting URL] + [2 more URLs]
```

## Edge cases
- No site or unreachable -> set status stays new with need_info in notes, ask the user; cap effort at 3 minutes.
- No clear signal (single quiet posting) -> use a fact from the posting itself ("the role asks for manual reporting you could automate"); honesty beats flash.
- Duplicate (company + posted_role already in the sheet) -> don't add a row; update the existing one and note duplicate_check in notes.
- Unverifiable salary or detail -> mark it "unverified" in notes rather than presenting it as fact.
