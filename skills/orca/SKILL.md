---
name: orca
description: Organizes Orca around low-clutter project identities and preserves running work while diagnosing which local connection layer still needs evidence. Use to "organize Orca", "reduce sidebar clutter", consolidate the "same repo across hosts", clean old branches in Orca, reuse or account for task terminals, resolve selector_not_found or remote_runtime_unavailable, investigate SSH failures to an Orca host, or handle "orca에 연결이 안된다". Not for standalone Git maintenance (use git), vault taxonomy (use obsidian and local policy), network-versus-SSH reachability triage (use tailscale), or executable command mechanics (use the installed orca-cli and orchestration guides).
metadata:
  version: 1.4.0
---

# orca

Operate Orca with fewer visible decisions, coherent work targets, verified repository identities across hosts, and no lost working context.
When a connection fails, name the layer the evidence actually identifies and stop there.
Command syntax, retries, process liveness, settlement, and supervised-worker mechanics belong to the installed official guides, not to this package.

## Output contract

A connection diagnosis reports the layer, the evidence that identifies it, and what remains unproven.
It does not invent a repair command or treat a sibling command as proof.

- The verdict names exactly one layer — CLI presence, repo registration, remote-runtime liveness, or SSH transport — only when current evidence identifies it.
- `selector_not_found` is a selector miss, not proof that registration is absent.
- A process listing does not prove a runtime is up, and a status field does not authorize an application restart.
- The summary names the layer, the evidence, and any environment left unverified.
- Re-run the originally failing command only through the official guide, and quote real output.

An organization or cleanup run returns a concise receipt of the actual groups and identities changed, host coverage, safely deleted and retained branches with reasons, and preservation checks.
Read back runtime state.
When the visible sidebar cannot be inspected, mark UI evidence unavailable rather than claiming placement.
Do not create a report file unless requested.
No safe candidate means zero deletions, not permission to weaken the checks.
Unknown identity, unsupported operations, unreachable hosts, or missing deletion evidence means preserve the affected item and report partial coverage.

A task that uses terminals reports, per task, the actual retain, sleep, close, or release outcome and the reason.
No creation and no effect is a valid outcome.
Authorization to do the task is not authorization to close terminals, and official mechanics are not a local disposal policy.

When diagnosis cannot succeed, report the last confirmed layer instead of a recovery claim:

- `orca` absent from `PATH` → report the missing CLI and stop, rather than inspecting application internals or guessing an install path.
- A requested revive does not settle to a ready runtime → report the last observed state and stop; do not dispatch dependent work, and do not restart the application on your own.
- A host is unreachable at the transport layer → hand off to tailnet triage rather than repairing Orca.
- An environment record or its pairing endpoint is missing → report it; pairing carries a credential and is an operator decision.
- Process listings contradict `orca status` → report the contradiction and trust the CLI status for runtime liveness, without treating helper processes as the runtime.

## Operating route

