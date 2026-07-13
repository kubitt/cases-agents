---
name: pin-publisher
description: Turn written pin fields into a live Pinterest pin. Use on "publish this pin", after pin-writer, and in autoposting runs. Handles image generation, the caption plaque, publishing, and the report.
---

# Pin publisher

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: take the four fields from pin-writer, produce a premium image with a caption plaque, get the user's approval, publish to Pinterest, and report the live pin. This step writes and runs a Python helper in files/scripts/.

## Algorithm
1. Gather inputs: the four fields (heading, title, description, imagePrompt) and, from knowledge/PIN_SETTINGS.md, the board_id, target link, and plaque style. Read secrets from the environment: OPENROUTER_API_KEY, PINTEREST_ACCESS_TOKEN, PINTBOT, TELEGRAM_CHAT_ID.
2. Generate the image: POST to OpenRouter chat completions with model `google/gemini-2.5-flash-image` and the imagePrompt; extract the returned base64 image. Save to files/tmp/.
3. Overlay the plaque with Pillow: fit the image to 1000x1500 (Pinterest 2:3), draw a semi-transparent dark band across the bottom, wrap and draw the heading in white with a Unicode font (see edge cases). Save the final pin.
4. Preview: send the finished pin to Telegram with heading + target link and ask "Publish? (yes / edit)". Stop and wait — unless this is an autoposting run (standing approval), then skip to step 5.
5. Publish to Pinterest API v5: POST /v5/pins with board_id, title, description, link (target), and the image as base64 media_source.
6. Report to Telegram: the live pin link, board, target link, and the approximate image cost (~$0.05). Log the heading + date in memory so pin-writer avoids repeats.

## Helper script (the agent writes this to files/scripts/pipeline.py, then runs it)
```python
import os, base64, textwrap, requests
from PIL import Image, ImageDraw, ImageFont

def gen_image(prompt):
    r = requests.post("https://openrouter.ai/api/v1/chat/completions",
        headers={"Authorization": f"Bearer {os.environ['OPENROUTER_API_KEY']}"},
        json={"model": "google/gemini-2.5-flash-image",
              "messages": [{"role": "user", "content": prompt}]}, timeout=120)
    r.raise_for_status()
    url = r.json()["choices"][0]["message"]["images"][0]["image_url"]["url"]
    return base64.b64decode(url.split(",", 1)[1])

def add_plaque(raw, heading, out="files/tmp/pin.jpg"):
    img = Image.open(requests.compat.BytesIO(raw)).convert("RGB").resize((1000, 1500))
    d = ImageDraw.Draw(img, "RGBA")
    try: font = ImageFont.truetype("DejaVuSans-Bold.ttf", 54)   # covers Latin + Cyrillic
    except: font = ImageFont.load_default()
    lines = textwrap.wrap(heading, width=24)
    band = 90 + 64 * len(lines)
    d.rectangle([0, 1500 - band, 1000, 1500], fill=(0, 0, 0, 150))
    y = 1500 - band + 40
    for ln in lines:
        d.text((60, y), ln, font=font, fill="white"); y += 64
    img.save(out, quality=90); return out

def publish(path, title, desc, link, board):
    b64 = base64.b64encode(open(path, "rb").read()).decode()
    r = requests.post("https://api.pinterest.com/v5/pins",
        headers={"Authorization": f"Bearer {os.environ['PINTEREST_ACCESS_TOKEN']}"},
        json={"board_id": board, "title": title[:100], "description": desc, "link": link,
              "media_source": {"source_type": "image_base64", "content_type": "image/jpeg", "data": b64}},
        timeout=60)
    r.raise_for_status(); return r.json()["id"]

def tg(path, caption):
    requests.post(f"https://api.telegram.org/bot{os.environ['PINTBOT']}/sendPhoto",
        data={"chat_id": os.environ["TELEGRAM_CHAT_ID"], "caption": caption},
        files={"photo": open(path, "rb")}, timeout=60)
```

## Output (Telegram report after publishing)
```
Live on Pinterest ✅
Heading: 10 ways to earn from your photos
Pin: https://pin.it/xxxx | Board: Photography income
Target link: example.com/photo
Image cost: ~$0.05 (OpenRouter)
```

## Edge cases
- Non-Latin heading with no matching font (Arabic, CJK, Thai) → download the right Noto Sans font (e.g., Noto Sans Arabic) into files/ via web, load it in place of DejaVuSans; DejaVuSans already covers Cyrillic and Latin.
- OpenRouter error or empty image → retry once; if it still fails, report the error and the balance hint, do not publish a blank pin.
- Pinterest returns 401/403 → the access token expired or lacks pins:write scope; tell the user to reissue it, keep the finished image so nothing is lost.
- Missing secret (any of the four) → stop before spending credits, name the exact missing secret, point to Settings → Secrets.
- User edits the heading at preview → rebuild the plaque only (reuse the same generated image, no new OpenRouter charge) and preview again.
