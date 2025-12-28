!/bin/sh

# =========================
# prevent no staged commits
# =========================

if git diff --cached --quiet; then
    echo "No changes staged for commit. Please stage files first."
    exit 1
fi
