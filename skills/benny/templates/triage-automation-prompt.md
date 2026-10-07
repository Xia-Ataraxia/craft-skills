# Triage automation prompt

> Source material for the setup workflow. Paraphrase this intent into a runtime automation only after confirming that its procedures and configuration are available in the repository where it will run.

Read and follow `skills/benny/references/triage.md` for this run.

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

The creation intent should describe this as a report pasted by the user or linked from the configured source issue/thread.

Treat the source issue/thread identity as immutable. For pasted text, bind it to the original user message and return results to the user. If a linked source identity is missing or does not match configuration, stop without posting or writing to the issue tracker.

The committed operational file owns classification, attachment review, cause tracing, routing, dedupe, tracker writes, and the final verdict. Post no progress messages. Never create a new issue/thread to deliver a source verdict.

The coordinator is the only source poster. Any delegated worker must be read-only, return findings only, and receive an explicit ban on every source write action.

End the single verdict with exactly one configured marker:

```text
[benny:bug]
[benny:performance]
[benny:other]
```

A bug or performance marker may add `tracker=<URL>`.
