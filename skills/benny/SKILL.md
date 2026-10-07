---
name: benny
description: "Triages an issue report from a pasted message, GitHub or Linear issue, chat thread, or text; dedupes against the tracker and decides whether to file. For confirmed bugs or performance issues, it reproduces the symptom, verifies an existing fix or makes a bounded fix with before/after proof. Use for \"triage this issue\", \"benny\", or \"reproduce and fix this bug report\". Not for a bug already reproduced - use the bug-fix playbook in craft-mode."
metadata:
  version: 1.0.0
---

# Benny

Classify one report, decide whether it earns a tracker issue, and prove a confirmed bug before attempting a fix.
Use the report the user pastes or links, not a required chat service.

## Run the phases

1. Read [triage](references/triage.md). Freeze the source issue/thread identity, read the report and attachments, trace cause with `how` and `why`, classify, dedupe, and return one verdict. Pasted text returns its verdict to the user; missing tracker access is not a no-match result and permits no tracker writes.
2. Hand off exactly one `[benny:bug]`, `[benny:performance]`, or `[benny:other]` marker for that source. Only a trusted bug or performance verdict enters [reproduce and fix](references/reproduce-and-fix.md). A bug marker classifies the report; it is not proof of reproduction. Stop for `other`, an untrusted or missing verdict, explicit fix ownership without an artifact, or missing required repro configuration.
3. When a fix artifact exists, follow [verify an existing fix](references/verify-existing-fix.md). Otherwise reproduce twice through the real UI, capture and review evidence, and attempt one bounded root-cause fix only when the procedure's gate passes. Invoke `tdd` when the local test is cheap, smoke the blast radius, and open only a draft pull request after before-and-after proof. Apply `unslop` and the principle files named by the procedures.

## Hard safety rules

- Prefer no ticket over a guessed or duplicate ticket.
- If the parent is missing, deleted, inaccessible, or uncertain, stop with no writes.
- Utility bots are evidence sources. They do not own the fix unless a person explicitly delegated the fix to them.
- The exact discriminating symptom must appear twice through real UI interaction.
- State inspection may confirm an observation. It must not inject or force the symptom.
- No confirmed repro means no authored fix.
- Existing pull requests or commits switch the run to verify mode. Do not author over them.
- Keep captures, recordings, logs, and tokens out of source control.
- Open a draft pull request. Never merge or deploy from this workflow.

The coordinator owns source posts; workers receive no source credentials or source-write capability.
Keep the same immutable source identity through every phase.

## Configuration

Read [setup](references/setup.md) to configure the tracker, optional [routing map](references/routing.example.md), [control adapter](references/control-adapter.md), and [feature map](references/feature-map.example.md).
Start from the configuration and prompt templates under `templates/`; keep filled copies outside the installed package.
Automation scheduling and runtime mechanics belong to `craft-mode/references/runtimes.md`.
