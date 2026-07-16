# Build Preferences

> Your reference file: the defaults the agent uses when building — stack, output style, where things go, and what "done" means. The agent reads it before every build and fills gaps from you. Edit freely.
[FILLED DURING ONBOARDING — the agent maintains this file; the user may edit]

## What to build
- Typical projects / purpose: [FILL DURING ONBOARDING — e.g., small internal tools, landing pages, data scripts]
- Preferred output type by default: [FILL DURING ONBOARDING — html-app / data-tool / script]

## Tech stack
- Default language: [FILL DURING ONBOARDING — Python first, TypeScript second]
- Frameworks allowed? [FILL DURING ONBOARDING — or "keep it a single self-contained file when possible"]
- Styling / UI notes: [FILL DURING ONBOARDING — e.g., plain HTML+CSS, no build step]

## Where things go
- Drive build folder: [FILL DURING ONBOARDING — name / link]
- Default GitHub behavior: [FILL DURING ONBOARDING — private by default; ask before public]

## Quality bar and scope
- Definition of done: [FILL DURING ONBOARDING — each build must pass its acceptance check]
- Scope rule: MVP first, the simplest thing that works; split anything too big for one night.
- Forbidden builds: nothing harmful or terms-breaking (malware, scrapers that break terms, spam, credential tools).

## Example filled
- Typical projects: single-page internal tools and quick calculators | default output: html-app
- Default language: Python for scripts, plain HTML+CSS+JS for apps; single self-contained file when possible
- Drive folder: "Overnight Builds" | GitHub: private repos, ask before public
- Definition of done: opens in a browser and passes the acceptance check with sample inputs
