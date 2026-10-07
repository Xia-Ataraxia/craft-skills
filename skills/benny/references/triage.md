# Triage issue reports

Classify one issue report and post one useful verdict on its source issue/thread, or return one verdict to the user for pasted text. Create a tracker issue only for a clear, new bug. Do not reproduce or fix it here.

Load the external Benny configuration supplied by the run. An explicit user-supplied link supplies the source origin and identity for an interactive run, not posting access. For a linked source, if the source configuration is missing, malformed, or incomplete, stop without posting or writing to the tracker. For pasted text, bind the report to this user message and return the verdict here; no external source configuration is needed. Missing tracker configuration or access permits read-only classification, not tracker writes.

## Hard safety rules

- The source issue/thread identity is immutable.
- Never create a new issue/thread to deliver a source verdict.
- Never post to another destination, broadcast a reply, send a DM, or start a replacement thread.
- Preflight the source parent before any tracker write and immediately before the verdict post.
- If the parent is missing, deleted, inaccessible, or uncertain, stop with no writes.
- Post one substantive verdict. Do not narrate progress.
- The coordinator is the only source poster.
- Delegated workers return findings only. They must be read-only and receive no source credentials or write actions.
- Every child prompt must forbid every source write action.
- If worker isolation cannot enforce those limits, do the work in the coordinator.
- Never create an issue that cannot link back to the source issue/thread. Pasted text without a stable source permalink cannot create a tracker issue.
- Prefer no ticket over a guessed or duplicate ticket.
- Apply craft-skills' `principle-architecture/references/separate-before-serializing-shared-state.md` to source coordinates.
- Apply craft-skills' `principle-programming/references/minimize-reader-load.md` and `unslop` skills to the final verdict.

## 1. Freeze source coordinates

Before making a work list or delegating:

1. Read the source origin and issue/thread identity from the linked report or trigger. For pasted text, use this user message as the run-local source identity.
2. Require a linked source origin to equal the configured `source.origin`.
3. Set `SOURCE_ID` to the source issue/thread identity, not a reply identity.
4. Require a nonempty `SOURCE_ID`.
5. Store `SOURCE_ORIGIN` and `SOURCE_ID` as immutable values.
6. Read the source and verify that its parent has exactly that identity; for pasted text, verify the original user message.
7. Fetch a stable source permalink when one exists. Never invent a permalink for pasted text.

Every later source read and post must use those stored values. Never replace them with a reply identity or an operations-thread identity.

## 2. Read the whole report

Read the root and current replies before deciding.

Capture:

- Reporter wording
- Product version, app build, environment, and platform when present
- Expected behavior
- Observed behavior
- Frequency and trigger
- Error text or stack signature
- Existing issue, commit, or pull request links
- Any explicit statement that someone is already fixing it

Inspect every relevant attachment.

- Read screenshots at full useful resolution.
- Review video for the state transition that separates correct and broken behavior.
- Read logs, traces, and crash text for concrete signatures.
- If media needs specialist review, use a read-only media worker and ask a narrow question. The worker returns findings only.
- If an attachment cannot be read, say so in the verdict. Do not invent what it shows.

Use evidence already in the thread before asking the reporter for more.

## 3. Trace cause before routing

Do a bounded source and history pass before choosing an owner or destination. Use craft-skills' `how` skill to trace the path from the reported action to the observed result. Use `why` when the report looks like a regression or touches defensive code.

1. Identify the likely code path from the reported action to the observed result.
2. Check whether the visible symptom belongs to that code path or a dependency below it.
3. Check recent changes when the report looks like a regression.
4. Check whether a merged commit or open pull request already addresses the same symptom.
5. Separate confirmed facts from hypotheses.

This pass does not need a complete root cause. It must be strong enough to avoid routing a visible symptom to the wrong owner.

If the repository cannot be read, do not guess a code owner. Continue with a conservative classification and say that cause tracing was unavailable.

## 4. Classify

Choose one category.

### Bug

Something violates intended behavior. Examples include wrong output, broken state, an error, a crash, a hang, a silent no-op, or a regression.

### Performance

The report describes measurable slowness, excess memory, battery drain, jank, or another resource problem. Treat it as a bug, but preserve measurements and profiles.

### Feature request

The current behavior appears intentional and the reporter wants a different behavior or affordance.

### Question or feedback

The report asks how something works, expresses a preference without a concrete defect, or gives general feedback.

### Reroute

Cause tracing shows that another configured destination owns the issue.

When the bug versus feature line is unclear, do not file. The one verdict may ask one focused question and use the `other` marker.

## 5. Apply configured routing

Read the optional routing map from `routing.map_path`.

