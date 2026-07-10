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
