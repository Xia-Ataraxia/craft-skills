# Changelog

- 2026-10-07: Users needed one place to ask which skill, playbook, or principle fits a task and how to start craft-mode, so pstack's help router now ships as its own package. Provenance: poteto-help SKILL.md, references/prompting.md, and references/recipes.md from [pstack at d0ef80d86795816da932a153458c5dbe192d294e](https://github.com/cursor/plugins/tree/d0ef80d86795816da932a153458c5dbe192d294e/pstack) (cursor/plugins@d0ef80d, MIT, Lauren Tan).
- 2026-10-07: Owner decision (k) keeps poteto-help's wording on when skills load and its principles paragraph, so those lines now differ from upstream only in names, links, and the dropped `/setup-pstack` sentence.
- 2026-10-07: The owner decided to ship make-bot-ui, so the upstream routing row for it is back in the skill table.
- 2026-10-07: Issue-report triage needed a direct route to Benny rather than starting with an already-reproduced bug fix.
- 2026-10-07: Every runtime installs craft-skills through its native plugin or tap, so the repository installer that only reprinted those commands was removed and the setup step no longer points to it.
