# Changelog

- 2026-10-07: Users needed a page whose buttons wake an agent without the sender key ever reaching the browser or chat, so the owner chose to ship pstack's make-bot-ui with its Cursor-only routine, secret-card, endpoint, header, and wake-envelope mechanics replaced by neutral phrases mapped in craft-mode's runtimes reference. Provenance: make-bot-ui SKILL.md from [pstack at d0ef80d86795816da932a153458c5dbe192d294e](https://github.com/cursor/plugins/tree/d0ef80d86795816da932a153458c5dbe192d294e/pstack) (cursor/plugins@d0ef80d, MIT, Lauren Tan).
- 2026-10-08: Hermes refused to install the skill because the Tailscale setup told the agent to run `sudo`, so the agent now asks the user for the root-only install and operator grant, then starts the node without root.
