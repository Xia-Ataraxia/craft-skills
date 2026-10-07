---
name: swarm
description: "Coordinates bounded workers across independent slices or declared races, drains their results, and returns one evidence-backed report. It applies to '/swarm', 'swarm this', parallel coverage, gauntlets, and exploration. It runs slices sequentially when workers are unavailable and marks missing coverage as a gap. Not for synthesizing competing candidate artifacts by grafting them - use arena."
metadata:
  version: "1.0.0"
---

# Swarm

Fan out N workers through the runtime's native worker interface, within a declared concurrency bound. They may cover separate slices, race the same brief, or mix both. The parent drains every launched worker, aggregates, and returns one report. Without workers, execute the slices sequentially and report that fallback; a sequential race cannot prove a parallel speed claim.

## Start

Open a todolist with one entry per phase before launching anything.

1. Frame
2. Fan out
3. Aggregate
4. Report

## Phase A: Frame

1. State the done predicate and the artifact or report the swarm must return.
2. Choose the shape. Partition into slices, race N workers on identical briefs, or mix both. For a race or mixed shape, declare `first pass`, `rank all`, or `best-of` before spawning.
3. Set N from the user or derive it from the shape. N is total workers, not the cloud concurrency limit.
4. Pick the available native workers and set a concurrency bound no greater than the runtime supports. For a model race, name each available arm up front. If those arms cannot run, mark the race unavailable rather than inventing results.
5. Give each worker its own writable output when it writes. When workers verify or measure commits, each brief names the exact SHAs. A measurement brief also names the method (sample count, what one sample is, order). The worker records both in its result.

## Phase B: Fan out

Launch workers asynchronously through the runtime's supported interface, up to the concurrency bound, then launch remaining slices as seats finish. If native workers are unavailable, execute every brief sequentially with the same verification and report contract.

When a worker must start from a specific revision, use the runtime's supported revision selection and confirm the actual starting SHA. Mark unsupported revision selection as a gap.

Every brief stands alone. Include the goal, scope, exact slice or race arm, how to verify, and what to report. Reports use `PASS`, `ISSUES`, or `BLOCKED` with evidence. A worker that can prove a defect reports `ISSUES` and lists every issue it can prove, not only the first.

If a worker drops out, proceed with N-1 and note it.

## Phase C: Aggregate

Read the terminal results. Drop a result that does not record the SHAs and method its brief names, and respawn that worker once. After a second miss, record a gap. A gap does not count as a pass. For coverage, every required slice needs a result. For a race, apply the selection rule declared up front. Use first pass, rank all, or best-of. Do not paste raw worker dumps.

Keep a compact result table, one-line evidenced issues, and explicit gaps or dropouts.

## Phase D: Report

Return one consolidated in-chat report with the table, issue one-liners, gaps or dropouts, and the race rule when used.
