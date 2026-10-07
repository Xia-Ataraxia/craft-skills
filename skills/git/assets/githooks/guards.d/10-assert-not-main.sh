#!/usr/bin/env sh
# git-guard check, registered into the repository's .githooks/guards.d/ dispatcher.
# Refuses a commit while HEAD is on a protected branch. Logic lives in
# scripts/git-guard/assert-not-main.sh (the single source of truth reused by
# the pre-push hook and any runtime-hook layer); this file only execs it.
set -eu

exec "$(git rev-parse --show-toplevel)/scripts/git-guard/assert-not-main.sh"