- Match on confirmed product area, code path, or error signature.
- A visible symptom alone is not enough when cause tracing points elsewhere.
- If no route matches, say the owner is unclear. Do not guess.
- Do not cross-post. Tell the reporter where to take the issue in the source thread.

Owner pings are off by default. A ping is allowed only when all of these hold:

1. The routing map explicitly names the owner.
2. The config allows that ping type.
3. The item is a feature request that needs owner input, or recent history identifies a likely regression author with strong evidence.
4. The owner is not a broad on-call group.

No other case gets a ping.

## 6. Use the issue-tracker adapter

The tracker is an adapter, not a required vendor. A Linear adapter is one valid example. A GitHub Issues adapter or another tracker may implement the same contract.

The configured adapter must provide:

- Search issues by text, state, label, source URL, and date range
- Read one issue and its links
- Create an issue with title, body, status, labels, and source URL
- Update an existing issue without replacing unrelated fields
- Add a source link and recurrence note
- Cancel, close, or delete an issue created by this run if the source handoff fails

If a required operation is unavailable, fail closed for that write.

Resolve configured team, project, status, and labels at runtime. Do not invent IDs, create labels, assign owners, or set priority unless the config explicitly requires it.

## 7. Dedupe

Always check whether this source permalink is already linked to a tracker issue or a prior triage reply. If so, do not post or create a duplicate. For pasted text, check the current run for an earlier verdict on the same user message. If the tracker is not configured or accessible, report dedupe as unavailable, not as no match, and make no tracker writes.

For bugs and performance reports, search the tracker using:

- Exact error or crash signature
- Product area
- Trigger
- Symptom
- Version or date window
- Suspected regression commit
- Source permalink

Choose one outcome:

- Confident duplicate: same signature, or the same area, trigger, and symptom, or a confirmed shared cause.
- Possibly related: a shared cause is plausible but not proven.
- Weak resemblance: similarity is superficial.
- No match.

For a confident duplicate, update the existing issue with the source permalink and one short recurrence note. Do not reopen, relabel, or reassign it unless the config says to.

For a possible match, link it in the verdict as uncertain and create nothing.

A long-closed issue is a regression lead, not automatically a live duplicate.

## 8. Decide whether to create

Create only when all of these are true:

1. The classification is bug or performance.
2. The behavior is clearly broken.
3. The issue is still live or not known to be fixed.
4. Dedupe found no confident or plausible live match.
5. The source parent and permalink passed preflight.
6. The tracker target fields resolved.
7. The adapter can compensate if the verdict post fails.

Never create for a feature request, question, feedback item, reroute, possible duplicate, confident duplicate, or already-fixed issue.

The new issue must be self-contained:

- Plain title that names the area and symptom
- Reporter quote
- Expected and observed behavior
- Version and environment, or `unknown`
- Trigger and frequency
- Source thread permalink
- Short cause-tracing findings with hypotheses labeled as hypotheses
- Inline screenshot or representative video frame when supported
- Links to remaining artifacts
- Configured intake status and labels

Do not put a guessed root cause in the title.

## 9. Post one verdict

Run a fresh source-parent preflight. Then post exactly one verdict on `SOURCE_ID`, or return it to the user for pasted text.

Never call a source posting action without a verified, nonempty `SOURCE_ID`.

Keep the reply short:

- Lead with the outcome.
- Link the existing or new tracker issue when there is one.
- Mention a reroute or one missing fact when needed.
- Include at most one allowed owner ping.
- End with exactly one marker line.

Marker contract:

```text
[benny:bug]
[benny:bug] tracker=https://tracker.example/issue/123
[benny:performance]
[benny:performance] tracker=https://tracker.example/issue/123
[benny:other]
```

Use only the configured marker strings. For pasted text without marker configuration, use the public marker strings above. The repro phase trusts the marker only when it comes from the configured triage identity on this source issue/thread, or from this coordinator's triage of the same pasted report.

After posting, read the same source issue/thread and verify the verdict appears on `SOURCE_ID`. If it does not, never retry in a new destination. For pasted text, the returned verdict is the handoff; do not post externally.

If this run created a tracker issue and the verdict did not land, use the adapter's compensation action. Verify that the issue is canceled, closed, or deleted. If compensation cannot be verified, report the failure only in the automation run output.

## 10. Watch one follow-up window

Watch the source issue/thread for the configured follow-up window, then stop. For pasted text, return the verdict and stop watching; a user reply supplies any follow-up.

- Answer only a direct question to the triage identity.
- Apply a concrete correction to the tracker issue when safe.
- Do not emit a second marker in the same run.
- Stay out of human coordination and side chatter.
- Stop early if someone asks the automation to stop.

Do not extend the window more than once. A new report should start a new run.
