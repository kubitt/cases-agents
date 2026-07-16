---
name: ship-artifact
description: After the user confirms, push a built artifact's code to a GitHub repo and/or hand off deploy steps. Use on "push X to GitHub", "ship it", "put it in a repo". Never acts without explicit approval.
---

# Ship artifact

> A skill = one repeatable job, written as a recipe. You can edit steps, limits, and formats in plain words.

Goal: get a finished build out of the workspace and into the user's hands — a GitHub repo and/or clear deploy steps — but only after the user explicitly confirms this specific artifact. Pushing code is an external action.

## Algorithm
1. Confirm which built artifact to ship (from "Build Log", outcome=built) and where: a new or existing GitHub repo, deploy steps only, or both.
2. Restate what will happen and wait for an explicit yes: "I'll push {name} to {repo}. Confirm?" No confirmation -> stop, change nothing.
3. Before pushing, scan the code for secrets or keys; if any are present, strip them and read them from environment variables instead. Never commit a secret.
4. On approval, push the code to the GitHub repo with a clear commit message and a short README describing what it is, how to run it, and what's untested.
5. For deploy: hand off exact steps for a free host (for example, connect the repo to a static host). Actually publishing to a live URL through a provider is an optional upgrade and still needs your confirmation and a key.
6. Update the "Build Log" row: outcome stays built, next_step notes where it shipped (repo URL / deploy status).

## Output
```
Ship request: Expense splitter
Target: new GitHub repo "expense-splitter" (private)
Secret scan: clean (no keys in code)
-> Confirm and I'll push with a README + how-to-run.
After push: repo at github.com/<you>/expense-splitter | deploy steps included in the README.
```

## Edge cases
- No explicit confirmation -> do nothing; a build is never pushed or deployed on assumption.
- Secret or API key found in the code -> stop, remove it, switch to an environment variable, and tell the user before any push.
- Repo or deploy target unclear -> ask which repo (new/existing, private/public) before touching GitHub; never make a public repo by default.
- Deploy needs a paid provider or a key not set up -> hand off manual steps instead and flag the optional upgrade; never sign up or spend on the user's behalf.
