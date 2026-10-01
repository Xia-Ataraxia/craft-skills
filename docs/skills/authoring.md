# Skill authoring

How to write and maintain a local skill package in this library.
The portable package shape lives in [package-contract.md](package-contract.md).
What to run, and what a script may not claim, lives in [verification.md](verification.md).
These pages replace the installable `skillify` workflow.
They are ordinary documentation: no skill owns them, nothing must invoke them, and they do not install, register, or publish a package.

Official vendor skills stay unmodified on their official channels.
A local package holds only uncovered context: workflow glue, environment links, and gaps those originals do not own.
Do not copy a product manual, command sheet, or evaluator harness into this library.

## When a package belongs here

Answer these before writing.

1. **Reusable craft?** Useful on another relevant project or a repeated workflow, and appropriate for the destination that will hold it.
2. **Owned here?** No mature upstream harness or official vendor skill already performs the workflow. If one does, point at it and stop.
3. **Portable core?** The recipe is plain Markdown. A call that only one runtime exposes belongs in an explicit route, not in the core.

A library destination may add its own admission on top.
Apply that policy at the destination; do not copy it into every package.

Read the current request, the stated purpose, and the project instructions already in effect.
Pull more only when the task needs it.
Do not harvest whole conversation or memory stores, and do not stand up a context service.

Check whether the destination is private or shared before writing.
Keep secrets, account values, and private source text out of shared packages.
Personal context enters a private package only when it is authorized and necessary.

## Write the package

State the artifact, its location, the relevant format, and what happens when the run cannot succeed before drafting the rest.
Independent review judges that meaning.
No exact heading, phrase, or section order is required.

Plan parts from concrete invocations, not from an example quota:

- Code every run would rewrite goes in `scripts/`.
- Knowledge every run would re-derive goes in `references/`.
- A fixed artifact shape goes in `templates/`.
- Files the output consumes without reading go in `assets/`.
- A bounded subagent role, when one is actually needed, goes in `agents/`. It is never a child skill.
- Judgment and sequencing stay in `SKILL.md`.

Match freedom to fragility.
Use prose where many routes are valid, a preferred pattern where one way is better but variation is fine, and an exact script where the operation is fragile and order-sensitive.
One default per decision, with one named escape hatch.
Implement only what the requested outcome requires, and keep that path complete end to end.

Keep instructions lean and single-owned.
Report progress through observable evidence and decisions.
Do not ask anyone to transcribe private reasoning.
Delegate an independent lane only when the selected runtime supports it, and name the hand-off evidence.

The description is the discovery surface.
Write it in third person, say what the skill does and when to use it, and weave in a few phrases a person would actually type.
Add a "Not for X — use Y" sentence when a sibling overlaps.
Write against undertriggering: name the concrete situations that need the skill, including ones that never say its name.
The boundary sentence keeps that assertiveness precise.

A stronger leading routing sentence is optional and evidence-gated.
Lexical shape cannot prove mutually exclusive ownership.
Use ordinary prose unless included intents, nearest-sibling exclusions, and an independent discovery-surface check justify more pressure.
Sentence-case wording such as "Must use" is ordinary prose.
Body prose never inherits a routing exception, and caps-lock does not repair an overlapping boundary.

Preserve distinctive craft.
Detection commands, decision tables, and hard-won corrections survive, compressed rather than deleted.
If valuable depth does not belong in the always-read body, move it to `references/` instead of cutting it.
Delete stale sediment and no-op prose.

Record a real unwanted behavior as one line, `- <unwanted behavior> → <what to do instead>.`, in one registry when the package needs one.
Do not invent that registry upfront, and do not require a particular heading.

A package must not surprise a reader of its description.
No undisclosed effects, data collection, or exfiltration.
Refuse a misleading or malicious skill.

## Lifecycle

Choose create, update, move/rename, or retire.
Authoring finishes when the package exists at the chosen location, the checks that destination consumes pass, and a usable evidence handoff identifies the evaluated content.
Install, registration, branch/PR, merge, and publication are separate effects.
Each needs its own approval.
A source commit does not prove that a runtime loaded the package.

### Create or update

1. State the outcome and failure boundary.
2. Choose focused functional, security, and data-integrity evidence for the requested effects. Optional reusable scenarios are allowed. Generated run output is not required.
3. Author `SKILL.md` and the parts the recipe actually uses.
4. Record history under the destination's policy. In this library, follow the local changelog rule in the package contract.
5. Check an official fact only when this task's recipe depends on it. A missing host upgrade does not block source authoring.
6. Run the destination's checks and hand off the evidence. An incomplete draft stays incomplete.

