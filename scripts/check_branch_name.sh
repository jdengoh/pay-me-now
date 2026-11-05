#!/usr/bin/env bash

BRANCH_NAME=$(git rev-parse --abbrev-ref HEAD)
VALID_BRANCH_REGEX="^(main|staging|release\/[0-9]{4}-[0-9]{2}-[0-9]{2}|feature\/.+|fix\/.+|bugfix\/.+|hotfix\/.+|data\/.+|function\/.+|job\/.+)$"

if [[ ! $BRANCH_NAME =~ $VALID_BRANCH_REGEX ]]; then
    echo "❌ Error: Branch name '$BRANCH_NAME' does not follow the naming convention."
    echo "Please use one of the following patterns:"
    echo "  - main"
    echo "  - staging"
    echo "  - release/yyyy-mm-dd"
    echo "  - feature/xxx"
    echo "  - fix/xxx"
    echo "  - bugfix/xxx"
    echo "  - hotfix/xxx"
    echo "  - data/xxx"
    echo "  - function/xxx"
    echo "  - job/xxx"
    exit 1
fi

echo "✅ Branch name is valid. Proceeding with push!"
exit 0
