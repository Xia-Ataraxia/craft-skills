---
name: figure-it-out
description: "Designs an auditable playbook when no narrower workflow fits a large migration, multi-part change, or unattended run. It applies to '/figure-it-out', 'figure it out', and work a human reviews after stepping away. It scales rigor, tests hypotheses against real artifacts, and records decisions through show-me-your-work. Not for choosing among several candidates for one settled brief - use arena."
metadata:
  version: "1.0.0"
---

# Figure it out

When the task matches no playbook, design one. The deliverable before any code is the workflow itself: a sequence of phases that scales rigor to the task, runs the scientific method, and leaves a decision trail a human can audit after stepping away.

## Start

Open a todolist whose first item is to read the principle index in the **craft-mode** skill. Then add the phases below as todos.

## Phase A: Frame

Ground first, then commit. Don't start the run until you can state:

- The definition of done as a falsifiable predicate (the principle-testing principle at `principle-testing/references/prove-it-works.md`).
- Scope, quantified: rough units and effort, plus the blockers grounding surfaced.
- The rigor level, biased high. One-way doors and high blast radius get more. Reversible low-stakes steps get less. Rigor is gates and artifacts, not "try harder".

Present the framing and tradeoffs before committing to a long run. Reversible work proceeds (the craft-mode principle at `craft-mode/references/never-block-on-the-human.md`), but a multi-hour run earns one checkpoint.

## Phase B: Design the workflow

Decompose into atomic, independently-landable units. Sequence riskiest-unknown-first. Scaffold and verification come before features (the principle-architecture principle at `principle-architecture/references/foundational-thinking.md`).

- Build the verification harness before the work, with the baseline captured from the pre-change state, so the check reads as "old value vs new value".
- For one-way-door design decisions, run the **architect** skill (it runs **arena**). Skip it for mechanical work whose shape is already concrete. A second arena over a settled design is over-engineering (the principle-programming principle at `principle-programming/references/laziness-protocol.md`).
- Decide what fans out when native workers are available; otherwise run the same units sequentially and report the limitation. Parallelize only across seams, and give each worker its own worktree or branch (the principle-architecture principle at `principle-architecture/references/separate-before-serializing-shared-state.md`). Don't over-fan.
- Write the designed phase list down. That list is what the human reviews.

Then execute the design. Add its steps to the todolist as concrete items, after the Phase C entry and before Phase D. Run each under the Phase C loop discipline, and weave the Phase D log through them, a row as each step lands, rather than saving the whole trail for the end.

## Phase C: Run the loop

Each unit is an experiment. State the hypothesis, make the smallest change, measure against the predicate on the real artifact, keep it if it advanced, revert it if it didn't.
Apply the principle-testing principle at `principle-testing/references/sequence-verifiable-units.md`, verifying each unit before starting the next instead of batching checks at the end.

- Verify by inspecting the artifact, never a self-report. When something passes too easily, suspect the observation method before the system.
- Pair delegated work with an independent judge when available, and mark unavailable independent judgment explicitly. If a worker games the gate, reject its output and harden the contract. If the gate itself is wrong, fix the gate in its own change rather than routing around it.
- A verdict is VERIFIED, NOT VERIFIED, or INCONCLUSIVE. Inconclusive is not a pass. Don't hide a negative.

## Phase D: Keep the audit trail

Log the run via the **show-me-your-work** skill. Keep the trail local by default; commit or publish it only when that delivery effect is requested so the reviewer can read it. The trail plus the diff is what lets the human come back and trust the work.

## Phase E: Verify and hand back

Check the whole against the Phase A predicate on the real product, not just the harness. Encode any recurring correction as a gate, a lint rule, a check, or a script (the correct principle at `correct/references/encode-lessons-in-structure.md`).

**Reply:** the playbook you designed, the rigor level and why, the decision-trail path, what's verified against the predicate, and what's still open.
