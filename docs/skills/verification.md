# Verification

What to check when authoring or admitting a skill package, and what a check is not allowed to pretend.
[authoring.md](authoring.md) owns the writing and lifecycle craft.
[package-contract.md](package-contract.md) owns the package shape.
Two scripts own the deterministic checks:

- `scripts/governance/tools/validate_skill_format.py` — format only.
- `scripts/governance/tools/validate_runtime_hygiene.py` — secret and host-path leakage only.

Docs own policy.
The scripts own the checks.
Do not add a checker whose only job is to restate another checker.
Keep a schema field, gate, or receipt only when a current consumer or an independent safety obligation needs it.

## What to verify

Choose evidence from the requested behavior.
The old name "eval-first" does not impose a corpus, a generated run, or a wording-locked harness on every edit.

- Script and security-sensitive changes need regressions against the actual production code, including relevant errors, permission, concurrency, atomicity, and effect boundaries.
- Judgment-heavy changes need realistic scenarios and an independent qualitative read.
- Routing changes need included intents, overlapping sibling negatives, and the discovery surface the claim is about.
- A prose correction can use focused contract review. Explain that choice instead of manufacturing model runs.

Do not impose a fixed case count, a provider quorum, or the full model-by-runtime matrix.
Do not treat generated eval output as a pass condition.
Do not replace an objective behavioral assertion with a wording snapshot, or treat a test-only helper as deployed-agent compliance.
A required uncovered functional, security, or data-integrity behavior still blocks admission.
An optional check that was not selected does not.

Label every result **executed** (a real command, run, or observed effect) or **reviewed** (a document, contract, or diff).
A review never stands in for a run.
An unavailable check is not run, with a reason.
Never report it as passed.
Never report a release commit, pull request, measured delta, or live effect before it exists.

Useful security and task-scoped tests stay.
Host-stickiness, silent skips, doc-existence assertions, proxy assertions, and guard-mutation checks are worth keeping when they protect a real effect.
Delete a test that cannot fail or that only locks wording.

Related official skills and CLI or agent runtimes are checked only when the task actually uses them.
Record the official fact when the task's recipe depends on it. That check does not require a host upgrade. See [authoring.md](authoring.md).
Installation, registration, reload, and deployment are separate authorized effects.
A green source check does not prove them.

## Evidence handoff

Record, in the existing task summary or evaluation artifact:

- target location and requested effects
- evaluated files and support resources
- base commit where one exists, plus a content digest of the evaluated snapshot
- chosen checks and why
- actual runtime, model, or human judge, and the surface invoked
- results labeled executed or reviewed
- trigger findings and limitations
- dependency outcomes for tools the task actually used

Hand off an accessible reference to that record with the package.
Do not prescribe a new receipt schema or a universal filename.
Uncommitted work needs its own content identity; the base commit does not identify it.
A location change alone does not invalidate provably identical content.
A changed trigger, body, or required resource invalidates the affected evidence.
Missing, stale, or inaccessible evidence for a required behavior leaves the package incomplete.

A destination gate may check that the handoff matches the current snapshot and covers the requested effect.
It does not re-author the package or repeat the quality evaluation.
Reuse evidence only when it covers the current task, snapshot, and effect.
A stale historical receipt is not permission.
Review a common policy once and batch the dependent edits.
Do not run a full workflow per skill.

## How to judge

An improvement claim needs a matched comparison, not an attractive with-skill output.
Use baseline and candidate arms when comparing designs, changing routing pressure, or claiming better performance.
A format repair or a safety regression does not need to improve an unrelated model benchmark.
Do not impose a positive measured delta, a generated score file, or a wording snapshot as a universal publication condition.

When a comparison is warranted:

- Creating: the baseline arm runs the prompt with no skill.
- Updating: snapshot the current package first and run the baseline against that snapshot. Otherwise the comparison tests new-versus-nothing.
- Run both arms without the authoring conversation in context. The author already knows what the skill meant and cannot see its ambiguity.
- Record cost beside correctness when tokens or wall time are observable. A quality win that doubles cost should say so.
- A model, effort, or harness comparison uses representative tasks and records success, cited evidence, tokens, and latency for both arms. Confirm the conclusion again in a fresh context. One favorable run does not promote a configuration.

Optional reusable scenarios may live under `tests/<name>/evals/`.
They are authored inputs, not a required graded corpus, JSON vocabulary, schema, or case count.
The format validator does not require them, and their absence is not a format failure.
Do not commit generated transcripts or scores as the success artifact.

