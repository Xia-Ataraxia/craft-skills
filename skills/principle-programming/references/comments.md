# No comments

Run one comment review over the scope. Act on accepted findings.

Defer to the reviewer's fresh perspective.

## Scope

Use the caller's files or diff. Otherwise use the current diff against the base branch, default `main`, including the working tree.

## Steps

1. Start one independent reviewer the runtime provides, or run a careful self-review pass when none is available, and report it as a self-review. Pass the scope and the [reviewer brief](#reviewer-brief) unchanged. Do not restate its rules.
2. Inspect its report and diff. Reject application-code edits, scope escapes, exception-protected deletions, misstated `MUST KILL` reasons, and flags that treat kept intentional code as guilty. Reshape flags on our-code surprises stay actionable. Do not restore those comments. A keep survives only with proof it is about something we cannot change. Audit missed scoped lint and TypeScript suppressions. Correctness or safety suppressions stay actionable `MUST KILL`s. Restore deletions only with exact exceptions and scoped proof. Before accepting thin `IMPORTANT` or `do not remove` kills or keeps, run the how or why workflow on their symbol. If a kill is ambiguous, do not restore. If a keep is refuted or still ambiguous, delete it. Revert and rerun one rejected report with the failure named. Reject a second, report it open, and fail this procedure.
3. Fix trivial accepted flags directly by deleting a dead path, dropping a parameter, or using the real API. If any fix needs a shape, run the architect workflow once for the accepted set and surrounding code. Stop at the sketch. Architect shapes. Step 4 implements.
4. Implement the smallest root-cause fix in scope. Remove every named workaround. If the root cause is out of scope, land the smallest in-scope fix and report the rest open. The fix-root-causes principle (`debug/references/fix-root-causes.md`) and the redesign-from-first-principles principle (`principle-architecture/references/redesign-from-first-principles.md`) guide intent only. Neither authorizes widening the fence nor fixing instances outside it. Never bolt on symptom guards.
5. Constraint comments say `do not remove`, `do not change wording`, or `talk to X before changing`. Leave keeps about things we cannot change. Offer the cheapest in-scope type, runtime, test, or CI lint. Wait for interactive approval. Unattended and eval require caller pre-approval. If approved, encode then delete. Otherwise delete, report the constraint open, and sketch out-of-scope work.
6. Report the deletion count, restored comments, reruns, architect sketch, fixes, encoding offers, encodings, unenforced constraints, and other open work. Name whether the review came from an independent reviewer or a self-review pass.

## Reviewer brief

Review comments only. Take the caller's scoped files or diff. If none exists, take the current diff against `main`. Target narration, banners, commented-out code, and workaround explanations.

Only these exceptions survive:

- Legal or license headers.
- Non-obvious behavior forced by an external dependency, platform, vendor, or protocol we cannot reshape. Surprises in our own code do not qualify. Delete them and mark the exact symbol `MUST KILL` for rename, extract, type, or rearchitecture that makes the behavior obvious without prose.
- `// prettier-ignore`. Lint suppressions survive only when their rule is faulty, pedantic, or style-only.
- Doc comments that define a public API contract.
- Issue or RFC links that explain a constraint code cannot express.

That list is the only exception. When you are not sure a keep clause applies, delete the comment. Delete everything else.

Treat `eslint-disable`, `@ts-ignore`, `@ts-expect-error`, and similar suppressions as suspect. Look up the rule. If it catches real bugs or protects correctness or safety, delete the suppression and mark the exact guilty symbol `MUST KILL`.

`IMPORTANT`, `do not remove`, `too risky`, `fine for now`, and long justifications are a signal, not proof. Before judging, read nearby code. If its claim is not obvious there, run the how workflow, the why workflow, or both on the named symbol or call. Only a gotcha from the exception list about something foreign, proven true today on a live path, survives. Our-code surprises are deleted with the reshape flag above. Doubt that remains after that check means delete.

A long justification without a proven exception is an admission. Delete it. Never shorten it into a smaller excuse. Mark the exact guilty symbol `MUST KILL`. The review ends there. It does not touch the code.

Every flag names code inside the scope and tells the truth. Invent nothing. Touch only comments and identify refactor targets. Never write application code.

Report only. Name touched files, deletion count, `MUST KILL` flags with one line each, and skips.
