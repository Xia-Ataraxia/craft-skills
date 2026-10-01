# Package contract

The portable shape of a skill package in this library, plus the local rules this repository consumes.
[authoring.md](authoring.md) owns how to write and maintain a package.
[verification.md](verification.md) owns how to check one.
Deterministic format checks live in `scripts/governance/tools/validate_skill_format.py`.
This page owns the policy; the script owns the check.
Do not add a second checker that only restates the script.

For a package written somewhere else, use the portable format, evidence, dependency, and containment rules here.
That destination's own policy governs placement, supported metadata, history, test location, admission, and delivery.
This library's validator commands do not apply there.

Official vendor skills stay unmodified originals.
Local packages hold only uncovered context.
Do not copy official product usage into this library.

## Package

A package is one flat directory, `skills/<name>/`, with a root `SKILL.md`.
No nested `SKILL.md` anywhere inside it, including `agents/`.
No routing-index file and no grouping subfolders.
An extra directory needs a concrete execution purpose not covered by the parts below; document that purpose instead of using the directory for grouping.

This library also requires `CHANGELOG.md` beside `SKILL.md`.
That file is a local history convention consumed by release tooling and by the format validator.
It is not a native loader requirement.
A destination that keeps history elsewhere follows its own rule.
A destination that forbids auxiliary files inside a skill, including the historical OpenAI creator, uses its own history store.

Tests do not live in the package.
They live at repo-root `tests/<name>/`, so an install bundle does not ship fixtures.
Generated transcripts, scores, and judge notes stay in gitignored scratch.
They are never a pass condition and never committed as policy.

| Part | Create when |
|---|---|
| `references/` | Bulk knowledge consulted on demand, not on every invocation. |
| `scripts/` | A step must be deterministic and repeatable. Not for one-off setup or judgment-driven branching. |
| `templates/` | The skill emits a canonical artifact with a fixed shape. |
| `assets/` | Files the deliverable copies or fills in and the agent does not read as text. |
| `agents/` | A bounded role needs a charter. Each file states that role's scope, inputs, outputs, and hand-off. It is never a child skill. |
| `tests/<name>/` at repo root | Focused functional, security, and data-integrity fixtures for the requested effects. A `scripts/` file ships with matching regression coverage. |
| `.env` / `.env.example` | Any credential, token, or host-specific value. Commit only `.env.example` with placeholders. |

Hermes, Claude Code, Codex, Cursor, Grok-native, and GJC can share `SKILL.md` as the portable core.
Runtime discovery and plumbing stay on the explicit routes in [authoring.md](authoring.md).

## Frontmatter

```yaml
---
name: <kebab-case, equal to the directory name>
description: <what it does, when to use it, and the sibling boundary when one exists>
metadata:
  version: <MAJOR.MINOR.PATCH>
---
```

`name`, `description`, and `metadata` are required in this library.
`version` is never a top-level key.
`metadata` is a string-to-string map.