When a scenario is worth keeping:

- Name the artifact, decision, refusal, or effect a correct run produces. "Handles it well" is not a check.
- Where the check is objective (file exists, format matches, command exits 0, secret stays unexposed, write is atomic), script the real effect.
- Subjective output takes qualitative review. Do not force assertions onto a judgment that needs a human eye.
- An assertion that passes in both arms does not prove improvement. Keep it when it guards a safety invariant or a regression.
- A pass needs cited run evidence. A surface match with empty or wrong content does not count.
- Probe gameability: a wrong-but-plausible output that still passes means the check is too weak.
- A verdict that flips across repeats means the scenario is flaky or the skill under-specifies a decision.

### Routing

Write probes the way people type: concrete file names, a line of backstory, casual phrasing, the occasional typo, mixed lengths.
A polished abstract query tests nothing real.
Positives cover different phrasings, including ones that never name the skill, plus cases where a sibling competes and this skill should win.
Negatives are near-misses that share keywords but need something else.
An obviously irrelevant negative is a free pass.
Runtimes consult a skill only when the task plausibly benefits, so a trivial one-step prompt is a poor probe.
Make the task substantive enough that consulting the skill is rational.

Judge trigger-fit from a fresh context that has not seen the authoring conversation, given the library's name and description lines plus the probe.
After tuning a description against failures, re-judge on prompts that were not used for tuning.
A description iterated against one fixed set memorizes that set.

A leading routing directive needs this behavioral evidence because its lexical shape cannot prove ownership.
Choose positives and nearest-sibling negatives that exercise the claimed boundary, not an arbitrary count.
Freeze prompts, labels, and the tuning-versus-unseen split before tuning.
Record baseline and prompt-set identity; a change to either needs new evidence for the affected comparison.
Run matched cases and record successes, misses, false positives, and the actual denominators.
Freeze the candidate before consulting unseen verdicts.
Use an independent read-only judge on the relevant discovery surface.
Record the runtime, the model or human judge, and the surface for each result.
Test distinct parser or discovery boundaries where the claim needs them, not every model/runtime combination.
Demonstrate any claimed repaired miss, and check regressions on the evaluated intents.
Quote the proposed ownership class and name its included intents plus the excluded or handed-off siblings.
Confirm that body prose gained neither directive syntax nor repeated caps-lock rigidity.
Uncertain, uncited, or flaky judgments cannot establish the claim.
A perfect baseline does not by itself justify self-application; the general directive capability may still ship if the evidence holds.
Keep ordinary prose when stronger routing pressure is not justified.

### Fresh eyes

Use a capable model or a human in a fresh context, independent of the authoring session, when the judgment needs a second reader.
Record the exact runtime, model or human identity, and discovery surface.
The verdict proves only the environment that produced it.
Keep the judge read-only through tool or permission controls, not through prompt intent alone.
Give it the artifacts the rubric needs.
Do not include the author's rationale, and do not identify which arm is the candidate.
Missing evidence or an uncertain judgment is a failure, not a pass by default.
The authoring session does not self-judge a claim it cannot see.

When GJC orchestrates the work, follow the selected workflow and its evidence boundary.
It does not prescribe a fixed profile, a provider-family count, or a second provider as the judge.
Discovery success, body load, explicit invocation, and workflow-phase permission remain separate facts.

### Transcripts and overfitting

Selected run transcripts can show repeated work and wasted detours.
They are scratch, not a required deliverable.
If every run hand-writes the same helper, bundle it once.
If runs consistently burn effort on an unproductive path, cut the sentence sending them there and re-check the affected outcome.

Generalize a failure before encoding it.
Ask what class of prompt fails, not which patch makes this one pass.
Prefer explaining why over adding a constraint.
For a stubborn failure, change the frame rather than adding one more rule per failed run.
Stop when the required behavior is supported and further tuning is not meaningful.
Repeated tuning on the same examples overfits them.

Go heavier only when the risk warrants it: two versions genuinely compete, a regression would be costly, or a numeric claim needs numbers.
Repeated runs with mean and spread, token or latency aggregation, and blind A/B judging are available then.
That machinery is never a publication gate and must not replace functional, security, or data-integrity fixtures.
Where a vendor runtime already ships the machinery, use it on that runtime when the risk justifies it.
Do not copy the harness into this repository, and do not require its generated output as local policy.

## Format check

