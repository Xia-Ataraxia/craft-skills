# Owner decisions

Preserve upstream principle bodies unchanged.
Apply these owner decisions at the existing craft rule owners instead of editing a principle to remove the disagreement.
The decision paragraphs below retain the plan's wording.
File lists identify the affected owners; the listed edits are applied in this branch.

## (a) Shortcut comments

(a) `no-comments` wins over the `craft:` shortcut-comment convention, which is removed from `programming` (its `craft:` comment lines and recorded-mistake line) and from `refactor`'s boy-scout line; a shortcut's ceiling goes to a follow-up note, type, test or lint instead, per `no-comments` step 5.

Affected files:

- `principle-programming/SKILL.md`, the renamed programming owner.
- `refactor/SKILL.md`.
- `principle-programming/references/comments.md`, which owns the no-comments procedure and step 5.

## (b) Changelog rationale

(b) A changelog entry holds only the date and why the package changed this way: `- YYYY-MM-DD: <why it changed>`; no em dash, no required version or what-arrow; retained entries are not rewritten.

Affected files:

- Each changed package's `CHANGELOG.md`, including craft-mode's.
- Repository `docs/skills/package-contract.md`, Local version and changelog.
- Repository `AGENTS.md`, the managed changelog convention.

## (c) Validated TypeScript assertions

(c) TypeScript: judged not a real conflict (both forbid casting unvalidated data and both put parsing at the boundary with the repository's schema library first); the upstream wording governs: `as` only right after validation, exhaustiveness via inline `const _exhaustive: never`. The current iron-list item banning every `as` and the `assertNever` example are replaced by the upstream text.

Affected files:

- `principle-programming/SKILL.md`, the iron list and no-excuse audit.
- `principle-programming/references/typescript.md`.
- `principle-programming/references/typescript/patterns.md`.
- `principle-programming/references/type-system-discipline.md` and `principle-backend/references/boundary-discipline.md`, preserved principle text.

## (d) Declared phase boundaries

(d) `outcome-oriented-execution` always follows the upstream text: for any planned change that declares where temporary breakage is acceptable, intermediate breakage is allowed and verification happens at the declared phase boundaries; `programming`'s "one logical, independently reversible unit" rule and `refactor`'s separate-commit rule each gain one line deferring to the principle in that case.

Affected files:

- `principle-architecture/references/outcome-oriented-execution.md`, preserved principle text.
- `principle-programming/SKILL.md`, the independently reversible unit rule.
- `refactor/SKILL.md`, the separate-commit step and checklist.
- `craft-mode/references/playbooks.md`, the refactoring route.

## (e) Inline-comment scope

(e) `no-comments` governs code comments: a comment stays only when it records something the code's owners cannot change (an external API quirk, an upstream bug workaround, a value that must stay in sync with an external system) or points to an ADR (`// See ADR-NNN`); a "why" about our own design choice becomes a clearer name, structure, type or test instead. The existing bans on restating the code, unclear names, dead code and change narration stay. Adopted by the orchestrator on 2026-10-07 after the owner did not answer within 30 minutes, following decision (a); reversible on owner veto.

Affected files:

- `document/references/inline-comments.md`, the rewritten convention.
- `principle-programming/references/comments.md`, preserved principle text; the review procedure both files point to.
