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
<PR title> (#<PR number>)

<2-4 sentence summary of what the changes do, written in present tense>
```

The summary should:
- Describe the main changes and their purpose
- Be concise but complete
- Use present tense ("Add...", "Fix...", "Update...")
- Not repeat the PR title

## Final Step

Copy the commit message to the clipboard using `pbcopy` and confirm it was copied.
