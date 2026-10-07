---
name: recall
description: "Reconstructs recent working context from an explicitly named history source, scoped shared records, and live state. It applies to 'recall my work on X', 'catch me up', 'what have I been working on', and 'where did I leave off'. It returns a cited current-state brief and marks unavailable history instead of ingesting private stores automatically. Not for turning working habits into a personal skill - use automate-me."
metadata:
  version: "1.0.0"
---

# Recall

**Before you start or resume work, you rebuild the user's recent working context and hand back a tight capsule of where things stand now and what to do next.**

Keep it tight and on-topic. Read only what the in-scope threads need, then stop.

Your context lives in two records. Your own chat history holds what you did and decided. The shared record holds everything that happened around the same code under other names: the symptoms users keep reporting, the fixes that shipped and got reverted, the errors still firing in prod. That second record is what the **why** skill searches, across source control, the issue tracker, chat and issue channels, long-form docs, and error tracking. A feature with a long bug tail keeps most of its story there, so don't reconstruct it from your transcripts alone.

Read history only from a source the user names for this request. Do not discover private transcript directories or ingest stores automatically. If no source is named, ask for one or use a state capsule already provided. If a named source is absent or inaccessible, report history unavailable and return only facts supported by the available record and live state.

1. Classify, then route. One specific prior chat to resume is the session-pickup playbook in craft-mode, not this. Turning habits into a durable skill is `automate-me`. A human-readable summary of your work is a different task. Recall loads working context across recent chats before you act. If the user already gave you a full state capsule (paths, branch, the change), use it and skip the mining.
2. Lock the scope before searching. Pin the window ("recent" is a real range, default the last 7 days), the topic if named, and the workspace (default the active one. Never read another project's transcripts without being asked). State the scope back. Never quietly turn "all" into "recent N".
3. Search the explicitly named chat-history source. When native workers are available, use bounded workers across slices of that corpus; otherwise search sequentially. Order candidates by real modification time (`ls -t`) and never by UUID name, grep the topic first and read only matching chats and their relevant regions, skipping the current chat and obvious noise (subagent, eval, and test chats). Each slice returns the same schema, one block per chat: topic, the user's goal, decisions, open threads, struggles and corrections, and artifacts (PRs, tickets, branches), each citing the source's chat id. For one or two chats, search directly. Keep raw private transcripts out of the report.
4. Sweep the in-scope available shared record whenever the topic names a feature, file, subsystem, area, or bug. This is the default, not a judgment call, and "my work on X" does not exempt it. Use the **why** skill's source investigation, but steer the question from "why was this built this way" to "what's the current state, what's been tried and didn't hold, and what are users still reporting". Use native investigators when available, or investigate each source sequentially. Null results are findings; skip unavailable sources and say so. Do not use this sweep to discover unnamed private history. Fold what comes back into the brief. Skip this step only for pure activity recall with no named target ("what did I do this week"), where the named history and live state suffice.
5. Verify against live state. Take the PRs, branches, and tickets that the mining and the sweep surfaced and check them with `git` and `gh`. When the answer hinges on what an agent actually did (the tools it ran, files it read, errors it hit), read the full transcript, not just a trimmed local copy.
6. Write the brief to the contract below. Group by thread. Stay on the named topic.

## Output contract

Lead with the capsule, then the thread status, then the problems, then the next move. Deeper detail goes below or gets cut.

- **Capsule.** At most 5 bullets. What this work is and where it stands overall.
- **Threads.** One line each, prefixed with exactly one status tag: `[merged #N]`, `[open PR #N]`, `[in flight <branch>]`, `[verified, uncommitted]`, `[reverted #N]`, or `[planned, not started]`. A thread with no tag is not done yet, so tag it.
- **Problems.** At most 5, the recurring ones. Include the symptoms users keep reporting and any fix that shipped and was reverted, so the next attempt starts where the last one failed.
- **Next move.** The single most useful next action, concrete.

An adjacent feature or ticket stays out unless it blocks this one. When the capsule and thread lines outgrow a screen, cut detail before you cut threads. Write the brief through the **unslop** skill, cite chat findings by UUID and shared-record findings by their source (PR #, ticket ID, chat permalink, error-tracker issue), and sanitize private context before any public output.

**Reply:** the brief, to the contract above.
