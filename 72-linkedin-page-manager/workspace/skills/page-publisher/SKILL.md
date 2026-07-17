---
name: page-publisher
description: Connected mode only. After the user's explicit yes on a specific approved post, publish or schedule it to the company Page and fan out to X/Threads. Use on "publish #N", "schedule this post".
---

# Page publisher

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: publish or schedule exactly the post the user just approved to the company Page via the official LinkedIn API, and record the result — never acting without a per-post yes.

## Algorithm
1. Confirm connected mode: check that the secret LINKEDIN_ACCESS_TOKEN exists. If it does not, do nothing except tell the user this is draft-mode only and hand them the approve-ready package to post by hand.
2. Confirm the user said yes to this specific post (by number or title). No explicit yes → stop and ask; never assume approval.
3. Read the approved row from Google Sheets "LinkedIn Calendar" and the final copy from the "Post Drafts" Google Doc. Verify status=approved.
4. Run a Python helper script (files/scripts/) that reads LINKEDIN_ACCESS_TOKEN from the environment and calls the LinkedIn Community Management API to publish now, or schedule at scheduled_time; upload any image the user attached first and reference it in the post.
5. If X_BEARER_TOKEN or THREADS_ACCESS_TOKEN exist and the user opted into fan-out, post a text-fit version (X ≤280 characters, Threads ≤500 characters per knowledge/PUBLISHING_RULES.md) via the same script.
6. Save the returned post_urn into the row and set status=published (or scheduled). Report the live URL. This skill never sets up automations.

## Output
```
Published "Why ops teams miss their first automation win" to the company Page.
  post_urn: urn:li:share:7212... (saved to post_urn) — status=published
  Fan-out: X posted (238 chars), Threads posted (301 chars)
  Live: linkedin.com/feed/update/urn:li:share:7212...
```

## Edge cases
- No LINKEDIN_ACCESS_TOKEN set → do not attempt anything; explain draft mode and deliver the approve-ready package instead.
- API returns an auth or permission error → report it verbatim, keep status=approved, and do not retry blindly; the token or the app's approval likely needs attention.
- Row is not status=approved, or the user did not say yes → stop; publishing is only for a post approved in this session.
- Fan-out text exceeds a network limit → trim to fit before posting; never post an over-limit version, and never fabricate a shortened claim.
