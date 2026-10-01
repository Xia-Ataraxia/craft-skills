# Testing Conventions Reference

This reference owns test quality, lifecycle evidence, audit decisions, and suite health.

## Contents

- [Test value rubric](#test-value-rubric)
- [Evidence and oracles](#evidence-and-oracles)
- [Evaluation inputs and outputs](#evaluation-inputs-and-outputs)
- [New and modified tests](#new-and-modified-tests)
- [Audits](#audits)
- [Static audit leads](#static-audit-leads)
- [Test-first and characterization quality](#test-first-and-characterization-quality)
- [Readable deterministic tests](#readable-deterministic-tests)
- [Suite health and quarantine](#suite-health-and-quarantine)
- [Cross-skill ownership](#cross-skill-ownership)
- [Public source basis](#public-source-basis)

## Test value rubric

A valuable test names behavior or risk, uses an independent oracle, has lifecycle-appropriate counterfactual evidence, survives behavior-preserving refactors, is deterministic and diagnostic, and adds unique suite value proportional to cost.

Name the contract, invariant, failure mode, or user outcome rather than a file, method, private call, assertion count, or implementation path.

Choose the cheapest credible scope and resource size from `../SKILL.md`.

Retain repetition only when it protects a distinct residual risk that cheaper existing evidence does not prove.

Reject generated tautologies, implementation proxies, unreviewed snapshots, duplicates, and tests that cannot establish their claimed value.

## Evidence and oracles

An independent oracle comes from a public contract, business rule, invariant, user-visible outcome, approved fixture, or independent reference.

A mock return, private-call expectation, current implementation output, or uncontrolled snapshot is not an independent oracle.

Controlled observation or a snapshot is provisional characterization evidence until a contract, invariant, independent reference, or explicit approval corroborates it.

| Evidence state | Meaning | Use |
|---|---|---|
| `observed` | The named counterfactual was run and failed for the named reason; report pass-after separately when it was also run | Strong evidence for a reproducible defect and for behavior whose sensitivity must be shown |
| `safely demonstrable` | A precise, disposable counterfactual is specified and can be run safely, but has not run | Acceptable when risk and lifecycle do not justify running it now |
| `unavailable` | The counterfactual cannot safely or credibly be obtained | Records a limitation and never alone authorizes deletion |

Evidence state describes the counterfactual, not whether a test happens to pass.
A green run alone does not prove the test would fail for the named reason.
Missing historical red evidence alone does not authorize deletion.

## Evaluation inputs and outputs

Optional authored reusable scenario inputs, including an existing `evals.json`, may be tracked when they serve a meaningful review or test consumer.
Generated evaluation outputs, run transcripts, and scores are scratch evidence, not canonical or versioned artifacts.
Preserve meaningful script, security, and data-integrity test input fixtures; they are not generated run outputs.

Keep deterministic checks of real contracts in code and taste or contextual judgment in documentation.
Reviewing prose or taste does not require a permanent JSON corpus, prescribed evaluation format, or checker.
A documentation-only policy correction does not by itself justify expanding a reusable prompt corpus.
Task-scoped scratch checks need not become committed test files.

## New and modified tests

1. Name the behavior or risk and search for existing evidence that already proves it.
2. Choose the cheapest credible scope and resource size that retains the relevant fidelity.
3. Define the independent oracle before encoding setup or assertions.
4. Design a deterministic counterfactual that would fail for the named reason and survive a behavior-preserving refactor.
5. For a reproducible defect, obtain a strong fail-before and pass-after result in a named disposable consumer when that demonstration is safe.
6. Otherwise scale evidence to risk and lifecycle: seek stronger observed evidence for material or hard-to-reverse risks, use a precise safely demonstrable counterfactual when that is sufficient, and disclose unavailable evidence and residual risk when a demonstration is unsafe or not credible.
7. Hand production-code red-green implementation to `programming` with the risk, oracle, and the strongest available failing evidence.
8. Review returned pass evidence for the named behavior, diagnosis, determinism, and marginal cost.

Do not invent a failing test or mutate source solely to manufacture a red result when the reported behavior cannot be reproduced safely.
Do not require source mutation, a strategy table, or another process artifact as universal proof.

Record the limitation and preserve the strongest available evidence until a credible reproduction exists.

## Audits

Inventory tests by behavior and risk rather than by source file, filename, or assertion count.

For a multi-risk audit, record each decision, independent oracle, evidence state, distinct residual risk, and cost.
A small change keeps that rationale in the existing summary; do not require one row per test or a completed strategy table.

| Decision | Use when |
|---|---|
| Retain | It independently protects a distinct risk at acceptable cost and has a current consumer or independent obligation |
| Rewrite | The protected risk matters but the oracle, determinism, diagnosis, or refactor resilience is weak |
| Delete | Separate evidence proves it obsolete or duplicate and remaining coverage protects its meaningful risk |
| Add | A material residual risk lacks credible evidence |

Scale evidence to risk and lifecycle.
A reproducible defect needs a strong fail-before and pass-after result when the demonstration is safe.
A green run alone is not sensitivity evidence.
Historical `unavailable` evidence requires separate obsolete, duplicate, or remaining-coverage proof before deletion.

Search results and static patterns are review leads only.

Do not use assertion tokens, filenames, headings, historical paths, or source-test cardinality as proxies for quality.
An actual protocol, schema, version, registration, containment, secret-handling, permission, or routing contract can justify a deterministic check of otherwise incidental-looking structure.
Local CHANGELOG shape and sentence-formatting preferences are repository policy, not universal native loader requirements.
Document taste and contextual judgment rather than adding a checker-of-checker to enforce them.

## Static audit leads

Use static searches to identify candidates, then apply the audit record and counterfactual evidence; a match never decides retain, rewrite, delete, or add by itself.

- Search for host-layout pins and silent skips such as `Path.home()`, literal `/tmp` paths, `skipif`, `importorskip`, or unconditional skip calls.
- Search documentation tests for existence, heading, or substring assertions that never execute the documented instruction.
- Search for log-text, private-attribute, or lint-suppression assertions used as proxies for public behavior.

Replace host-layout pins with runner-provided per-test paths and isolate global side channels with case-local cleanup or a fixture justified by its actual isolation consumers.
Do not condition a default-suite test on a gitignored asset, optional binary, build flag, or sibling checkout: deliberately mark and select the required heavier environment instead.

For a documentation test, identify the consumer or independent obligation before retaining, replacing, or deleting it.
Exercise a documented command when its behavior matters; review judgment-oriented policy as prose rather than manufacturing an executable replacement.
Avoid heading, wording, and historical-path locks without a real consumer, but retain independently useful guards when policy moves to documentation.
Replace captured log-text or private-attribute proxies with a structured record or public result; confirm any lint suppression corresponds to an enabled rule.

For a new guard whose sensitivity is not otherwise shown, observed evidence may be a safe disposable removal that makes the test fail for the named reason, followed by restoration. Do not mutate source merely to manufacture red, and do not remove a guard that protects a live contract. A fixed sleep remains a nondiagnostic wait; wait for the condition or event instead.

## Test-first and characterization quality

Test-first work starts from a named risk and an independent oracle. Obtain observed fail-before evidence before `programming` changes production behavior when the defect is reproducible and the demonstration is safe; otherwise hand off the strongest lifecycle-appropriate evidence and its limit.

`refactor` may hand off characterization tests that record incumbent behavior before structural change.

Testing reviews handed-off characterization for placement, determinism, diagnostics, and whether its observation remains provisional.

Do not treat unknown incumbent output as an approved specification or permanent golden master.

## Readable deterministic tests

Write names as behavior sentences such as `test_given_empty_cart_when_checkout_then_rejects`.

Prefer DAMP over DRY so a reader can understand a scenario without chasing helpers.

Use fresh factories and builders with sensible defaults and explicit relevant overrides.

Keep behavior-relevant inline data when it explains the scenario more clearly than a builder.

Control clocks, randomness, external state, test order, and asynchronous conditions.

Wait for the condition or event that proves progress instead of sleeping or retrying a whole test.

Keep diagnostic context close to the oracle so a failure identifies the broken behavior.

Navigation-only helpers are the limited e2e exception described in `e2e.md`.

## Suite health and quarantine

Treat a flaky test as a suite-health defect and track its trust cost, duplicate coverage, runtime trend, age, and effect on signal.

Quarantine only with a visible reason, owner or tracker, bounded review age, and retained diagnostic evidence.

Do not silently skip a test or use retries as a long-term repair.

Use a narrow documented retry only for demonstrated infrastructure instability and review its continuing cost.

Route reproduction, diagnosis, and repair of one specific intermittent failure to `debug`.

After `debug` returns diagnosis and fix evidence, testing decides readmission, duplicate removal, retry removal, and the suite-health follow-up.

## Cross-skill ownership

`refactor` initiates characterization before structural change.

Testing accepts handed-off characterization tests for quality, oracle, placement, and provisional-observation review.

`programming` owns production-code red-green implementation after testing supplies the test design and the strongest available evidence for the named risk.

`debug` owns a specific failure's reproduction, diagnosis, and repair.

Testing owns new-test quality, audits, placement, quarantine policy, and post-fix health.

`ml` and `agents` own their evaluation domains.

## Public source basis

- [OpenAI latest-model guidance](https://developers.openai.com/api/docs/guides/latest-model): user-supplied Astra scoped-verification basis; keep verification proportional to the changed behavior.
- [Anthropic scoped changes and tests guidance](https://platform.claude.com/docs/en/build-with-claude/prompt-engineering/prompting-claude-fable-5-1#keep-changes-and-tests-to-what-the-task-asks-for): task-scoped scratch checks need not be retained or expanded into extra committed test files.
- [Garry Tan/gstack](https://github.com/garrytan/gstack): inspiration for reusable judgment paired with deterministic tools, not wholesale adoption of its workflow or policies.

These sources inform local craft; model-specific API settings are not universal testing rules.
