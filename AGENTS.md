# Repository Instructions

## Purpose

This repository contains reusable GitHub Actions workflows for PHP projects. It is not a PHP application repository, so most changes should focus on `.github/workflows`, `.github/linters`, and the documentation.

## Change Rules

- Keep existing comments. Remove a comment only when it is a TODO that was solved, or translate it to English when needed.
- Update `CHANGELOG.md` in English whenever behavior, documentation, or workflow maintenance changes.
- Keep `README.md` examples in sync when workflow inputs or public behavior change.
- Review workflow edits for security issues: prefer least-privilege `permissions`, avoid exposing secrets in logs, and be deliberate when keeping checkout credentials available.

## Windows Shell Usage

On Windows, do not run `.sh` helper scripts directly from PowerShell. Use Git Bash explicitly, for example:

```powershell
& "C:\Program Files\Git\bin\bash.exe" -lc "./blast.sh phpstan"
& "C:\Program Files\Git\bin\bash.exe" -lc "./blast.sh phpstan-remove"
```

## Composer

When running Composer locally, use the repository cache directory:

```powershell
$env:COMPOSER_CACHE_DIR = "$PWD\.composer-cache"
php "C:\ProgramData\ComposerSetup\bin\composer.phar" install
```

Do not modify Composer itself and do not run `composer self-update`.

## Python Tests

When running Python tests in this workspace, use:

```powershell
python -m pytest -q -p no:cacheprovider --basetemp=.tmp/pytest
```

Do not load pytest's cache plugin. Do not inspect, lint, or recurse into `.tmp`, `.pytest-tmp`, `.pytest_cache`, `.venv`, or build artifacts. If pytest temp cleanup fails on Windows, remove only `.tmp/pytest` and rerun tests serially.
