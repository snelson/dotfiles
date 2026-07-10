---
name: squash-commit
description: Generate a squash merge commit message for the current branch
disable-model-invocation: true
allowed-tools:
  - Bash(git *)
  - Bash(gh *)
  - Bash(* | pbcopy)
---

Generate a squash merge commit message for the current branch and copy it to the clipboard.

## Steps

1. Get the current branch name and find the associated PR number using `gh pr view --json number`
2. Get the PR title using `gh pr view --json title`
3. Get all commits on this branch vs main: `git log origin/main..HEAD --oneline`
4. Analyze the commits and PR to understand the full scope of changes

## Output Format

Generate a commit message in this format:

```
<type>: <PR title> (#<PR number>)

<1-2 sentence explanation of the "why" or high-level purpose>

- <Specific change as concise fragment>
- <Another change>
- ...
```

Guidelines:
- Use conventional commit prefix matching the change type (e.g., `feat:`, `fix:`, `refactor:`, `chore:`, `docs:`)
- Follow any commit conventions specified in the project's CLAUDE.md
- Opening paragraph explains purpose/motivation briefly
- Bullets list specific implementation details as fragments (not full sentences)
- Use present tense ("Add...", "Fix...", "Update...")
- Group related bullets under subheadings if needed (e.g., "Implementation:")
- Keep bullets concise - no need for complete sentences

## Final Step

Copy the commit message to the clipboard using `pbcopy` and confirm it was copied.