Patch support resources in the same pass as the body when the recipe cites them.
A location change does not invalidate provably identical content; a changed name, body, or required resource does.

### Field corrections

Keep native field experiments separate from the formal package.
Local correction does not itself require a canonical edit, version bump, or publication.
Harvest only when requested.

Classify each input before reusing it:

| Class | Meaning | Handling |
|---|---|---|
| `canonical_package` | Recorded official package revision | Record the base and content identity. A new draft is not that old revision. |
| `proposed_pr` | Bound PR base, head, and diff | Judge contents and privacy. Do not infer admission or merge permission. |
| `field_package` | Native local experiment or unique installed delta | Preserve the private original and provenance. Select a formal owner only on request. |
| `reference_evidence` | Official docs, help, source, manifest, lock, or observation | Record version, location, and limitations. Evidence is not an admitted package. |

Record owner, privacy, provenance, unique delta, disposition, and admission state.
Keep private account values and personal source text out of public packages.
Use a narrow linked provenance source only when the requested package needs it.
Do not expand a harvest into all memory files or conversations, and do not add a harvesting cron, daemon, or distribution service.

When a requested harvest becomes a formal correction, put the repeatable step in the workflow, the failure it prevents in the recorded-mistake line, and the event plus any operator-supplied source in the destination history.

### Move, rename, retire

Move the selected package and repair active references: script paths, links, verification notes, and registrations.
Do not rewrite historical records or unrelated projects.
Stop on a conflicting destination or an escaping symlink rather than overwriting unrelated work.
Reuse evidence only while content is provably identical.

Retire only an explicitly approved target, after preserving unique knowledge and resolving live references.
Remove the package instead of leaving a compatibility alias or a loadable stub.
Keep retirement history in the destination changelog or repository history, not in an invented frontmatter status.
Source retirement and installed cleanup are different effects.
Neither authorizes deleting projects, worktrees, or personal data.

If authoring is abandoned, retain the draft and its real status.
Do not present it as admitted or deployed, and do not merge or discard unrelated work to make the lifecycle look finished.

### Git delivery

Use a clean start only when the destination is a Git repository.
Inspect the worktree and the selected base.
Leave unrelated work in place.
Use the destination's approved workspace: normally a topic branch from the recorded base, or an authorized isolated worktree when the tree already holds unrelated work.
Do not stash, discard, or carry that work into the change.
A fetch of a missing revision does not authorize a pull, reset, or deletion.

Branch, commit, and pull request are an additional delivery effect, not the completion condition for authoring.
They do not authorize live publication, install, reload, or deployment.
When commit and PR permission exists, publish one logical change and record the actual commit and PR.
Otherwise report publication as pending.
Do not fabricate either.

An existing approval remains valid for the same target, command, and effect.
A new target or an expanded irreversible effect needs a new decision.
Do not ask again for an unchanged reversible correction.

## Facts the task actually uses

A dependency is related only when this task's recipe invokes it, or the selected destination requires it for this task.
An installed but unused runtime or CLI is unrelated.
GJC, `gh`, a vendor CLI, and a vault path are never preconditions for authoring elsewhere.

When the recipe depends on a mutable CLI, API, service, runtime, or official skill, record the name, official source, a safe version probe, and the supported boundary.
Note `verified_against: <tool>@<version>` on the history entry when a probe was actually run.
Consult official primary documentation when a fact is unknown, ambiguous, or version-dependent.
Encode the resulting form, or link the exact official source when reproducing it would be brittle.
When sources conflict, disclose the conflict at the point of use.
Prefer a more specific local contract or reproducible evidence for the target version and platform over general documentation.
Leave an unresolved fact unknown.

Checking that fact is not a host upgrade, and it does not block source authoring.
Installing, updating, or deploying a dependency is a separate authorized effect.
Do not require the latest stable, repair siblings, or leave the authoring run incomplete because a host tool is stale.
Do not invent a fallback, build a dependency inventory, or mass-edit untouched packages to refresh unrelated tools.
A version or help check is not compatibility, update completion, or deployment proof.

## Explicit routes

Portable recipes do not depend on one vendor's loader, plugin command, frontmatter field, or proprietary tool.
They may require a standard tool only when the package documents it.
Put runtime-specific discovery, installation, permission, and packaging facts in that runtime's route.
State the boundary there instead of claiming universal compatibility.
Model support does not add another CLI to deployment scope.
An absent runtime gets honest support guidance, not an install performed only to complete a matrix.

