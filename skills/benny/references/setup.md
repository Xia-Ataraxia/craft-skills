# Set up Benny

Configure the tracker, routing map, feature map, and control adapter here. Keep user-owned configuration outside the installed Benny package.

For schedules, webhook-triggered runs, headless CLI execution, and secrets, use `craft-mode/references/runtimes.md`. The source pack's README and FOR_AGENTS intent becomes two phases of one skill: one source-bound triage verdict, then reproduction only after a trusted bug or performance marker. Automation prompts read the installed procedures directly, never copied excerpts or a version-pinned cache path.

Do not create or update an automation until the user explicitly asks. Never put a secret value in plugin files, prompts, or committed configuration.

## 2. Adapt the configuration

Open these copied examples from the Benny package root:

- `templates/configuration.example.yaml`
- `references/feature-map.example.md`

Create user-owned copies outside the installed Benny package. These are configuration files, not pack files. Example locations:

- Project config, such as `.benny/configuration.yaml`
- Project feature map, such as `.benny/feature-map.md`
- Project routing map, such as `.benny/routing.md`
- User config, such as `~/.config/benny/configuration.yaml`
- User feature map, such as `~/.config/benny/feature-map.md`

Fill one feature-map section for every user-facing feature the automation may reproduce. Keep it at the user point of view. Do not freeze implementation details or current code paths in the map.

Do not edit the copied examples. Pack refreshes may update source-managed files after conflict review, but they must never touch the user-owned copies.

Prefer committed, secret-free files in the target repository when a fresh automation checkout must read them. Otherwise paraphrase the required values into the live prompt. Reference a repository file only after confirming that the file is committed in the repository where the automation runs.

Use stable repository-relative paths for committed pack and configuration files. Never reference the plugin source directory or a plugin cache path from a live automation.

## 3. Fill the required choices

Ask for or confirm:

- Source origin and issue/thread identity, or the pasted user message
- Optional operations or status destination
- Repository URL and default branch
- Triage identity, or the coordinator for pasted text
- Issue tracker type, team, project, labels, and intake status
- Tracker adapter skill or MCP actions
- Optional routing map path
- Required control skill name
- Required user-facing feature-map path
- Status emoji strings
- Pull request URL format
- Polling and effort budgets

The linked source identity and triage identity must be explicit for external delivery. Pasted text uses the original user message and coordinator identity without external posting. The tracker adapter must be explicit before tracker writes; the repository, control skill, and feature map must be explicit before reproduction. Fail setup for the affected phase if any required value stays ambiguous.

Use craft-skills' `unslop` skill on the final automation names, descriptions, and prompt shims before saving them.

## 4. Check integration capabilities

The triage automation needs:

- Read access to the configured source issue/thread, or the pasted report
- Verdict-post access on that source, or return the verdict to the user for pasted text
- Attachment metadata and file download access when reports include media
- Search, read, create, and update access through the configured issue-tracker adapter

The repro automation needs:

- Read access to the source issue/thread, or the pasted report
- Reply access on that source, or return the result to the user for pasted text
- Optional post and edit access in the configured operations destination
- Repository read and history access
- A pull request action that can open a draft pull request
- The configured control-adapter skill

Prefer configured source actions for reads and posts. The optional `BENNY_SOURCE_TOKEN` may fill a narrow gap such as editing one operations status message or downloading an attachment. Store the value in a secret manager or environment, not in YAML.

Do not use undocumented integration endpoints.

## 5. Prepare the routing map

If the user wants reroutes or owner pings:

1. Copy `routing.example.md` outside the installed Benny package.
2. Replace every placeholder with public or organization-local values.
3. Keep owner pings off by default.
4. Allow a ping only for a configured feature owner or a confirmed likely regression author.

If no routing map is configured, triage may classify a report but must not guess a destination or owner.

## 6. Verify the control adapter

Read `control-adapter.md` and the user's completed feature map.

Confirm that the named skill can:

- Bring up the target app
- Navigate every mapped feature through the real UI
- Exercise mapped states through declared adapter actions
- Inspect state without forcing the result
- Capture screenshots
- Start and stop a recording
- Clean up its processes and temporary data

If any capability is missing, leave the repro automation disabled. It must fail closed rather than claim a reproduction it did not perform.