Run `scripts/governance/tools/validate_skill_format.py` on the snapshot that would be admitted, not on a stale `HEAD`.
It runs the official Agent Skills linter `skills-ref` (install with `python3 -m pip install -r scripts/governance/requirements.txt`) for specification rules, then local checks, including the package allowlist of `scripts/`, `references/`, `assets/`, `templates/`, and `agents/` directories.
CI runs it once over every package and once with `--diff-base` for retirement tombstones.

```bash
set -e
BASE=$(git merge-base origin/main HEAD)
python3 scripts/governance/tools/validate_skill_format.py --diff-base "$BASE"
```

`--diff-base` takes one commit, not a revision range.
A three-dot range passed straight to `git diff` can miss uncommitted cleanup.
Resolve the base explicitly.
The selector unions four Git states: committed changes from base to `HEAD`, staged changes, unstaged changes, and untracked files.
A staged change and an unstaged reversal that cancel in a net diff are still both selected.
Format checks then read current content.

Repeat `--package skills/<name>` to add an existing owner.
Without either selector the script scans all packages.
`--advisory` is an explicitly non-blocking format inventory.
Input and Git errors still exit 2.
Warnings never affect the exit code.

The script maps body, references, scripts, assets, and repo-root test changes to the nearest real `SKILL.md` owner.
Docs, CI, and governance-tool changes are repository-tool scope and select no package.
They do not require any particular live package directory.
Unknown paths under `skills/`, `tests/`, and `scripts/` fail closed.
Deleted owners get a tombstone check and a concrete inbound-path check.
Independent review still owns semantic routing, outcome and failure wording, and whether a retirement preserved unique knowledge.

The script rejects repeated base flags, revision ranges, noncanonical or escaping paths, nonexistent package selectors, and unresolved support ownership.
It does not require an output-contract heading, anti-pattern registry wording, a `MUST USE` grammar, a generated eval corpus, or sentence-boundary line breaks.
Sentence line breaks are a nonblocking typography preference.
The reflow helper is retired.

Markdown style is checked by `npx -y markdownlint-cli2@0.23.3` against the root `.markdownlint-cli2.jsonc`, in CI and `scripts/ci-local.sh`.

After an authorized merge or update, verify the resulting revision and rerun the relevant checks.
Report unrelated work without stashing it or changing the operator's branch implicitly.

## Runtime hygiene

`scripts/governance/tools/validate_runtime_hygiene.py` owns secret and real-path leakage.
It is not a second format checker.
Format and hygiene both accept `--diff-base`, but they do not claim the same coverage.
Format selects packages.
Hygiene scans added lines of tracked text plus the full contents of untracked files, so a new leak fails without turning unrelated legacy debt into one migration.

```bash
python3 scripts/governance/tools/validate_runtime_hygiene.py --diff-base "$BASE"
```

Default mode, with no base, scans tracked files.
Explicit path arguments scan those files entirely and exit 2 for missing, unreadable, or escaping selections.
Containment is checked before any content read.
Escaped symlinks are not followed into outside files.
Git, decode, and path errors fail closed.
There is no silent whole-tree fallback.

Diagnostics name the path, line, and rule.
They never echo a matched secret or host path.
A line that contains an env placeholder can still hide a second hardcoded value; do not exempt the whole line because `${VAR}` appears in it.

Tracked real env names match `.env` and `.env` plus any extra suffixes, including `.env.production.local`.
Only the exact name `.env.example` is exempt (`RUNTIME_ENV_FILE` from hygiene, `TRACKED_ENV` from format).
Content rules include private-key markers, well-known token prefixes, and secret-like assignments (`SECRET_ASSIGNMENT` and the `SECRET_*` token rules), plus host home and absolute volume paths (`RUNTIME_HOME_PATH`, `RUNTIME_ABS_VOLUME_PATH`).
Unquoted Python source is read as name and attribute loads, so a lookup expression is not mistaken for a literal credential.
Literal, quoted, comment, Markdown, shell, and provider-token findings stay in scope.
Placeholder markers (`YOUR_`, `REDACTED`, `PLACEHOLDER`, `EXAMPLE`, angle brackets, and similar) are not findings.

When a hygiene gap is already committed, add or update the guard before broad cleanup, and keep changed-line hygiene scoped to the recorded base.
For a large cleanup, prefer two separate changes: one adds the guard and its tests, the next externalizes the legacy paths or secrets that guard now catches.
In cleanup changes, keep prose examples as placeholders and make executable scripts declare inputs.
Avoid ambient configuration and implicit inputs.
A reader of `--help`, and a security scanner, cannot tell a script that dumps the environment from one that passes arguments through it.

