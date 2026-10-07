---
name: automate-me
description: "Drafts or updates one private personal <handle>-mode skill from the user's stated working conventions and runs unslop on its prose. It applies to 'automate me', 'update my mode skill', 'capture my preferences', and 'work in my style'. It updates existing skills in place and reads past transcripts only from a source the user names. Not for reconstructing the current state of past work - use recall."
metadata:
  version: "1.0.0"
---

# Automate me

A guided flow for turning the user's working conventions into a skill agents will follow. The output is one `-mode` skill tailored to them (e.g. `jay-mode`, `priya-mode`).

This skill sequences the user's stated conventions, an optional explicitly sourced mining pass (see step 1), portable skill authoring, and the **unslop** skill (prose discipline).

## Flow

### 0. Check for an existing skill

Ask for the user's handle and chosen private skill directory if they have not supplied them. Look there for the matching `<handle>-mode/SKILL.md`, not across private stores. If one exists, confirm intent using the runtime's question interface or plain chat (unless they already said "update my skill" or similar):

- Update the existing skill (default for repeat runs)
- Start fresh (rare, ask why before doing it)

Update mode changes the rest of the flow:
- Step 1, when the user names a history source, mines only history since the skill was last edited (`git log -1 --format=%cI <path>` when available; otherwise use the file's modification time).
- Step 2 asks what's changed or missing, not what to capture from zero.
- Step 4 edits the existing file in place. Preserve sections the user hasn't contradicted. Revise ones with new evidence. Add new sections only for genuinely new rules.

### 1. Mine their history

Skip mining unless the user names a transcript source. With no named source, read no past history and use the user's stated conventions. When a source is named, confirm its workspace and time range before reading. Do not search other projects or infer a private store path.

Survey recent agent conversations within that named scope for recurring patterns. Use bounded native workers across slices of history when supported, or read the slices sequentially. Each slice returns a short structured list of patterns with evidence pointers. Default signals worth hunting:

- Response preferences (length, tone, format, "dumb it down" corrections)
- Delegation habits (subagents, models, specialized workflows, parallelism)
- Verification posture (what "done" means, unit tests vs live repro, reviewers)
- Code and prose discipline (style, principles cited, lint/format tools)
- Process conventions (worktrees, commits, PRs, review/merge tooling)
- Meta preferences (fixing skills mid-task, proposing new ones)

Cross-check across slices before elevating a signal. Patterns seen in 2+ slices are high-confidence. Lone signals are weak and usually get dropped.

### 2. Ask the user directly

Mining misses intent that hasn't come up yet. Ask the user directly using the runtime's supported question interface or plain chat. Reuse conventions already stated instead of asking for them again.

Shape: one or two short questions with a few options each, allowing multiple selections for categories when supported. Start broad ("Which areas matter most?"), then follow up on selected areas with specific options. After the structured rounds, one free-form chat question catches anything the options missed.

Don't dump 20 questions.

### 3. Cluster findings

Group the combined signals into sections. Common ones (use only what applies):

- **Response style**: length, tone, format.
- **Autonomy**: how much to do without asking, MCP tool use.
- **Understand first**: which skills to reach for when scoping or investigating a change.
- **Subagents**: default, parallelism, model-to-task, specialized workflows.
- **Prose / code discipline**: principles, lint tools, style guides.
- **Review and verify**: repro posture, verification skills, live-testing tools.
- **Process**: git worktrees, commits, PRs, review/merge tooling.
- **Skills**: skill-authoring habits, fix-the-skill-first, proposing new skills.

The **craft-mode** skill shows the shape. Read it for granularity. Don't copy its content. The user's rules are not the same as craft-mode's.

### 4. Draft the skill

Author one portable skill with `name`, `description`, and `metadata.version` frontmatter. Placement:

- Path: preserve the existing matching skill's location within the user-chosen private directory. For a new mode, use `<private-skill-directory>/<handle>-mode/SKILL.md`. Never write into public craft-skills by default. If the destination is not chosen, show the draft and ask for it before writing.
- Handle: the user's first name or chosen identifier.
- Frontmatter `description`: trigger on their name + `/<handle>-mode` + "work in their style", not on generic keywords like "write code" or "review PR".
- Frontmatter formatting: keep `description` as one YAML scalar. Quote it or use `description: >-` with indented continuation lines when punctuation or wrapping requires it. Set `name` to `<handle>-mode` and `metadata.version` to an initial semantic version; update the existing version according to that private destination's policy.
- Invocation: keep this personal mode explicitly invoked unless the user asks for always-on application through their runtime's supported configuration. Do not invent provider-specific frontmatter.

### 5. Iterate on prose

Apply the **unslop** skill to every prose line, excluding code and fixed machine formats.

Show the draft to the user and take feedback. Expect multiple iterations. Cut ruthlessly. A mode skill is not a manual.

### 6. Land it

Write or update the one skill in the chosen private directory. Validate its portable format with the destination's available validator, report the file path and any unrun check, and hand back the result. Commit, publication, and runtime installation are separate requested effects.

## Guardrails

- **Don't overfit to one conversation.** A mined preference stated once and contradicted another time is noise. Require multiple instances before codifying mined signals; a convention the user explicitly states is direct evidence.
- **Don't be clever.** Restating other skills' contents, inventing metaphors, or writing "poetic" prose for an agent reader is cost without benefit. Keep it operational.
- **Reference, don't inline.** Other skills the user relies on should appear as path references, not pasted excerpts. Same for any principle docs they maintain elsewhere.
- **Keep sections minimal.** Only add a section if the user has a specific, non-default rule there. "Communicate clearly" is not a section. "Short paragraphs. Tables when comparing options. Bullets only when items are genuinely parallel." is.
- **Name conventions generic.** Use "the user" or "the human" in imperatives, not the author's first name.
- **Don't force symmetry.** If a user has no process rules worth writing down, skip the Process section entirely.

## Evaluation

A `-mode` skill is subjective output. An authoring benchmark loop isn't useful here. Vibe-check with the user: does it read like them? Did it miss anything? Then ship.

Run a description-optimization loop only if the skill's trigger accuracy turns out to be a problem in practice.

## When not to use

- User wants a task-specific skill (not working conventions): a task-specific authoring workflow, no mining required.
- User wants to capture one narrow workflow (e.g. "how I write commit messages"). That's a regular skill, not a mode skill.

