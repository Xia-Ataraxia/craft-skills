---
name: research
description: 'Researches an open question by first reframing it: rewrites the ask as one problem statement, defines and separates its terms, splits the statement into sub-questions tied to established topics, then sweeps trustworthy primary sources per sub-question, verifies claims in proportion to risk, and replies with source-linked findings, options side by side, and how to check them. Use for "research this before we decide", "what does the evidence say", "compare these options", "dig into whether this is feasible", "what is this problem really", "조사해줘", or "근거 찾아서 파고들어 봐". Not for making the call; not for how existing code works - use how; not for why it got this shape - use why; not for adversarial review - use interrogate; not for filing a doc - use document.'
metadata:
  version: 2.0.0
---

# research

**You turn a loosely worded question into a problem the evidence can answer, then answer it with traceable findings and stop short of the decision.**

Most questions arrive as a feature or a yes/no ("can it recommend edit points?"). The useful research question is hidden underneath, and the field usually already has words and results for its parts. Framing first decides which sources matter. Sweeping first collects sources for the wrong question.

## 1. Frame

1. Rewrite the ask as one problem statement. Name the input, the judgment being made, and the output. If the goal is missing, ask the one question that fills it and stop.
2. Define the statement's key terms the way the field uses them. Where the field separates near-synonyms, separate them and say which one this question is about. Mark a coined term as a proposal.
3. When two things sound alike, state the extra judgment the second one takes on. That difference is often the real question.
4. Split the statement phrase by phrase into mutually exclusive sub-questions. Tie each to the established topic that studies it. A topic with no phrase behind it does not belong. Name the one or two core sub-questions.
5. Name the decision this research feeds. With none downstream, say so and keep the pass short.

Ground the frame in what exists before going external. Run `how` when the question is about a system's mechanics, and read prior notes or a demo's output directly.

## 2. Sweep

Sweep per sub-question. A finding rests only on a trustworthy record: reliable, authentic, and accurate.

- **Reliable.** The issuer has the authority to state the claim, is accountable when it is wrong, and runs a verification process you can inspect: peer review, a published methodology, or an official mandate. A vendor is authoritative about its own product, not about a competitor's.
- **Authentic.** You read the record the issuer published, traced through the citation chain to the original, not a summary or re-quote of it.
- **Accurate.** The passage you cite states the claim you make, at the precision you use it. Step 3 checks this.

Cite a paper by its peer-reviewed version of record. A preprint with no version of record may be cited only labelled as a preprint, and a finding that rests on it alone stays unresolved. A source whose issuer cannot be held accountable supports nothing, however original it is. Secondary sources may point you to records; they do not replace them.
Use a source's native index when it has one and broaden when coverage is thin. Record available stable IDs, URLs, and publication dates at retrieval, keep observation dates apart from publication dates, and leave unknown metadata unknown.
A search snippet is discovery, not evidence. Read the record before citing it. When access fails, record the limitation and keep the finding unresolved.
For a source dense enough that paraphrase loses precision, or one cited by more than one sub-question, keep the exact relevant passage with its locator (section, page, line) before synthesis, and quote from that, not from memory.
When subagents are available and the topic spans several sub-questions, give each sub-question its own sweep, returning findings with source locators and access limits, and merge before verifying. A narrow topic runs in one pass.

## 3. Verify

Classify each finding before synthesis.
For a contested code-shaped claim, run the smallest executable probe and record the command and its observed result.
For a consequential non-code claim, counter-search for disconfirming evidence and corroborate it with an independent source. When independent sources disagree, explain the disagreement and keep the finding unresolved.
When the probe, counter-search, or corroboration is unavailable or inconclusive, label the finding unresolved.

## 4. Reply

Reply in the conversation. Lead with the problem statement, then the terms, then findings per sub-question with each claim's source inline. Keep findings and opinion apart. Compare options a later choice will pick between in a table, not a ranking.
Close with how the answer can be checked: for each finding, the observation that would confirm or overturn it. Separate proof that something runs from proof that it helps the person it is for.
Then state the gaps and how confident each finding is (source count, authority, recency). An empty gap list is valid when you say why the evidence suffices.

This produces no decision. Recommending belongs to the person, or to an ADR through `document`.
When the person asks to keep the result as a file, load `document` for its location and template, and archive retained source passages through it.

## Recorded mistakes

- Listing definitions, topics, and options side by side with no thread between them → derive each sub-question from a phrase in the problem statement.
- Answering "is it possible" with yes or no → reframe it as the problem statement and report what the evidence says it would take.
- Treating a model's stated reason as evidence its answer is right → check the answer against the source or a person's judgment.
- Citing an arXiv copy when a peer-reviewed version exists → cite the version of record.

Write every reply through the **unslop** skill.
