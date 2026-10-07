# Testing Integration Reference

Use integration evidence when boundary semantics are the named risk and preserve the fidelity that makes those semantics credible.
Choose the cheapest credible boundary that still exposes that risk; do not assemble a real dependency, full suite, or second runtime pass when existing evidence already covers a small reversible change.
Broaden only for new boundary behavior, a failure cheaper evidence does not explain, or unresolved fidelity, security, or error-translation risk.

## Contents

- [Fidelity and isolation](#fidelity-and-isolation)
- [Seams, fakes, mocks, and spies](#seams-fakes-mocks-and-spies)
- [Boundary evidence](#boundary-evidence)

## Fidelity and isolation

Use a real dependency in a container when engine, major version, configuration, migrations, query semantics, ordering, transaction behavior, or protocol behavior is the risk.

Use a faithful in-memory or wire-level fake only when it preserves the semantics relevant to the named risk at lower cost.
Do not grow a project-internal fake into a second implementation of application business rules merely to avoid exercising the real boundary.
When retiring such a fake, map its meaningful consumers to retained evidence before deletion; moving the emulator or rebuilding its catalog is not retirement.
Do not replace a retired fake with a shared fixture catalog or a new guard layer that only rechecks topology.
Keep narrow test arrangements outside runtime routes and dependency graphs, and make undeclared intercepted requests fail rather than return a default success.

Use a narrow mock only under the admission rules below.

Match the production database engine, major version, schema behavior, and behavior-affecting configuration.

Run application behavior through the runtime application role rather than an administrative migration or cleanup role.

For RLS, prove both allowed and denied tenant paths through that application role.

Choose rollback isolation only when the application does not own commits, rollbacks, transaction boundaries, or transaction-local RLS state.

Use truncate or a per-test schema or database when application-owned transactions or security state make rollback unfaithful.

Guard privileged cleanup, broad seed, reset, or truncate operations with proof of a dedicated disposable non-production target.

Start expensive immutable dependencies once per session when per-test isolation retains faithful behavior.

Bootstrap only prerequisites needed by the boundary under test.
Share a fixture only when an isolation consumer actually needs the shared lifecycle; otherwise keep inputs local to the case.

Keep deployment-aware contracts narrow and distinguish independently deployed request or response shape from full behavior.
A wrapper that hides deployment or wiring can leave that risk untested; keep an independent guard when the obligation survives moving the documentation or the wrapper.
That guard must itself have a consumer or an independent safety obligation.
It is not a blanket requirement to test every checker, filename, or call graph.

## Seams, fakes, mocks, and spies

Introduce a seam only at a meaningful external or nondeterministic boundary such as a clock, random source, external SDK, transport, queue, or payment provider.

Do not create an interface or dependency-injection layer solely to mock project internals.

Admit a mock or spy only when its interaction is independently specified or no faithful cheaper fake can expose the named risk.

Assert an independently specified request, externally visible effect, or error translation rather than the mock return configured by the test.

Reject return-equals-expectation tests and private-call expectations because they are tautologies.

Prefer this ladder for the named risk: real container or service, faithful in-memory or wire fake, then narrow mock.

```python
# The oracle is the public query behavior, not a repository mock return.
def test_active_user_query_excludes_inactive_users(db_session):
    db_session.add(User(id=1, active=True))
    db_session.add(User(id=2, active=False))
    db_session.commit()

    users = UserRepo(db_session).get_active()

    assert [user.id for user in users] == [1]
```

This test goes red if the query predicate that excludes inactive users is removed.
The example states the intended failure mode; it does not require a mutation harness or a recorded red run for every boundary test.

## Boundary evidence

For a reproducible defect, the strong safe pattern is fail-before and pass-after on a named disposable consumer.
Use that pattern when the counterfactual can be run safely.
When it cannot, record honest unavailable evidence and the limit; do not invent a red run, and do not delete boundary coverage from unavailable evidence alone.
Do not require observed-red or mutation proof for every new or behavior-changed boundary test.
A small reversible change may rely on a brief rationale against existing evidence.
Use `observed`, `safely demonstrable`, and `unavailable` for optional audits as defined in `conventions.md`.

Use a contract test for independently deployed sides that need request or response shape evidence without full journey wiring.

Do not use a contract test to replace real dependency behavior when the dependency semantics are the risk.

Return to this skill's SKILL.md for scope and resource-size selection and to `conventions.md` for oracle, audit, and suite-health rules.