Use [operations](references/operations.md) for grouping, cross-host identity, naming, task-terminal inventory and disposition, and old-branch cleanup.
Keep connection diagnosis below as the owner of which layer still needs evidence.
For executable usage, retries, handoffs, terminal control, and worktree mechanics, check the version-matched `orca-cli` guide bundled with the `orca` already selected for the task before any other guide — list them with `orca skills list` and read one with `orca skills get <name>`.
For explicit supervised work only — monitor, wait, track completion, coordinate a DAG, use a decision gate, or manage ask/reply — check the bundled `orchestration` guide from that same executable the same way.
Only when a task-relevant official Orca skill is proven absent or stale against that bundled set, refresh it — install or update — through the official Orca skill channel (`orca skills install` / `orca skills update`) and only when that effect is separately authorized; otherwise no-op and keep using the bundled guide.
The official skills also install with `npx skills add https://github.com/stablyai/orca --skill <name>`; use an installed one rather than memory.
Verify the installed result before relying on it, and record the version the guides were checked against.
Do not copy those guides into this package, and do not revive a remembered flag, payload, or private RPC path.
Use the `git` skill for Git mechanics under the operation's preservation and approval boundaries.
Keep informational questions read-only; mutate the actual setup only when the operator requests or approves that effect.
An organization request does not authorize unrelated pairing, application or remote upgrades, restarts, publication, installed-skill changes, GUI interference, or bulk terminal closure.
A skill refresh installs or updates skill guides; it is not an application or remote-host upgrade, restart, or pairing.
Choose a skill refresh for stale skill guidance, not for a stale binary: the application upgrade, remote-host upgrade, restart, and pairing stay separate effects with their own authorization.
If that refresh is already complete, use it without repeating the effect.
Source authoring follows [ordinary authoring documentation](https://github.com/Xia-Ataraxia/craft-skills/blob/main/docs/skills/authoring.md); it neither refreshes installed skills nor upgrades applications or remote hosts.

## Layer map

Each surface can fail because a connection layer is unproven.
That is a diagnosis boundary, not a command sheet.

| Surface | Requires |
|---|---|
| Worktree, file, and terminal selectors | Layers 1–2 for the selected repo or folder workspace; do not assume every workspace is Git-backed |
| Supervised workers | Layers 1–2 locally, plus Layer 3 for any remote-hosted worker; settlement and release stay in the orchestration guide |
| Automations, projects, and repos | Layer 1 locally, plus Layer 3 when scoped to a remote environment |
| Any environment or host scope | Layer 3, plus Layer 4 when the host itself must be reached |
| Embedded browser, computer use, emulator | Layers 1–3 for the runtime that owns the surface |

## Layer 1 — CLI presence

Resolve `orca` by discovery and keep using that same executable for later calls and for fetching its bundled guides.
A second copy on `PATH` is not, by itself, a connection fault.
Ask that executable for runtime and graph readiness.
`not_running` means the application is not answering; it does not authorize an automatic restart.
Crash-handler helpers can outlive the application, so a process listing is not a runtime verdict.

## Layer 2 — Repo registration

A selector miss inside an ordinary checkout is a registration question, not proof the repo was never registered.
The identifiers a launching terminal exports name the workspace that launched it, so a sibling checkout can inherit an identity that does not contain it.
Confirm the current worktree path against the repo root through the official guide before treating registration as absent.
Do not register a root merely because a selector failed.
Only a current official result that names this root as unregistered supports a registration repair, and that repair still needs operator approval.

## Layer 3 — Remote runtime liveness

An environment-scoped unavailable-runtime result is a host verdict, not a network verdict.
Read the environment record, then ask the host itself for runtime and graph state over the SSH privacy route in Layer 4.
A dead remote application is not repaired by editing transport settings or re-pairing.
Do not restart the remote application automatically.
Version drift between local and remote applications is normal and is not a connection fault, so an update is not a reachability repair.
If the graph is still warming, re-poll through the official guide instead of restarting.

## Layer 4 — SSH transport

Two configuration patterns break non-interactive access while interactive use stays healthy.
Discover the effective alias with the client's configuration dump and look for `RemoteCommand`, `RequestTTY`, `ControlPath`, hostname, and user.
An alias that requests a TTY and attaches a multiplexer is serving a human.
A command argument then fails closed with `Cannot execute command-line and remote command.` at exit 255.
Leave that alias intact and override `RemoteCommand` and `RequestTTY` for the one non-interactive invocation.
With a persistent control master, the first connection can inherit stdout, so a piped call waits for the persist window rather than the connection timeout.
An outer timeout on the foreground process does not release that pipe.
For a probe, use a unique private temporary directory, detach stdin, keep batch mode and a 10-second connection timeout, redirect the two streams to files, and record the exit status.
Read those files, then remove only that probe's files and directory.
Do not use a predictable shared filename or leave potentially private output behind.
Batch mode prevents interactive authentication prompts; stdin detachment alone is not an authentication guard.
Bound each read-only host probe with a 20-second caller deadline.
On timeout, report that host as unverified and continue the independent inventory without repeatedly reconnecting.
Do not revive unrelated hosts merely to complete an organization inventory.

## Symptom index

| Symptom | Layer | What the evidence supports | What it does not authorize |
|---|---|---|---|
| `selector_not_found` from the current-worktree query | 2 | The selector missed; registration is still a question | Treating registration as absent, or registering without a current official miss for this root |
| An active workspace selector fails in a sibling checkout | 2 | The launching terminal's identity may not contain this checkout | Assuming the sibling repo is unregistered |
| `remote_runtime_unavailable` | 3 | The named host's runtime did not answer | A network repair, re-pair, or automatic restart |
| Remote answers but the graph is not ready | 3 | The graph may still be warming | Restarting the application |
| `Cannot execute command-line and remote command.` at 255 | 4 | The alias is carrying a remote command | Editing the operator's alias |
| A piped SSH call never returns | 4 | A persistent master may be holding stdout | Treating the host as down |
| Processes visible while status says not running | 1 | Helper processes can outlive the runtime | Reading the process list as the runtime verdict |

## Requirements

- `orca` — official source: the installed application's bundled `orca-cli` and `orchestration` guides, fetched with the already selected executable; version probe: `orca --version`; readiness probe: `orca status --json`. This package does not copy their command inventory. Organization support depends on the installed group, project, and host capabilities, not private implementation paths.
- `git` — official sources: [branch deletion](https://git-scm.com/docs/git-branch), [worktrees](https://git-scm.com/docs/git-worktree), and [reflogs](https://git-scm.com/docs/git-reflog); version probe: `git --version`; cleanup requires linked-worktree enumeration, reflog timestamps, ancestor checks, and non-forced branch deletion.
- `ssh` — official source: <https://man.openbsd.org/ssh_config>; version probe: `ssh -V`; configuration probe: `ssh -G <host-alias>`; support boundary: an OpenSSH client supporting `ControlPersist`, `RemoteCommand`, `BatchMode`, and `ConnectTimeout`.
- Dependency trigger — an Orca, Git, or OpenSSH update, changed capability probe, or changed status, identity, grouping, or deletion behavior requires official-documentation review and affected scenarios before reusing the operation.

## Anti-patterns

- Replacing real groups with repeated project and tab prefixes → classify once and verify actual sidebar membership.
- Sorting repositories into PARA lifecycle groups → group them by the domain or large project they belong to.
- Treating a folder registration as proof of non-Git content, or matching repos by name → inspect real roots and provider identities.
- Deleting a live setup to remove a duplicate-looking card → preserve the setup and resolve verified identity or grouping metadata.
- Reporting a successful API response as visible organization → require persisted read-back, and mark UI evidence unavailable when the sidebar cannot be inspected.
- Deleting old-looking branches or escalating a refusal to force deletion → apply the evidence gates in the operating recipe and retain uncertain work.
- Reading `selector_not_found` as proof the repo was never registered → confirm the current official result for this root before any registration repair.
- Reading a process listing as proof that a runtime is up → crash-handler helpers outlive the application, so take the verdict from `orca status --json`.
- Treating `remote_runtime_unavailable` as a network fault, or restarting an application to chase it → confirm runtime state on the host and leave restart, upgrade, and pairing decisions to the operator.
- Guessing why an operation silently failed, or re-registering to test the guess → search official docs and upstream issues first, update only for a shipped fix, then compare with a setup that works.
- Editing an interactive SSH alias so an agent call succeeds → override `RemoteCommand` and `RequestTTY` per invocation and leave the operator's alias intact.
- Piping the first SSH call to a host that uses a persistent control master → redirect to private files, since the master holds the pipe past any outer timeout.
- Copying official command sheets or retired RPC and CLI recipes into this package → fetch the current installed guide for the selected executable.
- Closing a terminal because it looks old, idle, orphaned, user-owned, or unverifiable → account for it in the task inventory and follow the disposition rules in the operating recipe.
- Closing a supervised worker's terminal instead of releasing it → follow the orchestration guide, and release only after an accepted settlement.
- Interfering with the GUI, restarting the app, deleting arbitrary state, or bulk-closing terminals to finish diagnosis or organization → preserve the current state and report the missing evidence.
