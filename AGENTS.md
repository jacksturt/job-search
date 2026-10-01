# Job Search: Agent Collaboration Protocol

Two agents share this repo for Jack Sturtevant's job hunt.

- **Muse**: sourcing agent (separate machine). Finds new job leads and adds them to the tracker.
- **Claude Code**: uses the tracker to tailor the resume and cover letters per application.

## Layout

```
tracker.xlsx                          # the job tracker (single source of truth)
resume/base/                          # base resume source (LaTeX, XeLaTeX / Tectonic)
applications/<company>-<slug>/        # tailored resume + cover letter per job pursued
AGENTS.md                             # this file
```

## Tracker columns

Company | Role | Location | Job URL | Posted Date | Salary Band | Fit Notes | Status | Resume Version | Cover Letter Version | Date Applied | Notes | Cover Letter Needed | Has Extra Questions | Effort

`Cover Letter Needed` (column M, appended last so column order for earlier fields is unchanged) is one of:
- `Required`: the application form requires a cover letter. Write one.
- `Optional`: the form has a cover letter field but it can be skipped.
- `No field`: the form has no cover letter field.
- `Unknown`: could not be determined (e.g. non-Greenhouse/Lever ATS, or the posting is closed).

Muse may fill this in for rows it appends. Claude Code may also edit it.

Two more effort-triage columns follow it (appended last, so earlier column order is unchanged):

`Has Extra Questions` (column N), custom application questions beyond the standard fields (name, contact, resume, cover letter, links, work-authorization / EEO / "how did you hear"):
- `None`: nothing extra.
- `Short`: one or two short answers (about 1-2 sentences, or a one-line text box).
- `Long`: at least one real free-text question (e.g. "Why do you want to work here?").
- `Unknown`: not checked or not determinable.

`Effort` (column O), how much work the application is:
- `Low`: no cover letter needed (Optional / No field) and extra questions are None or Short. Quick apply.
- `Medium`: cover letter Required with no long questions, OR long questions with no cover letter required.
- `High`: cover letter Required AND long questions.
- `Unknown`: inputs unknown.

Daily target: ~9 `Low` + 1 `Medium`/`High` (with a tailored cover letter or long answers).

## Status lifecycle

`new` → `reviewing` → `tailoring` → `applied` → `screening` → `interview` → `offer` | `rejected` | `skipped`

`skipped` means Jack decided not to pursue the role (e.g. not qualified). Keep the row so Muse's URL dedupe doesn't re-add it. Never delete rows.

## Rules

### Muse (sourcing agent)
- May ONLY append new rows with Status = `new` (and may set Cover Letter Needed on those rows).
- Dedupe on Job URL (compare the full URL, including query string) before appending.
- Must NOT edit any column of existing rows.

### Claude Code
- May edit Status, Resume Version, Cover Letter Version, Date Applied, and Notes.
- May add files under `applications/`.
- Must NOT delete or reorder rows.

### Both
- Pull before writing, commit small, push promptly. Muse only ever appends at the bottom, so merges should not conflict.
- Do not commit secrets or credentials.

## Application files

Tailored application files go in `applications/<company>-<slug>/`:
- `resume.pdf` and `cover-letter.pdf` (the deliverables)
- keep the source files too (e.g. `resume.tex`, `cover-letter.md`)

Record the folder name in Resume Version / Cover Letter Version in the tracker.

## Applying (Muse)

Muse may also submit applications. For rows with Status = `tailoring`, use the files named in `Resume Version` / `Cover Letter Version`: they live in `applications/<slug>/` as `resume.pdf` and `cover-letter.pdf`, where `<slug>` is the filename minus its `resume-` / `cover-letter-` prefix and `.pdf` suffix. A row with a blank `Cover Letter Version` has no cover letter field: upload the résumé only.

After submitting, Muse may set that row's Status to `applied`, fill `Date Applied`, and add to `Notes`. If it cannot submit (CAPTCHA, login wall, a question it does not know the answer to), leave Status as `tailoring` and write the reason in `Notes`. Never guess answers about work authorization, sponsorship, demographics, salary or free-text questions. Never delete rows or files.
