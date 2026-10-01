# Test Strategy

Optional audit aid for a change that spans several distinct risks.
A small or low-impact reversible change records the same judgment in the existing task summary and does not need this table.
Select or combine columns that clarify the audit; filling every column is not an admission requirement.
Do not treat a completed table, an extra approval, or a repeated full-suite run as proof.

| behavior_or_invariant | failure_mode | independent_oracle | cheapest_layer | why_cheaper_layers_insufficient | assertion | decision (retain\|add\|rewrite\|delete\|no-test) | justification | evidence_state |
|---|---|---|---|---|---|---|---|---|
| <named behavior or invariant> | <distinct failure mode> | <specification, contract, or recorded fixture a consumer or independent obligation needs> | <unit, component, integration, or e2e> | <why a cheaper layer cannot observe this failure, or `n/a`> | <public observable assertion> | <retain, add, rewrite, delete, or no-test> | <consumer or independent obligation; for `no-test`, name pure delegation, type guarantee, or the higher contract test that covers it> | <observed, safely demonstrable, or unavailable> |
