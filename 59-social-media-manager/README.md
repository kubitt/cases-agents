# Social Media Manager

Runs your channels like an editor: plans a content calendar by theme, drafts every post and adapts it per network, and holds it all in a strict approval queue so nothing goes out without your yes.

## Value & ROI
An in-house social media manager costs $600–1,500/mo; an agency retainer runs higher, and running it yourself burns 6–10 hours a week on planning, research, and copy. This agent does the planning and writing, keeps a real content calendar weeks ahead, and hands you an approve-ready queue — you tap approve and post. Total cost: $29/mo (ASCN Start, 10,000 credits) with ZERO external cost — trends come from built-in web search, the calendar lives in Google Sheets, drafts in Google Docs, approvals in Telegram, all native and free. Honest payback vs $29: roughly 15–50x versus a manager, and far more once a planned calendar stops the scramble of posting whatever comes to mind.

## What it does
1. Keeps a "Content Calendar" in Google Sheets — every slot has a date, content pillar, target network, working title, status, and a link to its draft.
2. Plans ahead by content pillar per skill content-planner: lays out the coming week (or month) of post slots so cadence is deliberate, not reactive.
3. Researches a real supporting angle for each post via built-in web search — every fact carries a source link, no invented trends.
4. Drafts each post in a "Post Drafts" Google Doc and adapts it per network — LinkedIn, X, Instagram, TikTok, Threads — respecting each network's length and format norms.
5. Runs an approval queue per skill approval-queue: statuses idea → drafted → in_review → approved → published; you approve, edit, or reject before anything is final.
6. Assembles an approve-ready package (final copy per network + the draft link) for you to publish; it logs what went out to avoid repeats.
7. Weekly plan-and-draft batch and a weekday queue digest keep the pipeline full and remind you what is ready to post today.

## Folder contents
- `workspace/` — copied into the ASCN agent workspace (IDENTITY, SOUL, ONBOARDING, CRON_PLAYBOOK, 3 skills, 2 knowledge files).
- `DEPLOY_PROMPT.md` — prompt for Claude Code that transfers everything to ASCN.
- `INTEGRATIONS.md` — which integrations are needed, why, what is free, and the optional paid upgrade.

## Quick deploy
1. Open Claude Code in this folder.
2. Paste the contents of `DEPLOY_PROMPT.md`.
3. Send the agent "Hi, let's set up" — it runs its own onboarding (~10 min: brand and networks, pillars, calendar, then it plans your first week and drafts one post you approve).

## Required integrations
Native, zero external cost: Google Sheets (the "Content Calendar"), Google Docs (the "Post Drafts" doc), built-in web search (trends), and Telegram (the approval queue) are recommended. External: none required. Channel: Telegram recommended. Optional upgrade: a paid multi-social posting API (e.g. OmniSocials, ~$19–39/mo) to auto-publish to closed-API networks after your confirmation — not wired into the core.

## Deliberate limitations
- **It plans, writes, adapts, and queues — it does not publish to closed-API networks itself.** Instagram, X, LinkedIn, and TikTok have no native ASCN posting connector, so the agent hands you an approve-ready package and you post it. Auto-publishing is an optional paid upgrade (see INTEGRATIONS.md), never in the core.
- **No image or video generation** — this agent owns planning and copy, not design; pair it with a design tool or a separate image agent for visuals.
- **No trend without a source.** It will not invent a "viral topic"; if web search finds nothing solid for a slot, it says so and writes from your own pillars instead.
- **One brand's own channels.** For agencies running many client brands, the multi-brand batch agent is the better fit; this one is built for an owner or in-house marketer running their own set of channels.
