# Changelog

- 2026-06-13 — no docs ontology existed → established six artifact types, the research→decision→plan pipeline, lifecycle rules, eight templates.
- 2026-06-25 — supersede chains made ADRs hard to follow → switched ADR model to in-place edits with an in-doc `## Changelog`.
- 2026-06-25 — ADR guidance lacked why-not-what framing → absorbed a rationalizations table + gotcha→ADR pattern. Provenance: addyosmani/agent-skills.
- 2026-06-25 — same-decision ADR edits still read as needing a supersede → documented the refines/references model; dropped superseded-by from template.
- 2026-06-30 — v1.1.0: one fat SKILL.md → split into a waypoint + adr/readme/changelog/inline-comments sub-recipes. Provenance: addyosmani/agent-skills.
- 2026-07-05 — v1.2.0: no design.md destination existed → added design/ (7-section, states-before-code, staleness lifecycle). Provenance: lazycodex DESIGN.md.
- 2026-07-05 — v1.2.1: design/'s staleness command used a GNU-only sed BRE → switched to POSIX extended regex for BSD/macOS portability.
- 2026-07-05 — v2.0.0: API-surface docs are a code-domain concern, not the docs/ ontology's job → removed the api-docs sub-recipe. BREAKING.
- 2026-07-06 — v3.0.0: realign to vendor-official authoring contract → spec-minimal frontmatter, flat routing table, fold sprawl + routing gaps (#27, #31).
- 2026-07-07 — v3.0.1: implicit research/plan/rule-to-ADR pressure caused unwanted decision records → made ADR authoring explicit-request only while keeping ADR templates available. Provenance: docs-wipe-reinit skill-document delegation.
- 2026-07-12 — v3.1.0: automatic relocation and first-commit plan freezing risked changing user work → made both explicit-request contracts and added ulw-plan's concrete-path, acceptance, happy/failure QA steps.
- 2026-08-29 — v3.1.1: a wildcard support-file token made Hermes request a literal missing path → name the templates directory without a glob.
- 2026-08-29 — v4.0.0: document owned design-system documents and lifecycle → moved ownership to design. BREAKING.
- 2026-08-30 — v4.0.1: repository documentation scaffolding belongs to document, not init.
- 2026-10-07: Documentation needed one sentence-level writing standard and a fixed final prose pass, so pstack's technical-writing guide lands as a reference and unslop closes every prose artifact. Provenance: technical-writing from Lauren Tan's pstack at cursor/plugins@d0ef80d86795816da932a153458c5dbe192d294e.
- 2026-10-07: inline-comments told agents to explain our own design choices in prose, which no-comments forbids, so owner decision (e) now keeps only comments about constraints we cannot change and ADR pointers.
- 2026-10-07: Restored the pstack wording so poteto's method reads as written; only Cursor-only mechanics and links differ.
