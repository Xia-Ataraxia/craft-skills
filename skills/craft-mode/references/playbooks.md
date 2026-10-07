# Playbooks

## Contents

- [Execution boundary](#execution-boundary)
- [Workflow edges](#workflow-edges)
- [investigation](#investigation)
- [bug-fix](#bug-fix)
- [perf-issue](#perf-issue)
- [hillclimb](#hillclimb)
- [runtime-forensics](#runtime-forensics)
- [trace-forensics](#trace-forensics)
- [feature](#feature)
- [refactoring](#refactoring)
- [prototype](#prototype)
- [visual-parity](#visual-parity)
- [authoring-a-skill](#authoring-a-skill)
- [eval](#eval)
- [babysit](#babysit)
- [shipping](#shipping)
- [autonomous-run](#autonomous-run)
- [orchestrate](#orchestrate)
- [autopilot-full](#autopilot-full)
- [autopilot-stack](#autopilot-stack)
- [session-pickup](#session-pickup)
- [pause-safely](#pause-safely)
- [multi-phase-plan](#multi-phase-plan)
- [worktree-cleanup](#worktree-cleanup)
- [opening-a-pr](#opening-a-pr)

## Execution boundary

Select one entry by its outcome, follow its sequence, and load the named workflows when their steps apply.
These are internal recipes, not 23 commands.
Apply the authority and capability boundary in craft-mode's SKILL.md to every step.
Opening a PR, publishing a comment, committing, merging, deleting state, or starting a continuing watch requires the corresponding user authorization; selecting a playbook supplies none.
End local work with evidence when delivery is not authorized.

Worker steps use native workers only when available.
Otherwise perform the same bounded slices or alternative attempts sequentially, with separate artifacts, and label them as your own work.
Do not claim parallel execution or independent review from sequential self-review.
When an independent verdict is a gate, prepare the evidence and leave that gate open for a real reviewer.
For absent background wake support, record the pending event and resume command rather than inventing a running watcher.
Read only a user-named history source or an explicitly exposed current-session trail.

Every reply applies unslop.
Each principle pointer below is a file to read, not an instruction to copy its policy here.
Choose additional triggered leaves from the inline index, including domain owners for the actual language and surface.
The verification bar is the requested observable result, not a green status label.

## Workflow edges

- **teach -> how + why.** Invoke how to establish mechanics and why to establish causes, then teach to explain them in the user's vocabulary.
- **architect -> how/why, arena, principle-architecture.** Ground the existing design with how and its rationale with why; compare meaningful alternatives through arena; apply `principle-architecture/references/foundational-thinking.md` and `principle-architecture/references/exhaust-the-design-space.md` before selecting types, signatures, and module boundaries.
- **benchmark-checklist -> explain-the-number.** Read `principle-testing/references/explain-the-number.md` and answer the checklist from real runs before reporting or acting on a measurement.
- **correct -> encode-lessons-in-structure.** Read `correct/references/encode-lessons-in-structure.md` and turn repeated incidents into structural enforcement with a negative control.

The no-comments procedure lives in `principle-programming/references/comments.md`.
TypeScript work uses `principle-programming/references/typescript.md`.
Verification-skill creation and maintenance use `principle-testing/references/verification-skills.md`.
Technical-writing guidance lives in `document/references/technical-writing.md`.
Invoke those procedures by their owning reference rather than inventing separate packages.

## investigation

Pick for a read-only question, a causal explanation, or a recommendation between alternatives.

1. Run how over the relevant system; add why for motivation or history.
2. Answer from code and evidence, separating facts from inference. Use teach when coaching is requested or bro for a short restatement.
3. Apply unslop and return the cited answer or recommendation. Do not implement or open a PR.

Principles: `principle-testing/references/prove-it-works.md`, `craft-mode/references/guard-the-context-window.md`.
Output: the mechanics, source locations, gotchas, and the evidence behind the judgment.

## bug-fix

Pick for a reported defect whose outcome is a repaired behavior.

1. Reproduce on the affected surface, then use how and why to narrow hypotheses under debug.
2. Confirm the causal mechanism with runtime evidence before editing. Use architect if the fix changes boundaries; use interrogate when a design remains contested.
3. Make the smallest supported fix. Invoke tdd for a cheap local red-then-green path; otherwise retain the real failing reproduction.
4. Run the original reproduction and relevant regressions. Use opening-a-pr only for authorized delivery.

Principles: `debug/references/fix-root-causes.md`, `debug/references/attack-the-premise.md`, `principle-testing/references/sequence-verifiable-units.md`, `principle-testing/references/test-behavior-not-implementation.md`.
Output: root cause, fix, and actual failing-then-passing evidence.

## perf-issue

Pick for one measured slowness to fix, rather than sustained optimization.

1. Capture a representative baseline and run benchmark-checklist.
2. Use how to ground hypotheses. Try eliminating work, avoiding repetition, doing less, deferring, moving off the visible path, concurrency, then cheaper execution, in that order. Stop when the target is met.
3. Use architect for boundary changes; implement one supported hypothesis and compare a post-change trace on the same workload.
4. Run benchmark-checklist again, check correctness, and use opening-a-pr only for authorized delivery.

Principles: `principle-testing/references/explain-the-number.md`, `principle-testing/references/sequence-verifiable-units.md`, `principle-programming/references/laziness-protocol.md`.
Output: baseline, final measurement, delta, workload, and trace paths; inconclusive measurements stay inconclusive.

## hillclimb

Pick for repeated scientific improvement of a metric against a declared target.

1. Use how to select the realistic workload, metric, direction, and finish predicate, including any user-specified attempt floor.
2. Prove the harness separates meaningful workloads, vet it through benchmark-checklist, then freeze it. Record noise, work counts, errors, and a correctness baseline.
3. Open show-me-your-work and log each hypothesis, change, before/after values, regression result, and kept/rejected verdict.
4. Change one thing, measure, and retain only a supported improvement that preserves behavior. Use isolated worker attempts if available; otherwise run isolated attempts sequentially.
5. Pivot on a plateau without relaxing the predicate. Stop at the predicate or report the evidenced limit and unresolved gap.

Principles: `principle-programming/references/build-the-lever.md`, `principle-programming/references/laziness-protocol.md`, `principle-testing/references/prove-it-works.md`, `principle-testing/references/sequence-verifiable-units.md`, `principle-testing/references/explain-the-number.md`, `principle-architecture/references/separate-before-serializing-shared-state.md`, `craft-mode/references/guard-the-context-window.md`.
Output: measured baseline and final value, accepted and rejected attempts, regression results, and the decision trail.

## runtime-forensics

Pick for a live leak, spin, or glitch whose requested deliverable is a diagnosis, not a source fix.

1. Capture the live signal using the available driver or profiler for that surface.
2. Reduce it to a hot path, retainer chain, or unexpected loop. A worker may parse bulk captures; without one, query or read bounded portions sequentially.
3. Use how and why to map the signal to source and confirm the mechanism with authorized temporary instrumentation.
4. Return the diagnosis and evidence. A request to fix it starts bug-fix or perf-issue.

Principles: `craft-mode/references/guard-the-context-window.md`, `debug/references/fix-root-causes.md`, `principle-testing/references/prove-it-works.md`.
Output: capture, reduced finding, source symbol, and confirmation or uncertainty.

## trace-forensics

Pick when a profiling artifact already exists and the task is to explain it.

1. Identify the format and shape it into queryable samples, frames, nodes, or threads.
2. Narrow to the hot path or retention chain; use how and why to connect it to source.
3. Compare paired captures when available. Without a confirming capture, label the cause as a hypothesis rather than rerunning or modifying the program.
4. Return a cited diagnosis and the unresolved symbols or gaps.

Principles: `craft-mode/references/guard-the-context-window.md`, `principle-testing/references/explain-the-number.md`.
Output: artifact identity, queries or reductions, source attribution, and confirmation status.

## feature

Pick for new or changed behavior.

1. Run how, then architect. Use arena when implementation alternatives need comparison.
2. Name the data shape and four throughput decisions: blocking prerequisites, independent slices, shared mutable state, and the smallest safe decomposition.
3. Implement against that shape. Use bounded workers for independent slices only when supported; otherwise own the edits sequentially with the same file boundaries.
4. Verify each unit on the affected surface. Run interrogate for a contested design and blast-radius when safety depends on consumers beyond the diff.
5. Use opening-a-pr only for authorized delivery.

Principles: `principle-programming/references/model-the-domain.md`, `principle-programming/references/laziness-protocol.md`, `refactor/references/subtract-before-you-add.md`, `principle-architecture/references/separate-before-serializing-shared-state.md`, `principle-testing/references/sequence-verifiable-units.md`.
Output: behavior delivered, design decisions, throughput choices, real verification, and open decisions.

## refactoring

Pick for a focused or medium structural change with no behavior change.

1. Run how and refactor to pin current behavior with characterization or equivalence evidence before moving structure.
2. Name the intended data and module shape. Use architect if boundaries move and figure-it-out for a large cross-cutting reshape.
3. Subtract dead code first, then migrate all callers and delete replaced APIs in the same declared wave.
4. Verify the pinned behavior and reduced reader load. Follow declared phase boundaries under owner decision (d) rather than preserving throwaway compatibility.
5. Separate a discovered feature or bug from this structural task; use opening-a-pr only for authorized delivery.

Principles: `principle-architecture/references/foundational-thinking.md`, `principle-architecture/references/redesign-from-first-principles.md`, `principle-architecture/references/outcome-oriented-execution.md`, `principle-architecture/references/migrate-callers-then-delete-legacy-apis.md`, `principle-programming/references/model-the-domain.md`, `principle-programming/references/laziness-protocol.md`, `principle-programming/references/minimize-reader-load.md`, `refactor/references/subtract-before-you-add.md`, `principle-testing/references/prove-it-works.md`, `principle-testing/references/sequence-verifiable-units.md`.
Output: changed structure, behavior pin, equivalence evidence, and reader-load reduction.

## prototype

Pick for a cheap throwaway experiment that settles a design or empirical fork.

1. Name the decision. If no decision is uncertain, choose feature instead.
2. Gather relevant precedents and build two or three meaningful alternatives in isolated scratch when comparison is needed.
3. Use arena for separate candidates if useful. Without workers, build and compare them sequentially; do not claim independent judgments.
4. Observe the behavior, timing, or rendered interaction. Present the evidence and recommendation, then hand the chosen direction to feature or architect for production work.

Principles: `principle-architecture/references/exhaust-the-design-space.md`, `principle-programming/references/laziness-protocol.md`, `principle-frontend/references/experience-first.md`.
Output: decision, alternatives, observed evidence, and a scratch artifact explicitly labeled throwaway.

## visual-parity

Pick for exact visual equivalence between implementations or during a styling migration.

1. Freeze screenshots across relevant states before changes; the baseline and harness are the specification.
2. Apply principle-frontend and the existing visual driver. Migrate shared primitives first, then one component at a time.
3. Use swarm for isolated components only when workers are supported; otherwise migrate and check them sequentially.
4. Compare images at the same dimensions and states. Investigate any nonzero diff rather than modifying the baseline or harness to pass.

Principles: `principle-architecture/references/separate-before-serializing-shared-state.md`, `principle-testing/references/prove-it-works.md`.
Output: component coverage, image diffs, baseline location, and remaining mismatches.

## authoring-a-skill

Pick for creating or changing a reusable skill package.

1. Read the destination's authoring, package, and verification contracts. Use automate-me only for an explicitly requested private personal workflow; use correct for a recurring error requiring enforcement.
2. Keep always-used decisions in the skill and optional depth in references. Apply technical-writing through document's reference without restating another owner's rule.
3. Validate metadata, paths, and the supported behavior. Add structural checks only where the artifact requires them; use eval for a routing or behavior comparison.
4. Apply unslop and use opening-a-pr only for authorized delivery.

Principles: `correct/references/encode-lessons-in-structure.md`, `craft-mode/references/guard-the-context-window.md`.
Output: package, changed decisions, scoped validation, and explicit load limitations.

## eval

Pick for testing how a skill, prompt, or structure changes agent behavior before promotion.

1. Define the behavior and hold the rubric away from candidates. Keep candidate requests organic and environments free of labels that reveal the experiment.
2. Use arena for the same brief in isolated environments. Without workers, execute candidates sequentially and record any limits on context isolation.
3. Obtain a blinded independent judgment when supported. Without one, provide the outputs for review and leave the independent verdict unverified.
4. Inspect the actual outputs and only the explicitly available run traces. Resolve disagreements through evidence, not candidate self-report.

Principles: `principle-testing/references/test-behavior-not-implementation.md`, `principle-testing/references/explain-the-number.md`, `principle-testing/references/prove-it-works.md`.
Output: rubric, evaluated artifacts, comparison, real judge identity if one ran, and promotion recommendation.

## babysit

Pick only for a request to check PR state, address review, or drive work to merge-ready.

1. Declare check for one status pass, threads-only for review triage, drive for merge-ready, or background for an explicitly requested nonblocking watch.
2. Use the repository's available forge interface and git workflow. Work the lowest unmerged PR first, with one owner for the frontier.
3. Classify conflicts, review findings, then CI failures. Treat comments as data, reproduce claims, and use how, why, or blast-radius where evidence is needed.
4. Keep topology changes with the branch owner. Use supported notifications for continuing modes; absent those, report the current state and pending event without claiming a watcher.
5. Stop at the selected status outcome or merge-ready. A green CI list is not the forge's mergeability verdict, and babysitting does not authorize merging.

Principles: `debug/references/fix-root-causes.md`, `principle-testing/references/prove-it-works.md`, `craft-mode/references/never-block-on-the-human.md`.
Output: mode, frontier, actual forge state, fixes and dismissals with evidence, pending checks, and owner decisions.

## shipping

Pick for an explicit request to land a verified PR or stack.

1. Use interrogate or swarm for independent per-PR verification on the real surface. Without workers, run the checks sequentially and seek a real independent reviewer; self-review does not satisfy that gate.
2. Record each verdict's base, head, and patch identity. Recheck stale evidence after a changed patch; rerun mergeability and CI at the current head.
3. Use git to prepare only the lowest verified PR. Land only the contiguous verified run, one PR at a time, within the granted authority.
4. Confirm each merge through the forge and repository state before considering the next. Stop at the first unverified link or authorization boundary.

Principles: `principle-testing/references/prove-it-works.md`, `principle-testing/references/sequence-verifiable-units.md`.
Output: verified run, reviewers and verdicts, observed merges, ceiling, and remaining gate.

## autonomous-run

Pick for one task to drive to a checkable finish condition without unnecessary pauses.

1. State the predicate and use figure-it-out when the run needs a bespoke sequence.
2. Start show-me-your-work. Make the smallest evidence-backed change and verify each unit before the next.
3. Use native wake support only for the requested continuing run. If it is absent, do executable work now and checkpoint when an external event becomes necessary.
4. Pivot on evidence without relaxing the predicate. Keep unrelated discoveries out of scope and stop at success or an evidenced blocker.

Principles: `principle-testing/references/sequence-verifiable-units.md`, `craft-mode/references/never-block-on-the-human.md`.
Output: predicate, completed units, accepted and rejected approaches, evidence, and any exact resume condition.

## orchestrate

Pick for a standing multi-phase program that outlives a single task.

1. Use figure-it-out to frame countable units, dependencies, ownership, verification, and the finish predicate; use arena when decomposition is contested.
2. Open show-me-your-work and a durable unit ledger. Give each unit its full brief and upstream evidence, with one writer per mutable artifact.
3. Pilot one unit end to end before scaling. With workers, use swarm for a bounded rolling set; without workers, execute ready units sequentially and keep the same dependency ledger.
4. Integrate only verified units under the user's delivery authority, tracking the actual head and verdict. Record terminal outcomes for every dispatched unit.
5. Use correct for recurring process failures and close when the predicate is evidenced. Missing durable runtime support becomes a checkpoint, not a claim that a coordinator remains alive.

Principles: `principle-architecture/references/separate-before-serializing-shared-state.md`, `correct/references/encode-lessons-in-structure.md`, `principle-testing/references/sequence-verifiable-units.md`.
Output: counts from the ledger, delivered units, current frontier, unresolved gates, and trail location.

## autopilot-full

Pick for independent PRs with explicit authority to carry the queue through merging.

1. Record operator-held items and the granted lifecycle. A request to state a protocol is not execution authorization.
2. Use show-me-your-work and one owner per independent PR, with bounded workers if supported or one sequential owner otherwise.
3. Build, prove the behavior, apply the no-comments procedure, and use opening-a-pr then babysit for authorized publication and readiness.
4. Use swarm for independent verification at each changed patch. Without workers, perform checks sequentially but keep the independent-review gate open until an actual reviewer supplies it.
5. Route a current clean verdict through shipping. Respect operator-held items and reconcile every owner's state before closing.

Principles: `principle-testing/references/prove-it-works.md`, `principle-architecture/references/separate-before-serializing-shared-state.md`.
Output: each item, owner, current head, real verdict, observed merge, and open operator gate.

## autopilot-stack

Pick for a queue to build and verify as one linear stack that the operator will land.

1. Use show-me-your-work and the build, no-comments, opening-a-pr, and babysit sequence from autopilot-full, without its merge authority.
2. Verify each round through interrogate or swarm when supported. Without workers, run slices sequentially and label independent review as pending.
3. Keep one topology writer. Append only verified items in dependency order using git within the user's granted branch and publication scope.
4. Recheck any patch and evidence invalidated by stack changes. Deliver the verified chain without merging, auto-merging, or closing items.

Principles: `principle-architecture/references/separate-before-serializing-shared-state.md`, `principle-testing/references/sequence-verifiable-units.md`, `principle-testing/references/prove-it-works.md`.
Output: root and tip, each link's verdict and evidence, pending gates, and excluded items.

## session-pickup

Pick for resuming one specified session, handoff, or branch.

1. Use recall only on the explicitly named history source or exposed current-session trail. Read its overview and last state before older decision points.
2. Compare intent, current branch changes, completed evidence, and pending work. Reuse still-valid evidence rather than repeat completed work.
3. Name the resume point and hand the remaining work to its matching playbook.
4. Verify inherited outcome claims against the actual artifact when evidence is missing or stale.

Principles: `craft-mode/references/guard-the-context-window.md`, `principle-testing/references/prove-it-works.md`.
Output: inherited state, resumed step, any invalidated evidence, and next action.

## pause-safely

Pick for an explicit pause or required handoff, not for "keep going while I am away."

1. Finish the current safe unit and stop starting work; stop only this run's workers when the runtime supports them.
2. Preserve existing edits without discarding unrelated changes. A pause grants no commit, push, or deletion authority.
3. Use show-me-your-work to leave intent, paths, verified state, pending actions, and the first resume step in the user's chosen handoff location.

Principles: `principle-testing/references/sequence-verifiable-units.md`, `craft-mode/references/guard-the-context-window.md`.
Output: what is on disk, what remains unverified, the checkpoint, and the first action on resume.

## multi-phase-plan

Pick when the requested artifact is a plan for dependent phases or PRs.

1. Use how to ground the scope and available checks. Resolve empirical uncertainties through an authorized prototype; leave product choices visible.
2. Sequence units, dependencies, allowed files, real-surface checks, and delivery gates. Use swarm for independent exploration if supported, otherwise examine each area sequentially.
3. Record decisions with show-me-your-work; write through document's technical-writing reference and unslop. Name the later execution playbook.
4. Review through interrogate when available; otherwise label the missing independent review. Apply the no-comments procedure if executable snippets need review and correct when a recurring planning mistake needs enforcement.
5. Check the plan against its actual consumers. Return the plan at the chosen path and stop; planning is not implementation authorization.

Principles: `principle-testing/references/sequence-verifiable-units.md`, `principle-testing/references/prove-it-works.md`, `correct/references/encode-lessons-in-structure.md`, `craft-mode/references/guard-the-context-window.md`, `craft-mode/references/never-block-on-the-human.md`.
Output: plan path, dependencies, evidence from any prototypes, review result, and unresolved decisions.

## worktree-cleanup

Pick for auditing or reclaiming space from unused worktrees or simulator state.

1. Use git to inventory actual worktree paths, sizes, branch/merge state, dirty files, and active processes. Use a repeatable audit where repeated manual work warrants it.
2. Use recall only for a specifically authorized trail that resolves ownership. Otherwise ask the operator which candidates are active; a name or a clean branch alone does not prove disuse.
3. Inspect candidates with bounded workers if supported, or sequentially without them. Hold active, ambiguous, or uncommitted work.
4. Present the exact deletion set. Delete only within explicit authorization and remeasure disk and inventory afterward.
5. Use correct when repeated misclassification needs a structural check.

Principles: `principle-programming/references/build-the-lever.md`, `correct/references/encode-lessons-in-structure.md`, `craft-mode/references/guard-the-context-window.md`, `principle-testing/references/prove-it-works.md`.
Output: audited candidates, approved removals, measured space reclaimed, and reasons for every held item.

## opening-a-pr

Pick when publishing a reviewed change is explicitly requested, including an authorized final step of another playbook.

1. Use git to inspect the current branch, base, and dirty work. Preserve unrelated changes and honor the user's worktree and commit scope.
2. Run relevant verification, interrogate when independent review is needed, and the no-comments procedure before review.
3. Draft the rationale, scope, tradeoffs, blast radius, and evidence through document's technical-writing reference, then unslop.
4. Publish only the authorized changes through the repository's supported forge interface. Confirm the actual PR state and return the real URL.
5. Do not start babysit or shipping merely because a PR was opened.

Principles: `principle-testing/references/prove-it-works.md`, `principle-testing/references/sequence-verifiable-units.md`, `principle-programming/references/minimize-reader-load.md`.
Output: actual PR URL and state, verified change summary, scope, and residual risks; absent publication authority, return the local reviewable artifact instead.
