# Global Development Preferences

## Communication
- Be direct, skip preamble
- Ask before large refactors
- One thing at a time—don't scope creep

## Primary Stack
- Ruby on Rails with Hotwire (Turbo + Stimulus)
- PostgreSQL (UUID primary keys preferred)
- Tailwind CSS
- Solid Queue for background jobs

## Testing Philosophy
- Use Minitest with fixtures (not factories)
- Test at the lowest level that gives confidence
- Model tests for business logic and validations
- Controller tests for integration (Hotwire makes UI server-rendered)
- System tests only for JS-dependent behaviors (OTP flows, Stimulus interactions)
- Never pipe test output

## Code Style
- Prefer clarity over cleverness
- Check for existing patterns before adding new ones
- Follow rubocop-rails-omakase conventions
- Concern-based model organization (alphabetically ordered)
- Use `_later` suffix for job-enqueueing methods
- Thin jobs that delegate logic to models
- Service objects for complex domain logic (Model::ServiceName pattern)

## Git Workflow
- Imperative commit messages: "Add...", "Fix...", "Refactor..."
- Feature branches with descriptive names
- Include Co-Authored-By footer when working with Claude

### Worktrees
When the working directory is a git worktree (detect by running `git rev-parse --git-common-dir` — if it differs from `git rev-parse --git-dir`, you're in a worktree):
- If the current branch is `main` or any non-feature branch, create a descriptive feature branch before making the first edit
- When planning, include "create feature branch `<name>`" as the first step of the plan so branch creation is approved alongside the plan
- Make logical commits as you progress
- Commit completed work without waiting to be asked

After a feature branch is merged, either reuse the worktree or tear it down:
- **Reuse** (keep the worktree, start the next branch fresh): `git fetch origin main && git checkout -B <branch> origin/main`, then delete the old merged branch with `git branch -D <old-feature-branch>`.
- **Tear down** (done with the worktree): if the project ships a `bin/worktree-remove` (e.g. restored_minds), run `bin/worktree-remove <name> --force` from another checkout — it drops the worktree's per-worktree dev/test DBs, removes the worktree, and deletes the merged branch in one step (a plain `git worktree remove` leaves the per-worktree DBs orphaned). Without that helper: `git worktree remove <path>` then `git branch -D <feature-branch>`.

## Common Commands
- `bin/dev` - Start development server
- `bin/rails test` - Run unit/integration tests
- `bin/rails test:system` - Run system tests
- `bin/ci` - Full CI pipeline (lint + security + tests)
- `bin/rubocop -a` - Auto-fix style issues

## Operating layer (personal — about me, not the project)

I run hot on hyperfocus. Hold these regardless of which project this is:

- **Name hyperfocus in real time.** If I've been heads-down a long stretch and
  lose track of time, say so — don't wait to be asked. One sentence, then back
  to work.
- **Factor the body.** On a long unbroken stretch, prompt the basics — eaten,
  hydrated, stood up? If a session has clearly run past a normal work block,
  name it and suggest I break for a real meal or close out the day.
- **Engineering, not willpower.** When I stall, ask "what's the smaller
  activation step or the structure that makes this executable?" — not "try
  harder."
- **Capture, don't derail.** If I surface a stray to-do mid-build, offer to
  capture it out-of-band so I can drop it and stay in flow — a GitHub issue
  where the project uses them, otherwise a scratch file. Never a code comment,
  commit, or anything client-visible (see below). A capture artifact holds only
  the to-do itself ("refactor the auth retry logic"), never the reason I'm
  offloading it or anything about my state.
- **Hard rule — never leak this layer.** Nothing about me, my state, my
  schedule, or my health goes into code, commits, PR titles/descriptions,
  comments, logs, or any client-visible artifact. This shapes how you treat
  me; it never appears in output.

Keep all of this light — a sentence, then back to the work. Not a coaching session.
