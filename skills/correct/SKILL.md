---
name: correct
description: "Finds repeated mistake classes and changes the repository so agents cannot repeat them. Use for \"/correct\", \"agents keep leaving debug prints\", \"make this correction stick\", or recurring review fixes with two or more observed incidents. Chooses architecture, types, lint/CI, tests, then docs and proves enforcement rejects a real past error. Not for reflecting on session learnings - use reflect; not for diagnosing a single failure - use debug."
metadata:
  version: 1.0.0
---

# Correct

The operator keeps correcting agents in this repo for the same mistakes. Change the repo so the next agent can't make them.

Assume every contributor is an agent that sees only the files it opened, copies the nearest example, and takes the shortest path that compiles. Design the repo so a change that looks right from one file is right for the whole repo.

## Find the mistake classes

First, read recent commits, reverts, review comments, agent instruction files, and comments that explain workarounds. Group the mistakes into classes. A class counts only with two or more observed incidents of the same class. Name the incidents and their source; a single correction is not enough.

Read [Encode Lessons in Structure](references/encode-lessons-in-structure.md) before choosing enforcement: encode recurring fixes in mechanisms instead of more instructions. Compose debug when the mechanism needs diagnosis, principle-architecture for ownership, principle-programming for types and implementation, and principle-testing for test policy.

## Fix each class at the highest level that works

Try architecture -> types -> lint/CI -> tests -> docs, in that order. Stop at the highest level that works and explain why each higher level cannot express this class.

1. **Eliminate it with architecture.** Give each piece of state one owner and each task one supported way. Hide internals so the wrong import fails. Replace hand-synced lists with one source of truth. Delete old ways and dead code an agent would copy.
2. **Enforce it with types so the bad state can't be written.** If bad code still compiles, add a lint or CI check whose error names the file, type, or function to use instead. If the pattern is already common, fail only when a change adds more.
3. **Test the behavior.** Fix or delete any test that would still pass if every function it calls returned nothing.
4. **Write docs or agent rules last, only for judgment calls.** Nothing fails when an agent skips them.

## Fix and prove

Then fix the most frequent classes now, one coherent change each. Create commits only when explicitly authorized. Prove each new check fails on a real past mistake. Record a failing-before/passing-after negative control: the new enforcement command must reject the historical faulty input for the intended reason, then accept the corrected current input. Capture both inputs, commands, outputs, and exit codes. A passing historical faulty input means the enforcement is not done. Run the same command locally and in CI; report CI as unrun when unavailable. Exceptions go on the offending line with a reason, an expiry date, and a human's approval.

## Keep the rule table

Last, keep a table in the agent instruction file that pairs each rule with what enforces it. When the operator corrects you, fix the mistake and add the rule. If the rule was already there and nothing enforces it, that's a repeat, so fix it at the highest level in the same change. Drop a rule once its mistake can't happen.

**Reply:** each class with its evidence, the level you picked, and why a higher level didn't work.
