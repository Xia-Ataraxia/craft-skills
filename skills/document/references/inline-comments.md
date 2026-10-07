# inline-comments

Apply the inline-comment convention: a comment survives only when it records something the code's owners cannot change. This is a standing convention, not an artifact — there is no template, only the rule and its boundaries.

The code already shows *what* it does.
The review procedure lives in `principle-programming/references/comments.md`; this file states the convention that procedure enforces.

## When a comment survives

- **A constraint we do not own** — an external API quirk, a workaround for an upstream bug, or a value that must stay in sync with an external system.
  The code cannot show why the constraint exists, and we cannot remove it by editing our own code.
- **A pointer to the decision** — when the reason is cross-cutting and lives in an ADR, link it: `// See ADR-NNN for rationale`.
  The comment carries the local "watch out"; the ADR carries the full why.

Both carries are foreign facts.
A keep needs proof that the thing it describes is outside our control.

## When NOT to add a comment

- **A why about our own design choice** — why this algorithm, why this order, why this slower path — is ours to change.
  Replace the comment with a clearer name, structure, type, or test that makes the choice self-evident, and mark the exact symbol for that reshape.
  A reshape the reviewer cannot finish stays an open flag, never a rewritten comment.
- **Narration, banners or a restated design rationale** — delete them; the code and its tests carry the decision.
- **Restating the code** — `// increment i` over `i++` is noise that goes stale.
- **Compensating for an unclear name** — if a comment is needed to explain what a variable or function *is*, rename it instead. A good name removes the comment.
- **Dead code or commented-out blocks** — delete them; git remembers.
- **Change narration** — `// changed from X` belongs in the commit message or CHANGELOG, never in the code.

## The test

Before writing or keeping a comment, ask: *"Does this prove something we cannot change?"*

- Yes, and the proof holds today on a live path → keep it.
- No, or the reason is our own design choice → delete the comment, or fix the code (rename, extract, type, test) so no comment is needed.

## Common rationalizations

| Rationalization | Reality |
|---|---|
| "The reader will want to know why I chose this." | A why about our own choice is ours to change: encode it in a name, structure, type, or test. Only a foreign constraint earns prose. |
| "More comments make code clearer." | Comments rot when the code changes; naming and structure do not. Clarity comes from the code, not from prose beside it. |
| "I'll comment what this line does." | The line already says what it does. Say nothing, or reshape the code until the point is obvious. |
| "I'll leave the old version in a comment, just in case." | Git holds history. Commented-out code is dead weight that misleads readers. Delete it. |
| "A comment is faster than renaming." | A comment explaining what a name means is a renamed-variable waiting to happen. Rename; the comment disappears. |

Even a correct-sounding "we cannot change it" is a claim, not proof: check the code nearby, and keep the comment only when the foreign constraint is still true today.

## Red flags

- A comment explaining our own design choice (reshape the code instead)
- A comment that paraphrases the line below it
- A comment explaining what a poorly named variable holds (rename instead)
- Commented-out code left in the file
- A comment narrating a past change ("used to be X")
- A cross-cutting rationale duplicated inline instead of linked to its ADR
- A "do not remove" or "too risky" comment with no proof the constraint is foreign

## Verification

- [ ] Every surviving comment records a foreign constraint or points to an ADR
- [ ] No comment explains a design choice we could encode as a name, structure, type, or test
- [ ] No comment merely restates the code
- [ ] Names carry meaning; comments are not compensating for unclear naming
- [ ] No commented-out code or change-narration comments
- [ ] Cross-cutting rationale links to its ADR rather than duplicating it
- [ ] Each keep has proof the constraint is outside our control, true on a live path today
