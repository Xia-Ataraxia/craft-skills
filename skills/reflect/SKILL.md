---
name: reflect
description: "Reviews durable learnings from the current session through judgment, tooling, and divergent lenses, then routes each accepted learning to an edit on an existing skill. Use for \"reflect\", \"/reflect\", \"what did this session teach us\", or \"capture the workflow lessons from this conversation\". Reads a current-session source only when the runtime exposes it and presents edits for approval. Not for enforcing repeated repository mistakes - use correct; not for recovering older sessions - use recall."
metadata:
  version: 1.0.0
---

# Reflect

Mine the current conversation for durable learnings, then route them into skill edits.

## When to invoke

Invoke when the user says "reflect" or "/reflect". Skip when the conversation is trivial, off-topic, or already covered by an existing skill the parent followed correctly. One-offs are not learnings.

## Process

### 1. Locate the active transcript

Read the current session only when the runtime exposes it directly or exposes its current-session transcript from a source the user names. Do not search other sessions, workspace stores, or private history. Verify any exposed transcript matches this conversation's opening prompt. If no current-session transcript is exposed, write a tight digest from the conversation already visible and pass that instead; name the coverage limit.

### 2. Spawn three reviewers in parallel

Use the runtime's available reviewer/worker for each lens, with read access to integrations needed for referenced context and no permission to write. If independent workers are unavailable, perform the three lens passes sequentially and state that they are not independent reviews.

| Lens | Prompt template |
|---|---|
| Judgment | `references/judgment-reviewer.md` |
| Tooling | `references/tooling-reviewer.md` |
| Divergent | `references/divergent-reviewer.md` |

Pass each template verbatim, substituting the transcript path or digest where marked. Reviewers return findings in their response body.

### 3. Synthesize

Use the runtime's available reviewer/worker for synthesis, or a separate direct synthesis pass when unavailable. Preserve read access needed to spot-verify citations; do not write files or external state. Use `references/synthesizer.md` verbatim, with each reviewer's full output inlined where marked. The synthesizer returns a structured Accepted / Rejected / Backlog list.

### 4. Structural enforcement check

Sanity-check the synthesizer's Accepted list. For any item that would be enforced more reliably by a lint rule, script, metadata flag, or runtime check, move it from Accepted to Backlog. See correct reference `correct/references/encode-lessons-in-structure.md`.

### 5. Apply

Before applying any Accepted edit, present the synthesizer's full Accepted/Rejected/Backlog output to the user and wait for explicit approval. The user picks which subset to apply and may redirect routings. Skill changes affect every future agent in the org. Do not auto-apply.

Keep Backlog items in the local response. File to an external tracker only when the user explicitly authorizes that write.

For each approved Accepted item, follow the Routing field exactly:

- Trivial existing-skill edit (a one-line bullet, a tightened sentence, a stale fact corrected): parent does directly.
- Substantive existing-skill edit (a new section, a new pattern table, more than ~10 lines): use the runtime's available reviewer/worker and the destination's authoring workflow, or edit directly when workers are unavailable.
- `tune description: <skill path>` (the skill exists but didn't trigger when it should have): use that same authoring workflow for the existing skill's discovery surface.
- If no existing skill is a real home, route the learning to Backlog with that gap. Do not create a new skill in this workflow.

If your environment ships a SKILL.md validator, run it on every touched skill before declaring done. Skip this step if it doesn't.

### 6. Summarize for the user

Short list, no preamble:

- Edits applied: `<skill path>`. What changed, one line each.
- Backlog retained locally, or filed with explicit authorization: one line each; distinguish proposed from executed writes.
- Dropped: one line per rejected finding + reason from the synthesizer.
