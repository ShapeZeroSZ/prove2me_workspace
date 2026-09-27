# Prove2Me mission workflow — notes for every session

Captain account: ShapeZero. Credentials are in `credentials.json` (gitignored — never
commit it, and never send the key or token anywhere but https://prove2.me/api/v1).
Lean 4 / Mathlib are pinned to the platform environment; see `references/lean-setup.md`.

## Mission type — the rule

Choose `mission_type` by where the result comes from, and make the source field match:

- **`Textbook`** — only for **classical results backed by a genuine textbook-level
  reference**, and that reference is cited in the **source** field. Wikipedia alone is not
  a textbook-level reference.
- **`ResearchPaper`** — for results that **come from the Shape Zero derivation**. Cite the
  **specific repository document and section** (e.g.
  `https://github.com/ShapeZeroSZ/shape-zero/blob/main/00_START_HERE/MODEL_SPEC.md` §1b)
  **as the source**, not as "motivation".
- **`OpenProblem`** — only for **genuinely unsolved** questions.

**Why.** The moderator (Shuze Chen) approved missions 7 and 8 on 2026-09-27 but noted on
both, "no action required", that the type was Textbook while the references were
Wikipedia pages and a motivational repository (mission 8: "the mathematics is
self-contained and does not depend on that repository"). Missions 7 and 8 stay as
approved; this rule is for future missions.

## Workflow (as practised on missions 5–8)

1. Compile the draft against the pinned Mathlib; fix names without changing any
   statement's meaning. Keep stated hypotheses exactly.
2. Prove the goal, milestones and corollaries locally first (no `sorry`, standard axioms
   only; check `example : type_of% @NS.thm := @solution` and `#print axioms`).
3. Milestones must be steps the proof actually uses; anything derived from the goal is a
   plain item (corollary) after the goal.
4. Read-backs: blind auditor sub-agents given only `references/mission_auditor.md` and the
   stripped Lean bundle; upload their text verbatim.
5. Upload as a **draft only**; show the user the read-backs; wait for approval.
6. On approval, launch and submit all proofs **in the same process** (a resumable
   `launchN.py`), logging each theorem's status before its submission.
7. Record the mission in the shape-zero repository (PROVENANCE, MODEL_SPEC, README,
   OVERVIEW) and run `00_START_HERE/check_consistency.py`.

## Upload hygiene

- Use `tools/p2m.py` for API calls: it refuses any request body containing a control
  character (other than newline).
- Run `python3 tools/lint_build.py <build scripts>` before any upload script: it flags
  implicit string concatenation. (Mission 8's titles were damaged by `r'…$z'' = …'`,
  where `''` ends the string; write such text as `r"…"` or `r'''…'''`.)
