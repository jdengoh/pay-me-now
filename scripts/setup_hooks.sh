#!/usr/bin/env bash

echo "🛠️ Setting up Git hooks for the project..."

# Reset hooks path to default in case it was overridden previously
git config --unset core.hooksPath 2>/dev/null || true

# 1. Check for pre-commit and install if missing
if ! command -v pre-commit &> /dev/null; then
    echo "📦 pre-commit not found. Attempting to install..."
    if command -v brew &> /dev/null; then
        echo "Using Homebrew..."
        brew install pre-commit
    elif command -v pipx &> /dev/null; then
        echo "Using pipx..."
        pipx install pre-commit
    elif command -v pip3 &> /dev/null; then
        echo "Using pip3..."
        pip3 install --user pre-commit
    else
        echo "❌ Error: Could not automatically install pre-commit."
        echo "Please install it manually: https://pre-commit.com/#install"
        exit 1
    fi
else
    echo "✅ pre-commit is already installed."
fi

# 2. Wire up all configured hook types in one shot and pre-warm environments
# (hook types are read from `default_install_hook_types` in .pre-commit-config.yaml)
echo "🔧 Wiring up pre-commit hooks..."
if pre-commit install --install-hooks; then
    echo "✅ Git hooks installed and environments pre-warmed."
else
    echo "❌ Failed to install pre-commit hooks."
    exit 1
fi

echo "🎉 Git hooks setup completed successfully!"
echo "💡 Tip: Run 'pre-commit run --all-files' to format your repo for the first time."
