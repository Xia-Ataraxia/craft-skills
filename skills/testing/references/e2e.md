# Testing E2E Reference

Use e2e evidence only for a critical user-visible risk that no cheaper credible scope proves.
Do not schedule the full e2e suite, or repeat an unchanged browser or runtime journey, when the change is small, reversible, and already covered.
Broaden the journey, browser, or device set only for new user-visible behavior, a failure cheaper evidence does not explain, or unresolved residual risk.
Distinct residual risk decides breadth; a count of browsers, devices, or runs does not.

## Selector and wait rules

Select elements by role, accessible label, or a dedicated test id.

Reject CSS chains, XPath, and selectors tied to incidental DOM structure because behavior-preserving markup changes should not break the test.

Use framework auto-wait or wait for the actual state, event, or user-visible condition that proves progress.

Do not use fixed sleeps or whole-test retries to wait for a transition.

Keep assertions on independent user-observable outcomes rather than private implementation effects.

## Data and setup

Create isolated data for each test and clean it up with the narrowest safe mechanism.
Share setup only when an isolation consumer needs that shared lifecycle.
Case-local inputs stay in the test that uses them; do not grow them into a fixture catalog or a replacement guard layer.

Do not rely on state, ordering, or side effects left by another test.

Create prerequisites through an application API or narrow idempotent bootstrap when they are not part of the behavior under test.

Do not use broad demo seeds, resets, or cleanup without proof that the target is dedicated, disposable, and non-production.

Use the minimal browser and device matrix that preserves the named residual risk.

Navigation-only helpers may reach a starting state but must not hide the test's assertions or behavior-specific setup.

## Smoke and critical journeys

Smoke tests prove narrow startup, deployment, or wiring viability.

Critical e2e journeys prove a user outcome such as authentication, checkout, or data preservation that remains risky after cheaper evidence.

Do not duplicate smoke and journey coverage unless each test names a distinct residual risk and independent oracle.

Do not require the full e2e suite on every commit or for every change.

Schedule or gate e2e execution according to the residual risk, feedback need, and incumbent delivery policy.
A wrapper or smoke helper that hides deployment or wiring does not retire an independent guard whose obligation still exists after the docs or helper move.

## Evidence and flake policy

For a reproducible user-visible defect, prefer a strong safe fail-before and pass-after on a named disposable consumer.
When that counterfactual cannot be run safely, record unavailable evidence and the limit instead of inventing a red run.
Do not require observed-red or mutation proof for every new or behavior-changed e2e test.
A small reversible change may cite existing journey evidence in a brief rationale; an audit table is optional.
Use the audit evidence states in `conventions.md` when an audit is performed.
An unavailable historical counterfactual alone does not justify deleting a journey that still protects a live user outcome.

Treat a flaky e2e test as a suite-health defect under the quarantine, retry, age, and readmission policy in `conventions.md`.

Route reproduction, diagnosis, and repair of one intermittent e2e failure to `debug`.

Resume testing after `debug` returns diagnosis and fix evidence to decide quarantine removal, retry removal, and portfolio health.

Return to `../SKILL.md` for scope and size selection and to `conventions.md` for independent-oracle and deterministic-test rules.
