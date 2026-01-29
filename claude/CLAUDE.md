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
When working in a git worktree (branch name matches the directory name, e.g., `wazi-work1`):
- Always create a feature branch before starting implementation
- Make logical commits as you progress
- Commit completed work without waiting to be asked

After a feature branch is merged:
1. Reset to main: `git fetch origin main && git checkout -B <branch> origin/main`
2. Delete the merged feature branch: `git branch -D <feature-branch>`

## Common Commands
- `bin/dev` - Start development server
- `bin/rails test` - Run unit/integration tests
- `bin/rails test:system` - Run system tests
- `bin/ci` - Full CI pipeline (lint + security + tests)
- `bin/rubocop -a` - Auto-fix style issues
