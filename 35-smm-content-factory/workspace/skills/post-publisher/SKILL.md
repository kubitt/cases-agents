---
name: post-publisher
description: Generate an image per post, assemble the approval package, and publish after approval. Use on "publish", image generation, and scheduled autoposting runs.
---

# Post publisher

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: take the written posts, add one image each, get the user's approval, then publish to the connected networks and log the results. This step writes and runs a small Python helper in files/scripts/.

## Algorithm
1. Gather the posts + image briefs from post-writer and the brand's networks from knowledge/BRAND_PROFILE.md. Read secret OPENROUTER_API_KEY (and BLOTATO_API_KEY / VK_TOKEN if publishing beyond Telegram).
2. For each post, generate an image: POST to OpenRouter chat completions with model `google/gemini-2.5-flash-image` and the image_brief; save the returned base64 image to files/tmp/.
3. Assemble the package and send it to Telegram for approval: for each post show the network, the first line, and the image. End with "Approve all / edit #N". Stop and wait — unless this is a scheduled autoposting run (standing approval), then skip to step 4.
4. Publish per network:
   - Telegram: post via the native Telegram channel to the brand's channel.
   - VK: POST to VK API wall.post (if VK_TOKEN set).
   - Instagram / X / LinkedIn: publish via Blotato API (if BLOTATO_API_KEY set); otherwise deliver the ready text+image package for manual posting.
5. Log each published post (network, topic, first line, date) to "SMM Content Log" so trend-research avoids repeats.
6. Report to Telegram: what published where, what needs manual posting, and the image cost (~$0.05 each).

## Helper snippet (the agent writes this to files/scripts/gen_image.py, then runs it)
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

## Output (Telegram report after publishing)
```
Package published ✅ (5 posts)
- Telegram: 5/5 live
- VK: 5/5 live
- Instagram / X / LinkedIn: package ready → [link] (manual or via Blotato)
Image cost: ~$0.25 (5 images) | Logged to SMM Content Log
```

## Edge cases
- Missing OPENROUTER_API_KEY → stop before spending credits, name the missing secret, point to Settings → Secrets.
- OpenRouter error on one image → retry once; if it still fails, ship that post text without an image and flag it, don't block the batch.
- No Blotato/VK connected → publish Telegram, hand the rest as a ready package; never claim a post went live when it didn't.
- User edits post #N at approval → rewrite only that post (and regenerate its image only if the brief changed), then re-show the package.
- Autoposting run with a banned-topic or unverified fact slipping in → skip that post, log why, publish the rest.
