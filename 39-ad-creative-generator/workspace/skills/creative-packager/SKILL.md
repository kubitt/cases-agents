---
name: creative-packager
description: Generate an image per ad variant, assemble the package, and log the test history. Use right after ad-copywriter.
---

# Creative packager

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: turn the 5 text variants into a ready creative package (text + image each), deliver it, and record the batch so testing compounds over time. This step writes and runs a small Python helper in files/scripts/.

## Algorithm
1. Take the 5 variants + image briefs from ad-copywriter. Read secret OPENROUTER_API_KEY.
2. For each variant, generate an image: POST to OpenRouter chat completions with model `google/gemini-2.5-flash-image` and the image brief; save the base64 image to files/tmp/. Use the platform's aspect ratio (Meta feed 1:1 or 4:5, Stories/TikTok 9:16) from the brief.
3. Assemble the package: pair each image with its headline/text/description; save all to a Google Drive folder "Ad Creatives / {campaign} / {date}".
4. Deliver to Telegram: the 5 variants as a numbered list (hook — headline — image) plus the Drive link.
5. Log to Google Sheets "Ad Tests": one row per variant (date, campaign, platform, hook, headline, status=new, drive_link). Leave a CTR column for the user to fill after running.
6. On a later "results" message, read back CTR per hook, mark winners/losers, and tell brief-intake which hooks to favor next round.

## Helper snippet (the agent writes this to files/scripts/gen_ad_image.py, then runs it)
```python
import os, base64, requests
def gen_image(brief, out):
    r = requests.post("https://openrouter.ai/api/v1/chat/completions",
        headers={"Authorization": f"Bearer {os.environ['OPENROUTER_API_KEY']}"},
        json={"model": "google/gemini-2.5-flash-image",
              "messages": [{"role": "user", "content": brief}]}, timeout=120)
    r.raise_for_status()
    url = r.json()["choices"][0]["message"]["images"][0]["image_url"]["url"]
    open(out, "wb").write(base64.b64decode(url.split(",", 1)[1])); return out
```

## Output (Telegram delivery)
```
Ad creatives ready — "Spring launch / Pro plan" (5 variants)
1. pain — "Meetings eating your day?" — image ✓
2. benefit — "Get 4 hours/week back" — image ✓
3. proof — "Teams save 4 h/week" — image ✓
4. urgency — "Spring pricing ends Apr 30" — image ✓
5. curiosity — "The meeting fix teams miss" — image ✓
Package: [Google Drive link] | Logged to Ad Tests. Image cost: ~$0.25 (5 images).
Upload the winners to your ad manager; send me CTR later and I'll double down on what works.
```

## Edge cases
- Missing OPENROUTER_API_KEY → stop before spending credits, name the missing secret, point to Settings → Secrets.
- OpenRouter error on one image → retry once; if it still fails, deliver that variant as text-only and flag it, don't block the batch.
- No Google Drive connected → deliver images inline in Telegram and note the package isn't archived to Drive.
- Aspect ratio unknown → default to 1:1 and note it; the user can request 9:16 or 4:5.
- User sends CTR results → update "Ad Tests", never overwrite prior rows; summarize the winning hook for the next brief.
