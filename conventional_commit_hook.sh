#!/bin/sh

# ============================
# Enforce Conventional Commits
# ============================

# Commit message file
COMMIT_MSG_FILE=$1
COMMIT_MSG=$(cat "$COMMIT_MSG_FILE")

# Regex pattern for Conventional Commits
PATTERN="^(feat|fix|refactor|style|chore|test|docs|WIP)(\([a-zA-Z0-9_-]+\))?: .+"

# Check if commit message matches the pattern
if ! echo "$COMMIT_MSG" | grep -Eq "$PATTERN"; then
    echo "Invalid commit message format."
    echo "Your commit message should follow Conventional Commits:"
    echo "  <type>[optional scope]: <description>"
    echo ""
    
    echo "Allowed types:"
    echo "  feat: new feature (code changes)"
    echo "  fix: bug fix (code changes)"
    echo "  refactor: performance improvements without new features or bug fixes (code changes)"
    echo "  style: formatting, whitespace, semicolons, etc. (code changes)"
    echo "  chore: build, tooling, dependency updates, configs, etc. (no code changes)"
    echo "  test: adding or fixing tests"
    echo "  docs: documentation"
    echo "  WIP: work in progress"
    echo ""
    
    echo "Example: feat(auth): add login endpoint"
    exit 1
fi
