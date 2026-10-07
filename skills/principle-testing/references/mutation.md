# Mutant checks on changed code

A mutant is a small, deliberate change that makes the code wrong.
If the test suite still passes against it, the suite has a hole.
The check in [test-behavior-not-implementation](test-behavior-not-implementation.md), where every imported function returns `undefined`, is the coarsest mutant there is.
This guide asks that same question one changed line at a time.

## When

Run a mutant check when a change touches logic, meaning a comparison, a branch, arithmetic, or a returned value, and the tests for it were added or changed.
Run it as well when you review tests an agent wrote.
Skip it for renames, copy, formatting, or configuration-only changes.
It doesn't reproduce a reported defect; that needs the fail-before evidence in [conventions](conventions.md#new-and-modified-tests).
Nor is it ever a universal proof or a required gate.

## Scope

Mutate only the source files that changed against the merge base with the integration branch.
Within those files, mutate only the changed lines.
Never mutate the whole repository.
One or two mutants per changed logic line is enough.

## Make the mutants

Pick the kind that would break what the line is for.

- Boundary or relational operator: `if (age >= 18)` becomes `if (age > 18)`.
- Negated or forced condition: `if (isAdmin)` becomes `if (true)` or `if (false)`.
- Arithmetic or off-by-one: `end = start + 1` becomes `end = start - 1`.
- Replaced return value: `return total` becomes a constant, an empty value, `null`, `true`, or `false`.
- Removed statement: delete a call such as `cache.invalidate(key)` or an assignment such as `user.lastSeen = now`.

## Run them

If the target repository already runs a mutation tool, as its own config, lockfile, or scripts establish, run that tool restricted to the changed files.
Follow the tool's official documentation for how to restrict it.
Never install, add, or recommend a mutation tool.

Otherwise, check each mutant by hand:

1. Apply one mutant to the source.
2. Run the narrowest existing tests that execute that line.
3. Record the mutant as killed (a test failed) or survived (every test passed).
4. Restore the file.
5. Confirm the version-control diff shows no remaining mutant before you make the next one.

Mutants and their reports are [scratch evidence](conventions.md#evaluation-inputs-and-outputs) and never get committed.

## Triage survivors

| Survivor | Decision | Why |
|---|---|---|
| Boundary or relational operator | Add one case at the boundary, at the cheapest layer | No test sits at the edge; see the time and state boundary rows in [admission](admission.md) |
| Removed, negated, or forced condition, or a deleted statement | Add one input that reaches the branch and asserts its public outcome | No current test reaches that branch or observes its effect |
| Changed log text, message wording, or a constant no behavior depends on | `no-test`, recorded once | A test for it would be the constant pin in [test-behavior-not-implementation](test-behavior-not-implementation.md) |
| A constant that behavior consumes, such as a threshold, limit, or default | Test the mechanism that reads it with one input at the boundary; never restate the value | That's how [test-behavior-not-implementation](test-behavior-not-implementation.md) tests a constant |
| Equivalent mutant with the same observable behavior | Skip and record once, with no source annotation | No test can tell it apart from the original |
| Survivor in code this change didn't touch | Outside this change; note it as a follow-up lead | The check covers only the changed lines |

One new case may kill several survivors, so write the case before counting what's left.
Derive its expected value from the specification or contract, never from the mutant or the implementation.
After the fix, reapply each surviving mutant, confirm a test now kills it, and restore the file.
A survivor that no credible case can kill and that names no risk is `no-test`.

## Record

Put the result in the existing task summary: the files checked and the survivor count for each decision.
When a check couldn't run, state that limit.
Never report a score or a percentage.
A PR gets at most one verification bullet, shaped like `mutant check on changed logic: N survivors, M killed by new cases, K no-test, S skipped`.
N counts every survivor found before triage, and M plus K plus S always equals N.
M counts the survivors the new cases killed, so one case that kills several survivors adds all of them to M.
K counts the survivors that took the `no-test` decision.
S counts the equivalent survivors and the survivors outside the changed lines.

## Why the score is never a target

An equivalent mutant behaves exactly like the original from the outside, so no test can kill it.
That makes 100% neither reachable nor meaningful.
Treat the score as a target and you reward killing mutants over naming risk.
A high score doesn't show that the specification is right.
It only shows that the tests notice change.

## Sources

- [Google, Practical Mutation Testing at Scale](https://arxiv.org/abs/2102.11378)
- [Google, Does mutation testing improve testing practices?](https://arxiv.org/abs/2103.07189)
- [Mutation-Guided LLM-based Test Generation at Meta](https://arxiv.org/abs/2501.12862)
- [All Smoke, No Alarm: Oracle Signals in Agent-Authored Test Code](https://arxiv.org/abs/2606.18168)
- [Trail of Bits, Mutation testing for the agentic era](https://blog.trailofbits.com/2026/04/01/mutation-testing-for-the-agentic-era/)
