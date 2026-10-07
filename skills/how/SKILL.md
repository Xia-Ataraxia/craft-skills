---
name: how
description: "Explains how a system or process works by tracing entry points, data flow, boundaries, and ownership in real source evidence. Use for \"how does X work\", \"walk me through this code\", \"where should this live\", \"which package owns this\", or onboarding to a subsystem before changing it. Scales exploration to the question and reports untraced gaps. Not for historical motivation - use why; not for paced coaching combining both - use teach."
metadata:
  version: 1.0.0
---

# How

Explore the codebase to answer "how does X work?" questions. Produce architectural explanations at the level of a senior engineer onboarding onto a subsystem, enough to build a working mental model, not so much that it reads like annotated source code.

Use the runtime's available reviewer/worker when delegation is supported. Otherwise perform the same exploration and explanation passes directly, sequentially. Keep exploration read-only and use only available evidence sources; report any source you cannot trace.

## Step 1. Assess Complexity

If the scope is ambiguous, state your interpretation and explore. The user can redirect.

- **Simple** (a single module, a small utility, a narrow question such as "how does function X work"): no explorers. One explainer explores and explains in a single pass. Go to Step 2b.
- **Complex** (a subsystem spanning multiple files or services, a cross-cutting feature, a full architectural overview): spawn parallel explorers first, then hand off to the explainer. Go to Step 2a.

When in doubt, take the simple path.

## Step 2a. Explore (complex questions only)

Decompose the question into 2 to 4 exploration angles, each a distinct slice of the subsystem. Spawn all explorers in a single message:

Use the runtime's available reviewer/worker for each angle, with no writes.

Each explorer gets the prompt in `references/explorer-prompt.md` with its angle filled in. Then go to Step 3.

## Step 2b. Direct Explain (simple questions)

Use one available worker, or explore and explain directly in one pass, with no writes.

Build its prompt from `references/explainer-prompt.md` without the explorer-findings section. Go to Step 4.

## Step 3. Synthesize (complex questions only)

Once all explorers have returned, use the runtime's available reviewer/worker, or a separate direct synthesis pass, to combine their findings into one explanation, with no writes.

Build its prompt from `references/explainer-prompt.md` with every explorer's findings filled in.

## Step 4. Present

Present the explainer's output to the user. Light edits for clarity or context from the conversation are fine. Do not substantially rewrite it.

## Output Format

The explanation uses the sections defined in `references/explainer-prompt.md`, dropping any that do not apply: Overview, Key Concepts, How It Works, Where Things Live, Gotchas.
