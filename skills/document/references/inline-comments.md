# inline-comments

Apply the inline-comment convention: a comment survives only when it fits Comment Sicko's keep-list. This is a standing convention, not an artifact — there is no template, only the rule.

The keep-list lives in `principle-programming/references/comment-sicko.md` and the review procedure in `principle-programming/references/comments.md`; when this file and those disagree, those win.

## When a comment survives

- A legal or license header.
- Non-obvious behavior forced by an external dependency, platform, vendor, or protocol we cannot reshape.
- `// prettier-ignore`, or a lint suppression whose rule is faulty, pedantic, or style-only.
- A doc comment that defines a public API contract.
- An issue or RFC link that explains a constraint code cannot express.

A keep needs proof that it fits one of these today on a live path. When unsure, delete it.

## Everything else is deleted

- A surprise or design choice in our own code: rename, extract, type, or test until it is obvious, and mark the exact symbol when that reshape is out of scope.
- An ADR pointer such as `// See ADR-NNN`.
- A comment that restates the code or explains an unclear name; rename instead.
- Commented-out code and change narration; git and the CHANGELOG hold history.

## Verification

- [ ] Every surviving comment fits a keep-list category, proven on a live path today.
- [ ] No ADR-pointer, design-rationale, restating, or change-narration comment remains.
- [ ] No commented-out code remains.
