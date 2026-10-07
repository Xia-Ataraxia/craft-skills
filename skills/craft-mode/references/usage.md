# Using craft mode

For a help question, answer the question and offer one usable prompt; do not start the described work.
A request to do the work runs the procedure.
Read the routed file before quoting its rules, and link only a file or public source actually consulted.

## Pick the route

Use craft-mode when the task needs a playbook rather than a single named procedure.
Give the goal, a pass/fail finish condition, useful evidence already available, and constraints that change execution.

```text
/craft-mode the CSV export drops its last row. Reproduce first, then fix it. Done means the 60,000-row fixture exports every row. Show the counts before and after.
```

The router chooses one entry in [Playbooks](playbooks.md), follows its steps, and loads workflows as needed.
A playbook is an internal sequence, not a separate slash command.
Name a workflow directly when its specific outcome is what you want.

| Needed outcome | Route |
|---|---|
| Current mechanics or code placement | how |
| Causes, rationale, or history | why |
| Coaching that combines mechanics and reasons | teach, composing how and why |
| Short plain-language restatement | bro |
| Types, signatures, and module shape before implementation | architect, applying principle-architecture and comparing alternatives with arena |
| Competing attempts at one brief, then a selected base with useful parts combined | arena |
| Independent bounded slices of one task | swarm |
| Adversarial review of a change | interrogate |
| Evidence of what a diff could break outside itself | blast-radius |
| Opt-in failing-test-first implementation | tdd, under principle-testing's oracle |
| Explanation of a measured performance or evaluation number | benchmark-checklist |
| An auditable bespoke run for a large change | figure-it-out, with show-me-your-work |
| Context from a user-named history source | recall; use session-pickup for one specific handoff |
| Structural prevention of repeated mistakes | correct |
| Lessons from the exposed current session | reflect |
| A private personal workflow from the user's stated conventions | automate-me |
| Prose without habitual AI phrasing | unslop, already applied to every craft-mode reply |

TypeScript rules belong to `principle-programming/references/typescript.md`, not another workflow.
The no-comments procedure belongs to `principle-programming/references/comments.md`.
Verification-skill creation and maintenance belong to `principle-testing/references/verification-skills.md`.
Writing guidance belongs to `document/references/technical-writing.md`.

## Name a playbook

Describe the outcome or use an entry's exact id from Playbooks.
"Check this PR" selects babysit in check mode; "land this stack" selects shipping, which needs current independent verdicts and merge authority.
"Stack them, I will land them" selects autopilot-stack rather than autopilot-full.
"Write the multi-phase plan" ends with the plan, not code.
"New task" selects a fresh playbook instead of continuing the previous one.
"Pause safely" produces a resume checkpoint; "keep going while I am away" does not pause.

When an instruction asks for several independent attempts and no workers exist, run them sequentially and say so.
Sequential self-review cannot be described as a review by independent agents.

## Steer by principle name

Use the inline index in craft-mode's SKILL.md.
Read the named leaf from its owning package and identify the choice that changes.

- "Use subtract before you add" means inspect existing adapters and remove obsolete ones before designing an addition.
- "Apply prove it works" means replace a build-only claim with evidence from the real flow or stored result.
- "Separate before serializing shared state" means isolate writers before adding coordination.
- "Encode lessons in structure" means route repeated advice through correct to an enforceable check.

A useful reply connects the name to a decision, such as "Subtract Before You Add changed the plan from adding a fourth adapter to removing the unused adapter first."
Merely listing the principle fails that contract.
The user can change direction mid-task without reciting the full rule.

## Recover a drifting run

If the recipe was not loaded, use the selected runtime's explicit skill invocation and verify the loaded body; [Setup](setup.md) describes the discovery boundary.
If the wrong task continues, name the new goal and scope.
If a reply claims success from a build, ask for the affected surface and actual output.
If workers share files, isolate the writes or run them sequentially.
If an unattended run has no finish condition, state one before continuing.
If no event can wake the runtime, keep a resume checkpoint rather than assuming work continues after the session ends.

For a rule conflict, read [Owner decisions](conflicts.md) and preserve the original principle text.
For a missing capability or unavailable history source, state what could not run and continue only the work that does not depend on it.
