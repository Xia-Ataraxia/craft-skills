---
name: arena
description: "Runs N candidates at the same task, picks a base, and grafts the strongest parts into one verified artifact. It applies to '/arena', 'arena this', 'throw it in the arena', and design choices where one attempt could lock in the wrong shape. It uses native parallel workers when available and separate sequential attempts otherwise. Not for partitioning independent work slices - use swarm."
metadata:
  version: "1.0.0"
---

# Arena

Fan out N parallel attempts at the same task. Read every candidate end to end. Pick the strongest as the base. Graft the best ideas from the others into it. Verify the synthesized result.

## Start

Open a todolist with one entry per phase before launching anything.

1. Frame
2. Fan out
3. Cross-judge
4. Pick
5. Graft
6. Verify

## Phase A: Frame

The N candidates will receive the same prompt, so the prompt is the contract.

1. State the artifact each candidate is producing.
2. Derive the rubric. State what success looks like for *this* task, then turn it into 3-6 concrete gradeable criteria. The rubric is the picker's tool in Phase D. Candidates only see the task.
3. Pick N runners from the native workers the runtime offers. Use independent candidates with the same task. When parallel workers are unavailable, run N separate attempts sequentially and record that limitation. Never report a worker that did not run.
4. Assign output paths. Each candidate writes to its own location (a git worktree where possible, otherwise `/tmp/arena-<slug>/candidate-<n>/`), per the principle-architecture principle at `principle-architecture/references/separate-before-serializing-shared-state.md`.

## Phase B: Fan out

Launch candidates through the runtime's native worker interface, bounded by its concurrency limit, each with the task, the path to the shared grounding, its own output path, and instructions to produce both the artifact and a short rationale. Without workers, produce the same candidates sequentially in separate locations.

Each rationale names the alternatives the candidate considered and what it rejected.

If a candidate fails to produce output, proceed with N-1 and note the dropout in the synthesis record.

## Phase C: Cross-judge

After all Phase B candidates complete, use an independent readonly judge the runtime offers. It sees the rubric and the candidates by path label, scores each criterion, and recommends a base with rationale. It can run alongside the parent's reading in Phase D, not with candidates still writing. If no independent judge is available, score the candidates directly and mark cross-judgment unavailable, not passed.

## Phase D: Pick a base

Read every candidate end to end before picking.

Score each candidate against the rubric criterion by criterion, not on holistic feel. Compare against the cross-judge. Agreement on the base confirms the pick. Disagreement means one of you is biased or the rubric was ambiguous. Read both rationales before deciding.

Pick the base on which candidate a future maintainer can extend most easily without breaking invariants. Prefer the cleaner boundary or smaller API when two feel tied, per principle-programming at `principle-programming/references/laziness-protocol.md`.

Record the pick and the reason in a short synthesis note alongside the base artifact, including the cross-judge's verdict.

## Phase E: Graft

Walk each losing candidate once more and identify what is worth porting into the base. The signal is usually one or two things per candidate, not most of it.

Fold each graft in by hand, per the principle-architecture principle at `principle-architecture/references/redesign-from-first-principles.md`. Don't paste mechanically. The result has to remain coherent under one mental model.

Record what was grafted, from which candidate, and what was rejected and why.

When N candidates converge on the same shape, that is a strong agreement signal. Note the convergence in the record and ship the consensus shape. No graft is needed. When N candidates wildly diverge, Phase A was under-specified. Reframe and re-run rather than averaging the divergence.

## Phase F: Verify

The synthesized artifact has to hold up under the same scrutiny as any other output, per the principle-testing principle at `principle-testing/references/prove-it-works.md`.

If verification surfaces a problem the arena did not catch, either Phase A was wrong (re-frame and re-run) or one candidate caught it and you missed the graft (go back to Phase E). Don't paper over.

## Outputs

One synthesized artifact. One short synthesis note alongside, naming the base, the grafts (with source candidate), the rejections, the dropouts if any, and the verification result.
