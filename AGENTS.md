# Repository Instructions

## Purpose

This repository contains reusable GitHub Actions workflows for PHP projects. It is not a PHP application repository, so most changes should focus on `.github/workflows`, `.github/linters`, and the documentation.

## Change Rules

- Keep existing comments. Remove a comment only when it is a TODO that was solved, or translate it to English when needed.
- Update `CHANGELOG.md` in English whenever behavior, documentation, or workflow maintenance changes. Start each entry with a present-tense verb and append it to the relevant section under `Unreleased` unless a release is being prepared.
- Keep `README.md` examples and workflow usage comments in sync when inputs, defaults, required caller permissions, or public behavior change. Put explanations next to the relevant workflow documentation.
- Preserve compatibility for repositories calling these workflows. Document breaking changes and retain deprecated workflows unless their removal is explicitly requested.
- Review workflow edits for security issues: use the minimum required `permissions`, avoid exposing secrets in logs, and keep checkout credentials available only when later steps need them.
- Pass untrusted values to shell steps through environment variables and quote their expansions instead of interpolating GitHub expressions directly into shell commands.
- Keep workflow shell settings explicit and consistent with the commands being run.
- Validate changed YAML and embedded shell commands with available tooling, and check documentation against the workflow definitions. Report which checks ran and any validation limits; local checks do not establish that a reusable workflow succeeds in a caller repository.
- Do not install application dependencies or run PHP/Python application test suites for this repository; those belong to the consuming projects. Use checks relevant to the files changed here.
