# Native skill discovery

Use the repository README's Installation and Usage sections for the selected runtime's distribution and discovery route.
This reference documents discovery only.
It supplies no installer and no per-role configuration.

1. Identify the user's selected runtime and its existing skill source.
   Follow that runtime's README route rather than assuming every loader scans the source checkout.
2. Inspect discovery through the runtime's available read-only listing or skill catalog.
   For a marketplace or plugin route, the installed plugin is the discovery source.
   For a plain Agent Skills route, the README describes an individual package at `.agents/skills/<name>/SKILL.md`; an auxiliary development clone is not proof of a registered plugin.
   GJC's installed-plugin handle is `craft-skills:craft-mode`; the portable frontmatter name remains `craft-mode`.
   Use the README's selected route for a tap or any other configured skill location.
3. Invoke craft-mode using that runtime's native syntax and inspect the loaded body.
   Check that the inline principle index and local references are reachable, and that cross-package pointers resolve to the discovered owner skills.
4. Distinguish source presence, discovery, body load, and invocation in the report.
   If only source is available, report loading as unverified.
   If the package is absent, report the missing discovery route; do not install, copy, reload, or edit global configuration as a side effect.

Persistence between turns belongs to the runtime.
Invoke the skill again for a new task when its loading behavior requires it.
No background automation starts from discovery.