Re-compare an upstream creator by extracting the local gap.
Do not re-host its product commands or evaluator harness.
Inventory each mechanism and label it native compatibility, upstream recommendation, or local policy.
Ask whether it would still be true on a runtime that vendor does not control.
Universal craft folds into the page that already owns the topic.
Vendor plumbing stays a link and a boundary.
When unsure, keep it on the route: promoting later is cheap, and un-polluting the core is not.
A conflict changes local policy only by a deliberate decision, recorded with both positions.

Routes are links and boundaries, not product manuals.
Do not copy loader parsing, native field catalogs, install commands, or host-version inventories here.

| Route | Read when | Boundary |
|---|---|---|
| Anthropic / Claude Code | That runtime is selected | [Fable prompting](https://platform.claude.com/docs/en/build-with-claude/prompt-engineering/prompting-claude-fable-5) and current Claude Code docs own product behavior. Fable-only API behavior is not portable. Do not re-host Anthropic's evaluator. |
| OpenAI / Codex | That runtime is selected | [Latest-model guide](https://developers.openai.com/api/docs/guides/latest-model) and current Codex docs own product behavior. `agents/openai.yaml` and plugin distribution stay there. This library still keeps a local changelog where a destination allows it. |
| Hermes | That runtime is selected | [Hermes skills guide](https://github.com/NousResearch/hermes-agent/tree/main/website/docs/user-guide/skills). Rich metadata, taps, and plugins are not portable. A shorter native description budget is not averaged into this library's shape guidance. |
| Cursor | Cursor discovery or packaging is requested | [Cursor Agent Skills](https://prod.cursor.com/docs/skills). Presentation and invocation-control fields stay there. Recursive discovery is not permission to nest `SKILL.md`. |
| Grok-native | A native Grok operation is explicitly requested | [Grok 4.6 model guide](https://docs.x.ai/developers/grok-4-6.md) and [native skills docs](https://docs.x.ai/build/features/skills-plugins-marketplaces). Model support through another agent does not require the Grok CLI. `allowed-tools` is not a portable security declaration on that runtime. |
| GJC | GJC is the selected authoring runtime | [GJC skills doc](https://github.com/Yeachan-Heo/gajae-code/blob/main/docs/skills.md) and installed help. A consumer does not need GJC because GJC authored the package. Official orca-cli and orchestration stay native originals. |

Uncovered local judgment that survives those routes:

- A structural pass is not behavioral evidence. Grade, compare, or diagnose only when the task needs that split.
- Keep the scope to the simplest complete solution, and ground progress in observed work.
- Match instruction freedom to fragility. State which actions proceed and which need approval.
- Improve instructions, task shape, and evidence before changing model or effort.
- Keep field learning separate from formal promotion. Discovery text stays short; procedural detail stays on demand.
- Do not equate a tap, a plugin hook, and a registered plugin skill. Inspect the selected runtime.
- A namespaced handle is an adapter fact. Frontmatter keeps the bare package name.
- Discovery, body load, and explicit invocation are separate facts. Do not infer one from another.
- Reuse task-bound evidence at admission instead of creating a second evaluator for the same behavior.
- Review a common policy once and batch dependent edits. A small change uses direct tools and focused verification.
- Use a planning workflow only when the operator selects it or the active runtime contract requires it. Never dispatch from a blocked plan or relabel an unreviewed draft as approved.

Declined as universal requirements, from the skillify v7.0.0 comparison and not re-checked against current vendor manuals for this page: fixed prompt counts, generated benchmark files, vendor eval viewers, description-optimization commands, and tool-namespaced package names.

## Recorded mistakes

- Authoring without a stated outcome and failure boundary → define them, then choose fixtures that exercise them.
- Forking an official skill or copying its command manual → leave the original unmodified; author only the uncovered gap.
- Treating a version or help check as compatibility or deployment proof → record the fact the task used, and prove install or deployment separately.
- Blocking source authoring because a host tool is not the latest stable → check the relevant official fact; upgrade only as its own authorized effect.
- Requiring generated eval output or a wording-locked corpus → verify observable functional, security, and data-integrity outcomes.
- Asking for generic repeated consent on reversible in-scope work → act inside the existing approval.
- Adding a checker-of-checker, or keeping a schema with no consumer and no safety owner → remove it or give it a real owner.
- A recipe citing a missing support file → add the file or remove the mention.
- Caps-lock to paper over overlapping routing → prove the boundary or keep ordinary prose.
- A nested `SKILL.md` → one flat directory.
- Hand-authoring into a destination without reading its policy → read that policy once, then author there.
- Treating install, registration, branch/PR, or publication as an automatic authoring side effect → each further effect needs its own approval.
- Requiring GJC, Git, `gh`, or a vault path for a task that does not use them → bind only the dependencies the task invokes.
- Importing upstream plumbing into the core, or re-hosting a vendor harness as local policy → extract the gap and record the divergence.
- Memorizing examples in the body → generalize, and check prompts that were not used for tuning.
- Inventing a native API when official docs are uncertain → record the unknown.
- Leaving a compatibility stub after an approved retirement → remove the obsolete path.
- Expanding a requested harvest into private memory or conversations → keep the linked provenance narrow.

## Provenance

This page consolidates local craft from skillify v7.0.0.
History of that retired workflow remains in Git at the immutable source revision [836eb8778134d68f3ea675cd30ee5f9ae692f9e3](https://github.com/GoBeromsu/craft-skills/commit/836eb8778134d68f3ea675cd30ee5f9ae692f9e3).
The package contract and verification pages own the rules this page only points at.

Lineage for the craft itself:

- Portable package shape and reusable-parts planning, adapted from the [Agent Skills specification](https://agentskills.io/specification), [anthropics/skills skill-creator](https://github.com/anthropics/skills/tree/3b3fad96af16a10759d930941b4520ba0c40edae), and the historical [OpenAI creator](https://github.com/openai/skills/tree/49f948faa9258a0c61caceaf225e179651397431).
- Evidence-proportional evaluation and lack-of-surprise, adapted from Anthropic and OpenAI creator craft and from [OpenAI](https://developers.openai.com/api/docs/guides/latest-model), [Anthropic Fable](https://platform.claude.com/docs/en/build-with-claude/prompt-engineering/prompting-claude-fable-5), and [xAI Grok 4.6](https://docs.x.ai/developers/grok-4-6.md) guidance checked as research evidence, not copied as product manuals.
- Requested field harvest and attention-budget discovery, adapted from Hermes skill-authoring craft.
- MECE ownership: operator correction, 2026-07-08. One owner per rule; link instead of restating.
- Clean-state inspection and non-destructive isolation, folded from `docs/research/omo-analysis.md` (2026-07-12).
- Cross-skill lineage snapshot: `skills/PROVENANCE.md`. Update its row when a package's primary source changes. Provenance does not belong in `SKILL.md`.

History retained from the retired workflow, newest substantive shifts last:

- 2026-06-03 to 2026-06-07 — skill CRUD, a hygiene playbook, and a deterministic format check replaced prompt-only review. Early consensus gates, five-key frontmatter, and a writer/reviewer/grader roster were later removed.
- 2026-07-06 — v4.0.0 realigned the library to vendor-official authoring: spec-minimal frontmatter and an eval-first loop. v4.1.0 added the recorded-mistake registry.
- 2026-07-19 — vendor lenses and the absorption protocol landed. Universal lessons (degrees of freedom, reusable parts, undertrigger-aware descriptions, baseline comparison) moved into core. Sentence-boundary line breaks became a local typography preference.
- 2026-08-28 — v4.7.0 adopted the portable baseline and guarded optional spec keys. v4.7.2 made "simplest complete solution" a core rule and kept Fable-only API behavior on the Anthropic route. v4.7.3 replaced a stale naming example (`hookify`) with `guardrails` as a plain noun.
- 2026-08-30 — v4.9.0 allowed an optional leading routing directive only with behavioral evidence. Lexical grammar is not proof. A later attempt to validate that grammar deterministically was dropped.
- 2026-09-02 — an exact `## Output contract` heading and a mandatory eval corpus were tried and then withdrawn as format gates. The cannot-succeed behavior remains an authoring obligation judged by review.
- 2026-09-03 to 2026-09-04 — declared inputs replaced ambient configuration. Cross-package `../` links were forbidden because the Hermes tap fetcher aborts on them.
- 2026-09-10 — v5.0.0 replaced fixed evaluation quotas and per-skill orchestration with risk-proportional checks, task-and-content-bound admission, and requested harvest.
- 2026-09-20 — v6.0.0 stopped treating a version check plus generated eval output as success. Official originals stay unmodified. Verification keeps functional, security, and data-integrity fixtures plus independent judgment.
- 2026-09-24 — skillify v7.0.0 completed authoring at the chosen destination with an evidence handoff. Branch/PR, install, registration, and publication became separate effects. Dependency notes bind only tools the task uses. Checking an official fact does not require a host upgrade.

Dropped history remains in Git.
Do not grow a sidecar archive.