The [Agent Skills specification](https://agentskills.io/specification) also permits `license`, `compatibility`, and experimental `allowed-tools`.
Add one only when the package cannot meet its support boundary without it, and record the runtime caveat on that runtime's route.
`compatibility` is a string of 1..500 characters.
`license` and `allowed-tools` are non-empty strings.
`allowed-tools` is an experimental, implementation-dependent declaration, not a portable enforcement mechanism.
On the Grok-native runtime it neither grants nor restricts tools.
Do not add vendor-specific fields (`metadata.hermes.*`, Cursor `paths` / `icon` / `color`, Grok `when-to-use` / `user-invocable`, OpenAI `agents/openai.yaml`) to the portable baseline.
Keep a field only when a current consumer or an independent safety obligation needs it.

The format validator accepts only those top-level keys.
Anything else is `FORBIDDEN_KEY`.
Missing frontmatter is `NO_FRONTMATTER`.
A missing or non-map `metadata` block is `NO_METADATA` or `BAD_METADATA`.

## Name

- Kebab-case, equal to the directory name, at most 64 characters (`NAME_MISMATCH`, `NAME_NOT_KEBAB_CASE`, `NAME_TOO_LONG`).
- Verb-first when the user triggers the skill by naming the action (`refactor`, `init`, `write-report`).
- Plain noun when the skill names the domain or surface (`programming`, `security`, `testing`, `guardrails`).
- No more than two tokens as authoring guidance.
- No `-skill`, `-tool`, or `-helper` suffix. The package is already a skill.
- Do not adopt tool-namespaced names. The directory name is the frontmatter name; a runtime namespace such as `craft-skills:<name>` is an adapter fact, not a field to author.

Two-token guidance is reviewable craft, not a format failure.
The script checks kebab-case, directory equality, and the 64-character ceiling.

## Description

Third person.
Say what the skill does and when to use it.
Weave in a few phrases a person would actually type; do not dump a bare quoted list or stuff keywords.
Add "Not for X — use Y" when a sibling overlaps.
Name concrete situations, including ones that never say the skill's name.
Runtimes consult a skill only when the description names the situation, and they err toward not consulting.
The body loads after that decision, so "when to use" prose in the body does not route.

300–700 characters is the target shape.
The validator warns, without failing, under 200 (`DESCRIPTION_SHORT`) or over 700 (`DESCRIPTION_LONG`).
It hard-fails only outside 1..1024 (`NO_DESCRIPTION`, `DESCRIPTION_TOO_LONG`).
Use the languages operators actually use for the intent.
Do not pad the description to meet a language quota.

There is no format gate for `MUST USE`, `ANY`, or any other routing phrase.
This library has no demonstrated native parser that consumes that grammar.
Independent review judges routing evidence.
See [verification.md](verification.md).

## Body

Preserve useful decision guidance.
A compact body, around 150 lines of decision-depth, is authoring guidance, not a loader limit and not a format failure.
Move optional depth to `references/*.md` without discarding it.
A reference sits one level deep.
A reference over 100 lines opens with a table of contents.

Lead with the purpose and what success looks like, then the workflow and decisions, then boundaries and hand-offs, then only the requirements, recorded mistakes, or verification notes the package needs.
Cut preamble and restated-obvious practice.
State the artifact, location, relevant format, and what happens on an applicable no-result, partial-success, stop, or ambiguity case.
Independent review judges that meaning.
Do not require an exact heading, procedural phrase, anti-pattern registry wording, or section order.
A wording check with no runtime consumer and no safety owner is not a format gate.

Outcome over process.
Give numbered steps only where the exact sequence matters.
Implement only the requested outcome, with no speculative features, and keep that path complete.
Validate system boundaries; do not add fallbacks for impossible internal states.
State the action, its autonomy boundary, and any required approval at the single owner, and link from everywhere else.
Report observable evidence and decisions, not private reasoning.

One default per decision, with one named escape hatch.
No option menus.
No ALL-CAPS rigidity and no "MUST/NEVER/LAW" shouting in body prose.
Where strict adherence matters, one short clause of why is enough.
A routing phrase in the description never authorizes a body directive.
A single sparing bold is fine.

Present tense and imperative.
No history, provenance credit, or vendor lock in the body: no Claude-only frontmatter, no `/plugin` instructions, no "new" or "recently", no bare dates.
Use `${ENV_VAR}` placeholders and forward-slash paths.
`${ENV_VAR}` avoids a hardcoded path in prose.
It is not a script-to-script argument channel.
Scripts declare inputs as flags or positional arguments.
A runtime-owned non-secret setting may default from one documented environment variable after that declaration.
Secrets are read from the environment only after they are declared, and never hardcoded.

Document an external binary only if the skill actually shells out to it.
Record its official source, a safe version probe, and the support boundary.
The contents must match the description: no hidden effects, commands, data collection, or exfiltration.

`## Change Log` inside `SKILL.md` is forbidden (`CHANGELOG_IN_SKILL`).
History lives only in `CHANGELOG.md`.

### Sentence line breaks

Prefer one sentence per line in paragraphs and one item per line in lists.
Do not hard-wrap mid-sentence at a column width.
Markdown renders both the same; sentence boundaries read and diff more cleanly.
This is a nonblocking typography preference.
The reflow helper is retired.
No script fails a package for line wrapping.

## Referenced paths

Every package-relative path the body mentions under `scripts/`, `references/`, `templates/`, `assets/`, or `agents/` must exist inside that package after symlink resolution.
A dangling, missing, or out-of-package path fails as `MISSING_REFERENCED_PATH`.
A sibling file that exists elsewhere in the repository still fails.
Fix it by adding the file to this package or by removing the mention.
Do not leave a placeholder.

Repo-root `tests/<name>/` is not a package-local support path.
The validator does not treat a `tests/` mention as a missing package file.

A Markdown link that climbs out of the package with `../` is `TRAVERSAL_LINK`.
The Hermes tap fetcher treats that shape as a traversal attempt and aborts the install.
Cross-package pointers are prose that names the skill and the file.
In-package symlinks to contained files are valid.
Escaping or dangling links are missing.
Other destinations may use their own cross-package convention, without treating an external file as a contained support resource or bypassing access checks.

## Local version and changelog

`metadata.version` is `MAJOR.MINOR.PATCH` (`NO_VERSION`, `BAD_VERSION`).
Release tooling in this repository consumes it.
A native skill loader does not require it.
Do not present the field as spec-mandated portability.

```
MAJOR  A trigger phrase is removed or renamed, or the output format breaks a downstream consumer.
MINOR  A backward-compatible capability is added.
PATCH  A bug fix, prose correction, or dependency bump with no interface change.
```

Ask whether a caller already using the skill must change anything.
If yes, MAJOR or MINOR.
A new opt-in capability is MINOR.
A fix or clarification with no interface effect is PATCH.
An absorption or comparison that changes nothing records a verified no-op and needs no bump.

Every library package has `CHANGELOG.md` with at least one dated bullet and at most 100 lines (`NO_CHANGELOG`, `CHANGELOG_NO_DATED_BULLET`, `CHANGELOG_TOO_LONG`).

```
- YYYY-MM-DD — [vX.Y.Z: ]<why it changed> → <what it became>.
```

Lead with the trigger.
The bullet is the summary; Git holds the detail.
Append a new bullet.
Do not rewrite a retained past bullet.
When a new bullet would exceed 100 lines, drop the oldest whole entries until it fits.
Do not cut an entry in the middle, and do not grow a sidecar archive.
Dropped history remains in Git.

When a change derives from operator-supplied source material, append `Provenance:` naming what was taken and linking a public source as `[name](url)`.
A local source uses its plain path.
Land a substantive excerpt worth re-consulting as a `references/*.md` file in reference voice, not only in chat.
Update `skills/PROVENANCE.md` when a package's primary source changes.

`verified_against: <tool>@<version>` belongs on a history bullet when the recipe depends on a probed mutable tool.
The probe is an exact safe command or API query.
The boundary says which version range, platform, or capability the recipe supports.

## Ownership

Inside one package, each rule has one owner.
The body owns always-read routing and gates.
A reference owns deep topic rules.
A script owns a deterministic check.
`CHANGELOG.md` owns history.
`skills/PROVENANCE.md` owns the cross-skill lineage snapshot.
If another section needs the same rule, link to the owner.
Do not restate it.
Overlapping warning sections are a mistake; keep one recorded-mistake registry when needed.

These three docs follow the same split.
Authoring does not restate the format codes.
Verification does not restate the writing recipe.

## What the format script checks

`scripts/governance/tools/validate_skill_format.py` enforces this contract's format surface:

- Frontmatter presence and the allowed key set, including the guarded optional spec keys.
- `name` equality, kebab-case, and the 64-character ceiling.
- Description hard bounds 1..1024, with non-failing shape warnings outside 200..700.
- `metadata.version` semver.
- No nested `SKILL.md` (`NESTED_SKILL_MD`).
- No `## Change Log` in `SKILL.md`.
- `CHANGELOG.md` present, at least one `- YYYY-MM-DD` bullet, at most 100 lines.
- No tracked real `.env` in the package. `.env` and `.env.*` are real; only the exact name `.env.example` is exempt (`TRACKED_ENV`).
- Support paths mentioned in the body resolve inside the package (`MISSING_REFERENCED_PATH`).
- No `../` climb-out link (`TRAVERSAL_LINK`).
- Retirement tombstones: a removed owner with remaining files is `INCOMPLETE_RETIREMENT`; a live reference to a removed owner is `DANGLING_PACKAGE_REFERENCE`. Historical changelog mentions are not that check.

It does not fail a package for sentence wrapping, an eval corpus, a `MUST USE` phrase, an output-contract heading, body length, two-token names, or description quality.
Those are authoring and review obligations.

Default mode scans packages and exits 1 on a hard finding.
`--diff-base REF` selects the union of committed, staged, unstaged, and untracked package and support changes against one commit, not a revision range.
`--package PATH` adds an existing `skills/<owner>` directory.
`--advisory` reports format findings without failing; input and Git errors still exit 2.
Every mode needs a Git worktree.
`--root` identifies that worktree root; it is not a standalone non-Git package directory.
Description-length warnings never affect the exit code.

Shared repository surfaces — docs, CI, and `scripts/governance/` — are repository-tool scope.
A change there selects no skill package and does not require any particular live package owner.
Package resources still map to the nearest real `SKILL.md` owner.
Unknown paths under `skills/`, `tests/`, and `scripts/` still fail closed.

Secret and host-path leakage is a different script.
See [verification.md](verification.md).

## Provenance

Portable baseline and optional spec keys: [Agent Skills specification](https://agentskills.io/specification), compared with [agentskills/agentskills@69ef37e](https://github.com/agentskills/agentskills/tree/69ef37e9424c0a7ea9dd2293b559e43ec8176379), [anthropics/skills@3b3fad9](https://github.com/anthropics/skills/tree/3b3fad96af16a10759d930941b4520ba0c40edae), and [openai/skills@49f948f](https://github.com/openai/skills/tree/49f948faa9258a0c61caceaf225e179651397431).
The local changelog, version rubric, flat-package rule, and traversal-link ban are this library's policy, not that specification.
OpenAI's creator forbids in-skill changelogs; this repository keeps them because release tooling consumes them.
Traversal rejection follows the Hermes tap fetcher's install abort, recorded 2026-09-03.
The 100-line cap and dated-bullet shape are the local history convention enforced by the format validator since the v4 contract, not a native loader limit.
