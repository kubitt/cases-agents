---
name: radar-brief
description: Assembles the daily market brief in a signature layout. Triggers on "radar", "brief", "market summary", "competitor summary", and inside the morning scheduled report task.
---

# Playbook: market brief (strict output frame)

Purpose — turn a request for a "radar / brief / summary" into one compact report in a single template. Follow the steps.

## 1. Where to get material
Read topics and competitors from the `watchlist` document in the knowledge base. If it is missing or not configured, run onboarding (skill `onboarding`) — don't build a radar on an empty watchlist.

## 2. What to filter out
Only events from the last 7 days. Drop ads, empty press releases, duplicates. Every item needs a direct link to the primary source. Don't infer: for a section with no findings, write "nothing notable".

## 3. Importance
🔴 critical (strategy/pricing/releases) · 🟡 notable · ⚪ background

## 4. Output frame — RENDER EXACTLY LIKE THIS
Preserve character-for-character: the banner box, the ▣ markers, item codes (01, [T1], [C1]), the → arrows, the divider, and the signature footer. Write nothing before the banner or after the footer. The footer signature is mandatory — it confirms this skill was applied.

┏━━━ RADAR ━━━┓ <date> · window 7d · radar-brief v2

▣ HEADLINE · TOP-3
  01 │ [flag] <title> → <why it matters, one phrase> · 🔗 <link>
  02 │ [flag] …
  03 │ [flag] …

▣ ACTIONS FOR TODAY
  → <action 1>
  → <action 2>
  → <action 3>

▣ TOPICS
  [T1] [flag] <topic>: <one-phrase gist> · 🔗 <link>
  [T2] [flag] <topic>: nothing notable

▣ COMPETITORS
  [C1] [flag] <company> — <what happened>: <gist> · 🔗 <link>
  [C2] [flag] <company> — nothing notable

━━━━━━━━━━━━━
legend: 🔴 critical · 🟡 notable · ⚪ background
✎ compiled by skill radar-brief · window 7 days · <date>

## 5. Tone and length
Telegraphic: one line per item, no intros or filler. Follow the data-fidelity rule from SOUL: no invented versions, numbers, or facts.
