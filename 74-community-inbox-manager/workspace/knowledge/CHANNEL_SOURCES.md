# Channel Sources

> Your reference file. It lists the channels the agent watches and how fast each priority should be answered. The agent reads it before every poll and you can edit it anytime.
[FILLED DURING ONBOARDING — the agent maintains this file as your sources change]

## Connected owned channels
(the inboxes the agent triages in native mode)
- Telegram: [FILL DURING ONBOARDING] (your bot or group)
- Slack: [FILL DURING ONBOARDING] (workspace / channel)
- Gmail: [FILL DURING ONBOARDING] (support address, if you use email)

## Public review pages to watch
(full URLs the agent reads on schedule; public pages only)
- [FILL DURING ONBOARDING] (e.g. your Google Business Profile page)
- [FILL DURING ONBOARDING] (e.g. Yelp listing)
- [FILL DURING ONBOARDING] (e.g. a marketplace review page)

## Response-time SLA per priority
(how quickly each priority should get a reply — the digest flags anything past this)
- high: [FILL DURING ONBOARDING] (e.g. within 2 hours)
- medium: [FILL DURING ONBOARDING] (e.g. same day)
- low: [FILL DURING ONBOARDING] (e.g. within 2 days, optional)

## Banned responses
(replies the agent must never draft on any channel)
- [FILL DURING ONBOARDING] (e.g. discount codes, firm delivery-date promises, admitting fault before the facts)

## Worked example
- Telegram: @acmebakery_bot (customer questions)
- Slack: #community in the Acme workspace
- Gmail: hello@acmebakery.com
- Review pages: https://g.page/acme-bakery, https://yelp.com/biz/acme-bakery
- SLA high: within 2 hours; medium: same day; low: within 2 days
- Banned: offering refunds without approval, sharing anyone's personal data, arguing with a reviewer

## Rules for this file
- Review pages must be public URLs; the agent never logs into a site.
- Instagram, Facebook, and X are not here unless the optional paid inbox API is added.
- Update this list when you open a new channel or review page.
