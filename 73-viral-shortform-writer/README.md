# Viral Short-Form Writer

Turns any topic, link, image, or rough idea into scroll-stopping hooks, ready-to-post captions, and tight 15–60 second scripts — tuned to the platform you post on. You film and publish; it writes the words.

## Value & ROI
A short-form ghostwriter costs $500–1500/mo; hook and caption tools run $20–50/mo plus your own time. Manual idea-hunting, hook-writing, and scripting eats 30–60 minutes a day. This agent hands you finished hooks, captions, and scripts on command, in your voice. Total cost: $29/mo — fully native, no external API, no secrets, and you publish yourself. Payback vs $29: 17–50x — one month of a ghostwriter buys years of this.

## What it does
1. Generates 10 platform-tuned opening hooks per topic (skill hook-forge), each labelled with the platform signal it targets and ranked by scroll-stop strength with a one-line why.
2. Writes post-ready captions plus a fitted hashtag set for Reels, TikTok, Shorts, Threads, or Xiaohongshu (skill caption-craft), tuned to each platform's engagement signal.
3. Builds 15–60s scripts — hook -> build -> payoff -> CTA — with on-screen-text lines and shot notes, then offers a carousel or text-thread repurpose (skill short-script).
4. Reads a pasted image, screenshot, or rough script (native multimodal) and uses built-in web search for real trend context, so hooks aren't invented.
5. Keeps an "Idea Bank" and a "Swipe File" in Google Sheets so your best angles and winning patterns are never lost.
6. Once a week, scans your niche and drops 5 fresh angles into the Idea Bank so you never stare at a blank screen.

## Folder contents
- `workspace/` — copied into the ASCN agent workspace (IDENTITY, SOUL, ONBOARDING, AUTOMATIONS, skills, knowledge).
- `DEPLOY_PROMPT.md` — prompt for Claude Code that transfers everything to ASCN.
- `INTEGRATIONS.md` — which integrations are needed, why, and what they cost.

## Quick deploy
1. Open Claude Code in this folder.
2. Paste the contents of `DEPLOY_PROMPT.md`.
3. Send the agent "Hi, let's set up" — it runs its own onboarding (niche, voice, platforms, integrations, test run on your real topic).

## Required integrations
Native: Google Sheets (required), built-in web search + web reading (no setup), native multimodal reading of pasted images/scripts (no setup). External: none, no secrets. Channel: Telegram (recommended) or ASCN chat.

## Deliberate limitations
- It writes copy and scripts only — it does not post, film, edit video, or generate images. You publish; it writes the words.
- Built-in web search gives trend context, not a live trending-sound catalog or real competitor metrics — that needs a separate research agent plus a paid data API (optional upgrade, see INTEGRATIONS).
- Hook strength is expert judgment, not a guarantee of virality — it never promises views.
- It refuses engagement-bait the content can't deliver, and any spam or fake-engagement tactic — reputational and platform-rules risk.
