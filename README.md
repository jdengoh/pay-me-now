# my-project-template

A Telegram bot for group chats: reads polls, posts messages, and lets me update shared data everyone can view.

[![Python](https://img.shields.io/badge/Python-3.14+-3776AB?style=for-the-badge&logo=python&logoColor=white)](https://python.org)
[![uv](https://img.shields.io/badge/uv-DE5FE9?style=for-the-badge&logo=astral&logoColor=white)](https://docs.astral.sh/uv/)

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Project Structure](#project-structure)
  - [Folder Structure](#folder-structure)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
- [Environment Variables](#environment-variables)
- [Development](#development)
- [Contributors](#contributors)
- [License](#license)

## Overview <a id="overview"></a>

TODO: Overview

## Features <a id="features"></a>

TODO: Features

## Project Structure <a id="project-structure"></a>

### Folder Structure <a id="folder-structure"></a>

```sh
src/pay_me_now/   # Application package
scripts/          # Utility scripts (git hooks, branch checks)
.github/          # Workflows, issue and PR templates
docs/agents/      # Config for agent skills
README.md         # Its THE readme you are reading!
```

## Getting Started <a id="getting-started"></a>

### Prerequisites <a id="prerequisites"></a>

- [Python 3.14 or higher](https://www.python.org/downloads/)
- [uv](https://docs.astral.sh/uv/getting-started/installation/) package and project manager

### Install

```sh
uv sync
```

## Environment Variables <a id="environment-variables"></a>

TODO: Environment variables (e.g. the Telegram bot token). Never commit a real `.env` file.

## Development <a id="development"></a>

Install the dev tooling and wire up the Git hooks (pre-commit, commitlint, branch name check):

```sh
uv sync
./scripts/setup_hooks.sh
```

Branch names must match `main`, `staging`, `release/yyyy-mm-dd`, or `feature|fix|bugfix|hotfix|data|function|job/<name>`. Commits follow [Conventional Commits](https://www.conventionalcommits.org/).

## Contributors <a id="contributors"></a>

TODO: List contributors

## License

MIT