### Secrets

Every access path, API key, OAuth token, and host-specific value lives in a per-skill `.env` at the package root.
That file is gitignored.
Commit only `.env.example` with placeholder values, and document required variable names in `SKILL.md`.
Never hardcode real values in `SKILL.md`, references, scripts, tests, evals, or examples.
Do not paste secret values into chat, commit messages, pull-request bodies, logs, summaries, or skill notes.
Report path names, commit ids, and redacted labels.

Ignore real env files and keep examples:

```gitignore
.env
.env.*
!.env.example
!**/.env.example
```

### A secret already in history

A pull request opened after the leak does not remove it from history.
Cleanup is a history rewrite plus a force push, and it does not invalidate the credential.

1. Stop other work on the repo. Preserve current state with `git status --short --branch` and `git fetch --all --prune`.
2. Identify tracked, current, and historical env paths without printing values (`git ls-files` and `git rev-list --objects --all`, filtered to env names).
3. Obtain approval for the exact local history rewrite. Preserve unrelated work before any destructive history command. Revoke or rotate the exposed credential through the authorized provider procedure. Remove only approved real env paths, and retain or recreate safe examples.
4. Rewrite with `git filter-repo` only under that approval. It removes `origin` by design; restore the remote URL before pushing. Do not print secret file contents while doing this.
5. Recreate the ignore and example policy if needed, then commit that policy.
6. Verify history again without printing values.
7. Force-push rewritten refs only with explicit current-turn approval. State the exact refs and why. Prefer `--force-with-lease`.
8. After the push, verify remote refs and tell the operator to rotate or revoke the exposed secret immediately. Do not claim GitHub caches or other clones are clean unless that was checked separately.

## Installation and deployment

Authoring verification and installation are different effects.
Do not treat a format pass, a hygiene pass, a source commit, a manifest version, or an evidence receipt as proof that a runtime loaded the package.
Runtime loading or registration cleanup runs only when that effect is selected and separately authorized.
Otherwise report it as unverified.
That does not block completed source work.
Preserve unique cache contents.
Never claim a successful load from static inspection.

Plugin-root relocation, marketplace metadata, and a runtime's plugin registration are adapter work for the selected runtime.
The repository is the source of truth, not a derived cache or symlink.
Search active surfaces for the old path.
Historical changelog mentions are not blockers once active config is clean.
Verify discovery on the selected runtime by an actual discovery command, and confirm the affected skills appear.
Report status only from real tool output.

## Provenance

The format and hygiene split, the four-state `--diff-base` union, and the guard-first cleanup sequence come from skillify v7.0.0, immutable source revision [836eb8778134d68f3ea675cd30ee5f9ae692f9e3](https://github.com/GoBeromsu/craft-skills/commit/836eb8778134d68f3ea675cd30ee5f9ae692f9e3).
Python lookup-versus-literal handling was adapted 2026-09-21 from the Bstack promote runtime-hygiene validator supplied during that authoring.
Evaluation method — matched arms, fresh-eyes judging, held-out prompts, transcript reading, and the heavyweight escalation boundary — comes from that same revision.
Fixed case counts, generated benchmark files, and vendor eval viewers were declined there; this page does not re-check current vendor manuals.

The operator supplied these sources for this migration. They were not re-fetched:

- Astra: [OpenAI latest-model guide](https://developers.openai.com/api/docs/guides/latest-model), for scoped verification of the requested task.
- Fable 5.1: [keep changes and tests to what the task asks for](https://platform.claude.com/docs/en/build-with-claude/prompt-engineering/prompting-claude-fable-5-1#keep-changes-and-tests-to-what-the-task-asks-for). Useful security and task-scoped tests stay; unrelated suites are not a gate.
- Garry Tan, [gstack](https://github.com/garrytan/gstack): thick local judgment with thin deterministic tools. Inspiration for that split, not wholesale adoption of that repository's policy.

The mandatory eval corpus and exact `evals.json` / `triggers.json` schema were a 2026-09-02 experiment (v4.10.0) and are not format gates.
When those optional files exist, reviewers may use them as authored inputs.
The format script does not require them.
The sentence-reflow gate (v4.4.0, 2026-07-19) is retired; line wrapping is a preference, not a failure.
Repository-tool paths — docs, CI, and governance scripts — select no skill package. They do not require any particular live package owner.
Those surfaces are repository-tool scope.
