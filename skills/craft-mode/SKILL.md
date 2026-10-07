---
name: craft-mode
description: "Routes multi-step engineering work through a chosen playbook, situational workflows, and domain-owned principles. Use for craft-mode, a rigorous feature or bug fix, a migration, a measured performance problem, or work that needs a clear finish condition and evidence. Keeps replies concise, applies unslop to prose, and uses independent workers only when the runtime supports them. A named procedure such as how, why, correct, or tdd can run directly; domain policy stays with its principle owner."
metadata:
  version: 1.1.1
---

# Craft mode

Turn the user's goal into a verified result through one selected playbook.
Keep the requested artifact in the target project's chosen location and report the evidence that establishes its outcome.
An explanation or plan request ends with that artifact, not an implementation.

## Run the task

1. At the start of every multi-step task, read the inline principle index below.
   Apply the principles the task triggers and read each applied principle's complete reference before using it.
   In the reply, name each applied principle together with the decision it changed.
   A citation with no changed decision is name-dropping, not application.
   The user can steer mid-task by naming a principle, such as "apply prove it works"; read it and change the relevant decision.
2. State the goal, scope, and observable finish condition.
   Pick one playbook from [Playbooks](references/playbooks.md), follow its steps, and invoke situational workflows by name when a step calls for them.
   Put its steps in the task list when the runtime provides one; retain a skipped step with its reason.
   For a large cross-cutting run or no fitting recipe, use figure-it-out to tailor the selected playbook before execution.
3. Ground decisions in the code and real behavior through how, adding why for causal questions.
   Before writing logic, name the data shape and organizing structure.
   Use architect for a change across function or module boundaries and arena when competing designs need evidence.
   Prefer deletion and the smallest complete change over speculative abstractions.
4. Verify on the affected surface and against the finish condition.
   Read delegated diffs and check their evidence yourself.
   A build, a worker's success claim, or an inconclusive run does not prove user-visible behavior.
   Report an unavailable check, partial result, or blocker as such, finish independent in-scope work, and leave a precise resume point.
5. Apply unslop to every reply and all other prose, including documentation, review descriptions, and commit messages.
   Code and fixed machine formats are excluded.
   Lead with the user's outcome, keep sentences concise without dropping required details, and distinguish observed evidence from inference.
   Give a candid recommendation, not automatic agreement.

## Capability and authority

Delegate only a bounded independent lane when the runtime supports workers and delegation helps.
Give it the goal, allowed paths, inputs, finish condition, and required evidence.
Separate mutable files and branches before concurrent writes.
Without workers, execute those lanes sequentially, keep their results separate, and report the loss of independent review rather than claiming a worker ran.
For bulky sources, read bounded chunks and retain findings when delegation is unavailable.

Use native event notifications for an explicitly requested continuing run when available.
Without a wake mechanism, work while the session can execute, then leave a checkpoint naming the pending event; do not promise background continuation.
No playbook silently starts automation, reads private transcripts, installs or reloads skills, or grants permission to publish, merge, send messages, or delete data.
Use only the authorization already given for the specific effect.
Proceed with reversible work inside scope; ask for product choices that evidence cannot settle.

Use [Usage](references/usage.md) for choosing or steering a route and [Setup](references/setup.md) for native discovery.
Use [Catalog](references/catalog.md) to find where an upstream pstack skill or principle lives now, or why it is not offered.
Use [Owner decisions](references/conflicts.md) when inherited rules conflict; do not rewrite a principle to resolve the conflict.

## Principle index

Cross-package pointers name the owning skill and its file; resolve them through that skill's native discovery location.
These leaves are rules, not separate commands.

### Core

- **Laziness Protocol** prefers deletion and the smallest change that solves the problem. File: `principle-programming/references/laziness-protocol.md`.
- **Foundational Thinking** chooses the core data structures before writing logic. File: `principle-architecture/references/foundational-thinking.md`.
- **Redesign from First Principles** integrates a new requirement as if it had been there from day one. File: `principle-architecture/references/redesign-from-first-principles.md`.
- **Attack the Premise** questions the premise that two or more failed fixes shared, after a census of which actors hold the imbalance. File: `debug/references/attack-the-premise.md`.
- **Subtract Before You Add** removes dead weight before building on top of it. File: `refactor/references/subtract-before-you-add.md`.
- **Minimize Reader Load** collapses layers and hidden state a reader must hold in their head. File: `principle-programming/references/minimize-reader-load.md`.
- **Outcome-Oriented Execution** converges rewrites on the target design instead of preserving throwaway compatibility states. File: `principle-architecture/references/outcome-oriented-execution.md`.
- **Experience First** chooses the user's result over implementation convenience. File: `principle-frontend/references/experience-first.md`.
- **Exhaust the Design Space** builds two or three competing prototypes when there's no precedent. File: `principle-architecture/references/exhaust-the-design-space.md`.
- **Build the Lever** builds the script that does or proves the work, so a reviewer can rerun it. When an agent keeps doing the same thing by hand, have it write the tool or skill it wishes it had. If a script can do a step the same way every time, use the script, and save agents for the judgment calls. File: `principle-programming/references/build-the-lever.md`.

### Architecture

- **Model the Domain** encodes repeated rules in one structure, not scattered conditionals. File: `principle-programming/references/model-the-domain.md`.
- **Boundary Discipline** validates at the boundary and trusts internal types. File: `principle-backend/references/boundary-discipline.md`.
- **Type System Discipline** makes illegal states unrepresentable. File: `principle-programming/references/type-system-discipline.md`.
- **Make Operations Idempotent** converges retries on the same end state. File: `principle-backend/references/make-operations-idempotent.md`.
- **Migrate Callers Then Delete Legacy APIs** migrates and deletes in one wave. File: `principle-architecture/references/migrate-callers-then-delete-legacy-apis.md`.
- **Separate Before Serializing Shared State** removes the sharing before adding coordination. File: `principle-architecture/references/separate-before-serializing-shared-state.md`.

### Verification

- **Prove It Works** verifies the real artifact, not a proxy. File: `principle-testing/references/prove-it-works.md`.
- **Fix Root Causes** reproduces and traces to the cause before changing code. File: `debug/references/fix-root-causes.md`.
- **Sequence Work into Verifiable Units** ends each small unit in a check before starting the next. File: `principle-testing/references/sequence-verifiable-units.md`.
- **Test Behavior, Not Implementation** calls the code the way its users do and asserts a literal expected value, and deletes a test that would still pass if every imported function returned `undefined`. File: `principle-testing/references/test-behavior-not-implementation.md`.
- **Explain the Number** names what limits a measured number and rules out that it measured something else, before anyone trusts or reports it. `/benchmark-checklist` turns it into seven questions you answer from real runs. File: `principle-testing/references/explain-the-number.md`.

### Delegation

- **Guard the Context Window** routes bulk reading to subagents and keeps findings in the main chat. File: `references/guard-the-context-window.md`.
- **Never Block on the Human** proceeds on reversible work and presents the result. File: `references/never-block-on-the-human.md`.

### Meta

- **Encode Lessons in Structure** turns advice you've repeated twice into a lint, check, or script. `/correct` applies it to a whole repo, as shown in Make it yours. File: `correct/references/encode-lessons-in-structure.md`.
