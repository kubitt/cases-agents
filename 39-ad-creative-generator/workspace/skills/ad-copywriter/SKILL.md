---
name: ad-copywriter
description: Write 5 ad variants on different hooks within platform limits. Use right after brief-intake, or on "write ad copy for {campaign}".
---

# Ad copywriter

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: produce five distinct ad variants — one per hook — that fit the platform's limits and follow the brand's honesty rules, so creative-packager only needs to add images.

## Algorithm
1. Read the brief, platform limits, and prior-test summary from brief-intake, plus hook rules in knowledge/HOOKS_LIBRARY.md.
2. Write one variant per hook (skip a hook only if the brief can't support it honestly):
   - pain — open with the problem ("Losing an hour a day to status meetings?")
   - benefit — open with the result ("Get 4 hours a week back")
   - social proof — a real number/case ("500 ops teams cut meeting time with...")
   - urgency — only if a real deadline exists ("Spring pricing ends April 30")
   - curiosity — an open loop ("The status-meeting fix most teams miss")
3. Format each variant to the platform limits (defaults; adjust per brief):
   - headline ≤ 30 characters, primary text ≤ 90 characters, description ≤ 90 characters
4. Enforce SOUL: real facts only, banned words excluded (best, unique, top, guaranteed), no manufactured urgency.
5. Write a short English image brief per variant for creative-packager: a scene matching the hook and offer, "minimal/no text, no people, no logos" unless the brief says otherwise.
6. Hand the 5 variants + image briefs to creative-packager.

## Output (5 variants handed to creative-packager)
```
1. pain     | H: "Meetings eating your day?" | Text: "Cut status meetings 30%. See how." | Desc: "For 10–50-person teams."
2. benefit  | H: "Get 4 hours/week back" | Text: "Less status, more shipping." | Desc: "Try it free."
3. proof    | H: "Teams save 4 h/week" | Text: "A 5-person studio did it in a month." | Desc: "Real results."
4. urgency  | H: "Spring pricing ends Apr 30" | Text: "Lock the Pro plan now." | Desc: "No discounts after."
5. curiosity| H: "The meeting fix teams miss" | Text: "It's not fewer meetings." | Desc: "Here's what works."
image_briefs: 1) "tired person at a desk buried in calendar invites, muted tones, no text"; 2) "..." ...
```

## Edge cases
- Missing real proof → drop or generalize the social-proof variant; replace with a second benefit angle rather than inventing a number.
- No real deadline → skip urgency; use a second curiosity or pain angle instead of fake scarcity.
- Very tight platform limit (e.g., X/TikTok) → prioritize headline + one line; trim ruthlessly, never exceed the limit.
- Non-Latin language → write ad copy in the target language; keep image briefs in English.
