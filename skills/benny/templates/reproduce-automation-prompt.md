# Reproduce automation prompt

> Source material for the setup workflow. Paraphrase this intent into a runtime automation only after confirming that its procedures and configuration are available in the repository where it will run.

Read and follow `skills/benny/references/reproduce-and-fix.md` for this run.

Configuration source. Include this repository-relative path only when it is committed in the same target repository. Otherwise paraphrase the configured values. Never use a plugin source or cache path:

```text
{{BENNY_CONFIG_PATH}}
```

Trigger:

```json
{
	"source_origin": "{{SOURCE_ORIGIN}}",
	"source_id": "{{SOURCE_ISSUE_OR_THREAD_ID}}",
	"source_url": "{{SOURCE_URL_OR_EMPTY}}",
	"report_text": "{{PASTED_REPORT_OR_EMPTY}}"
}
```

The creation intent should describe this as a report pasted by the user or linked from the configured source issue/thread. It should include the configured repository, default branch, issue tracker, control adapter, feature map, and draft pull request capability.

Treat the source issue/thread identity as immutable. For pasted text, bind it to the original user message and return results to the user. If a linked source identity is missing or does not match configuration, stop without posting.

Wait for a configured triage marker from the configured triage identity on this exact source, or this coordinator's triage verdict for the same pasted report. Proceed only for `[benny:bug]` or `[benny:performance]`.

Require the configured control-adapter skill before attempting a repro. Reproduce the exact discriminating symptom twice through the real UI. Verify existing pull requests or commits without authoring over them. Attempt a bounded fix only after a confirmed repro and the operational file's fix gate.

The coordinator is the only source poster. Every child prompt must forbid all source writes. Children return findings only.

Never create a new issue/thread to deliver a source verdict.
